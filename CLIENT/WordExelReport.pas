unit WordExelReport;

interface
procedure create_invoice();
procedure create_loss();
procedure create_daily_income();
procedure create_exel();

implementation
uses comObj, data_moudule,  sysutils,wordXP, excelXP,exel_input_window;

procedure create_invoice();
var
sheet: OleVariant;
   Ap : Variant;
   i,j ,sum,totalsum,price,id, shift,header, provider_count, product_count: integer;
   the_date : TDate;
   columnN : string;
begin

  Ap := CreateOleObject('Excel.Application');
  sheet := Ap.Workbooks.Add;
  shift := 2;
  header := 1;
  // setup id and data
  id := dm.TPurchase_inv.FieldByName('ID').value;
  the_date :=  dm.TPurchase_inv.FieldByName('THE_DATE').value;
  // Get provider count
  dm.qPurchase_inv_item_only_povider.ParamByName('in_purchase_id').Value
  := id;

  // update it
  dm.qPurchase_inv_item_only_povider.close;
  dm.qPurchase_inv_item_only_povider.Open;

  // get providers count
  dm.qPurchase_inv_item_only_povider.Last;
  provider_count := dm.qPurchase_inv_item_only_povider.RecordCount;
  dm.qPurchase_inv_item_only_povider.First;
  // for each provider
  for i := 0 to provider_count - 1 do
  begin
         Ap.Range['C' + inttostr(shift)] :=
           'ТОВАРНО-ТРАНСПОРТНАЯ НАКЛАДНАЯ';
         Ap.Range['B' + inttostr(shift + 1)] := 'Грузоотправитель';
         Ap.Range['D' + inttostr(shift + 1)] :=
          dm.qPurchase_inv_item_only_povider.FieldByName('PROVIDER_NAME').AsString;
          //Ap.Range['B' + inttostr(shift + 2)] := 'Грузополучатель';
          //Ap.Range['B' + inttostr(shift + 3)] := 'Плательщик';
          columnN :=  inttostr(shift + header + 1);
          Ap.Range['B' + columnN] := '№ товарной позиции';
          Ap.Range['C' + columnN] :=  'Наименование товара';
          Ap.Range['D' + columnN]  := 'Цена';
          Ap.Range['E' + columnN]  := 'Количество';
          Ap.Range['F' + columnN]  := 'Сумма';

          // Get all products from purchase of this provider
          dm.qPurchase_inv_item_filered_prov.
              ParamByName('in_purchase_id').Value := id;
          dm.qPurchase_inv_item_filered_prov.
            ParamByName('in_provider_id').Value :=
                dm.qPurchase_inv_item_only_povider.FieldByName('PROVIDER_ID').value;


          with dm.qPurchase_inv_item_filered_prov do begin
             // Update  qPurchase_inv_item_only_povider
            close;
            open;
            last;
            product_count :=  RecordCount;
            first;

              totalsum := 0;
              for j := 2 to product_count + 1 do
              begin
                 columnN :=  inttostr(shift + j + header);
                Ap.range['B' + columnN] :=  intToStr(j-1);
                Ap.range['C' + columnN] :=
                  FieldByName('PRODUCT_NAME').AsString;
                Ap.range['D' + columnN] :=
                  FieldByName('PRICE').AsString;
                Ap.range['E' +columnN] :=
                  FieldByName('PRODUCT_COUNT').AsString;

                sum := FieldByName('PRICE').AsInteger;
                sum := sum * FieldByName('PRODUCT_COUNT').Asinteger;
                totalsum := totalsum + sum;
                 Ap.range['F' + columnN] := intToStr(sum);

                next;
              end;
          end;

        // Add new list
        if  i <> provider_count - 1 then
        sheet.WorkSheets.Add;

        // Go to the next provider
        dm.qPurchase_inv_item_only_povider.Next;
  end;







  Ap.DisplayAlerts := False;
  Ap.Visible := True;

end;
 {var
 title,text : string;
 MS_Word: Variant;
 i,j ,sum,totalsum,price,id: integer;
 the_date : TDate;
begin
      // Get loss info
      id := dm.TDaily_income.FieldByName('ID').value;
      the_date :=  dm.TDaily_income.FieldByName('THE_DATE').value;
     dm.QDaily_incomeWithPrice.ParamByName('in_daily_income_id').value := id;

     dm.update_all;

     dm.TDaily_income.Locate('ID',id,[]);
     dm.QDaily_incomeWithPrice.Last;


    try
    MS_Word:=CreateOleObject('Word.Application');
    MS_Word.Visible:=true;
    MS_Word.Documents.Add;
    MS_Word.Selection.Start:=20;

    MS_Word.ActiveDocument.Range.InsertAfter('  ТОВАРНЫЙ ЧЕК ОТ ' + dateToStr(date));
    MS_Word.ActiveDocument.Range.InsertAfter(#13#10);

    MS_Word.ActiveDocument.Tables.Add(
     MS_Word.ActiveDocument.Range.Characters.Last,dm.QDaily_incomeWithPrice.RecordCount+1,6);

    MS_Word.ActiveDocument.Tables.Item(1).Borders.InsideLineStyle:=wdLineStyleSingle;
    MS_Word.ActiveDocument.Tables.Item(1).Borders.OutsideLineStyle:=wdLineStyleSingle;



    MS_Word.ActiveDocument.Tables.Item(1).Cell(1,1).Range.Text:='№ товарной позиции';
    MS_Word.ActiveDocument.Tables.Item(1).Cell(1,2).Range.Text:='Наименование товара';
    MS_Word.ActiveDocument.Tables.Item(1).Cell(1,3).Range.Text:='Производитель';
    MS_Word.ActiveDocument.Tables.Item(1).Cell(1,4).Range.Text:='Цена';
    MS_Word.ActiveDocument.Tables.Item(1).Cell(1,5).Range.Text:='Количество';
    MS_Word.ActiveDocument.Tables.Item(1).Cell(1,6).Range.Text:='Сумма';

    dm.QDaily_incomeWithPrice.first;

    totalsum := 0;
    for i := 2 to dm.QDaily_incomeWithPrice.RecordCount+1 do
    begin



      MS_Word.ActiveDocument.Tables.Item(1).Cell(i,1).Range.Text:= intToStr(i-1);
      MS_Word.ActiveDocument.Tables.Item(1).Cell(i,2).Range.Text:=dm.QDaily_incomeWithPrice.FieldByName('PRODUCT_NAME').AsString;
      MS_Word.ActiveDocument.Tables.Item(1).Cell(i,3).Range.Text:=dm.QDaily_incomeWithPrice.FieldByName('PROVIDER_NAME').AsString;
      MS_Word.ActiveDocument.Tables.Item(1).Cell(i,4).Range.Text:= dm.QDaily_incomeWithPrice.FieldByName('PRICE').AsString;
      MS_Word.ActiveDocument.Tables.Item(1).Cell(i,5).Range.Text:=dm.QDaily_incomeWithPrice.FieldByName('PRODUCT_COUNT').AsString;

      sum := dm.QDaily_incomeWithPrice.FieldByName('PRICE').AsInteger;
      sum := sum * dm.QDaily_incomeWithPrice.FieldByName('PRODUCT_COUNT').Asinteger;
      totalsum := totalsum + sum;
      MS_Word.ActiveDocument.Tables.Item(1).Cell(i,6).Range.Text:= intToStr(sum);

      dm.QDaily_incomeWithPrice.next;
    end;

    MS_Word.ActiveDocument.Range.InsertAfter(' ИТОГО  ' + inttostr(totalsum) + ' руб.');
    MS_Word.ActiveDocument.Range.InsertAfter(#13#10);

    MS_Word.Visible:=true;
    MS_Word.DisplayAlerts := False;
  except
    MS_Word.DisplayAlerts := False;
    MS_Word.Quit;
  end;

end;
  }

procedure create_loss();
begin

end;


procedure create_daily_income();
begin

end;



procedure create_exel();
Var
   varDiagram_sell, varDiagram_loss, sheet: OleVariant;
   Ap : Variant;
  provider_id,i, j,hight,hight_sell, hight_loss, price_before,price_after, count_before, count_after, purch_before,
  purch_after, sell_before,sell_after, loss_before, loss_after, d_income_before,
  d_income_after,k, provider_count: integer;
begin
  Ap := CreateOleObject('Excel.Application');
  sheet := Ap.Workbooks.Add;

   // Цикл по всем производителям
  dm.qlist.Last;
  provider_count := dm.qlist.RecordCount;
  dm.qlist.First;
  for k := 0 to provider_count - 1 do begin

      //ap.ActiveWorkbook.name := inttostr(k);// dm.qlist.FieldByName('PROVIDER_NAME').asString;
      Ap.Range['B1'] := 'Производитель - ' + dm.qlist.FieldByName('PROVIDER_NAME').asString;
      Ap.Range['B2'] := 'Начало периода';
      Ap.Range['C2'] := DateTimeToStr(exel_input_form.DateTimeFrom.Date);
      Ap.Range['D2'] := 'Конец периода - ';
      Ap.Range['E2'] := DateTimeToStr(exel_input_form.DateTimeTO.Date);
      Ap.Range['B3;D3'] := 'Кол-во товара';
      Ap.Range['C3;E3'] := 'Сумма остатков';
      Ap.Range['F2'] := 'За период';
      Ap.Range['F3'] := 'Получили товаров';
      Ap.Range['G3'] := 'Продали товара';
      Ap.Range['H3'] := 'Списали товара';
      Ap.Range['A3'] := 'Товары:';

      // Находим все товары производителя
      dm.QGetProvider_products.ParamByName('IN_PROVIDER_ID').Value :=
      dm.qList.FieldByName('PROVIDER_ID').Value;
      provider_id := dm.qList.FieldByName('PROVIDER_ID').Value;
      dm.update_all;
      dm.QGetProvider_products.Last;
      hight :=    dm.QGetProvider_products.RecordCount;
      dm.QGetProvider_products.First;
      // Для всех товаров производителя
      for i := 0 to hight-1 do begin


        // Получить кол-во товаров на первую дату
        // exec get_count
        dm.spGetCount.ParamByName('IN_PRODUCT_ID').Value :=
        dm.QGetProvider_products.FieldByName('ID').Value;

        dm.spGetCount.ParamByName('IN_DATE').Value :=
        exel_input_form.DateTimeFrom.Date;

        if not dm.spGetCount.Transaction.InTransaction then
              dm.spGetCount.Transaction.StartTransaction;
            dm.spGetCount.ExecProc;

            // Got result from bd procedure
            count_before :=dm.spGetCount.ParamByName('OUT_COUNT').AsInteger;
            purch_before :=dm.spGetCount.ParamByName('OUT_PURCH').AsInteger;
            loss_before := dm.spGetCount.ParamByName('OUT_LOSS').AsInteger;
            sell_before := dm.spGetCount.ParamByName('OUT_DAILY_INCOME').AsInteger;
            dm.spGetCount.Transaction.Commit;

        // end exec get_count
        dm.update_all;

        dm.QGetProvider_products.first;
        for j := 0 to i-1 do
            dm.QGetProvider_products.Next;
        // Получить цену на первую дату
        // exec get_price
        dm.spGetPrice.ParamByName('IN_PRODUCT_ID').Value:=
           dm.QGetProvider_products.FieldByName('ID').Value;

          dm.spGetPrice.ParamByName('IN_DATE').Value :=
          exel_input_form.DateTimeFrom.Date;

            // Execute the procedure
            if not dm.spGetPrice.Transaction.InTransaction then
              dm.spGetPrice.Transaction.StartTransaction;
            dm.spGetPrice.ExecProc;

            // Got result from bd procedure
            price_before:=dm.spGetPrice.ParamByName('OUT_PRICE').AsInteger;
            dm.spGetPrice.Transaction.Commit;


        // end get_price

        dm.update_all;

        dm.QGetProvider_products.first;
        for j := 0 to i-1 do
            dm.QGetProvider_products.Next;


        ap.Range[ 'A' + inttostr(i+4)] := dm.QGetProvider_products.FieldByName('PRODUCT_NAME').AsString;
        ap.Range[ 'B' + inttostr(i+4)] := count_before;
        ap.Range[ 'C' + inttostr(i+4)] := count_before * price_before;

        // Вычисляем кол-во товаров на вторую дату
        // exec get_count
        dm.spGetCount.ParamByName('IN_PRODUCT_ID').Value :=
        dm.QGetProvider_products.FieldByName('ID').Value;

        dm.spGetCount.ParamByName('IN_DATE').Value :=
        exel_input_form.DateTimeTo.Date;

        if not dm.spGetCount.Transaction.InTransaction then
              dm.spGetCount.Transaction.StartTransaction;
            dm.spGetCount.ExecProc;

            // Got result from bd procedure
            count_after :=dm.spGetCount.ParamByName('OUT_COUNT').AsInteger;
            purch_after :=dm.spGetCount.ParamByName('OUT_PURCH').AsInteger;
            loss_after := dm.spGetCount.ParamByName('OUT_LOSS').AsInteger;
            sell_after := dm.spGetCount.ParamByName('OUT_DAILY_INCOME').AsInteger;
            dm.spGetCount.Transaction.Commit;

        // end exec get_count
        dm.update_all;

        dm.QGetProvider_products.first;
        for j := 0 to i-1 do
            dm.QGetProvider_products.Next;
        //  Получить цену на вторую дату
        // exec get_price
        dm.spGetPrice.ParamByName('IN_PRODUCT_ID').Value:=
           dm.QGetProvider_products.FieldByName('ID').Value;

          dm.spGetPrice.ParamByName('IN_DATE').Value :=
          exel_input_form.DateTimeTo.Date;

            // Execute the procedure
            if not dm.spGetPrice.Transaction.InTransaction then
              dm.spGetPrice.Transaction.StartTransaction;
            dm.spGetPrice.ExecProc;

            // Got result from bd procedure
            price_after:=dm.spGetPrice.ParamByName('OUT_PRICE').AsInteger;
            dm.spGetPrice.Transaction.Commit;


        // end get_price

        dm.update_all;

        dm.QGetProvider_products.first;
        for j := 0 to i-1 do
            dm.QGetProvider_products.Next;

        ap.Range[ 'D' + inttostr(i+4)] := count_after;
        ap.Range[ 'E' + inttostr(i+4)] := count_after * price_after;
        ap.Range[ 'F' + inttostr(i+4)] := purch_after - purch_before;
        ap.Range[ 'G' + inttostr(i+4)] := sell_after - sell_before;
        ap.Range[ 'H' + inttostr(i+4)] := loss_after - loss_before;
        dm.QGetProvider_products.Next;
      end;



      // Заполняем данные
      // Вычисляем продажи за период
        dm.QGet_Period_Daily_income.ParamByName('IN_PROVIDER_ID').Value :=
      provider_id;

      dm.QGet_Period_Daily_income.ParamByName('IN_DATE_BEGIN_DATE').Value :=
      exel_input_form.DateTImeFrom.Date;

      dm.QGet_Period_Daily_income.ParamByName('IN_DATE_END_DATE').Value :=
      exel_input_form.DateTimeTo.Date;

      // Записываем в лист
      dm.update_all;
      dm.QGet_Period_Daily_income.Last;
      hight_sell :=    dm.QGet_Period_Daily_income.RecordCount;
      dm.QGet_Period_Daily_income.first;
       ap.Range['J3'] := 'Продажи';
       ap.Range['K3'] := 'Руб';
      for I := 0 to hight_sell - 1  do begin
           ap.Range['J' + inttostr(i+4)] := dm.QGet_Period_Daily_income.FieldByName('THE_DATE').asString;
           ap.Range['K' + inttostr(i+4)] := dm.QGet_Period_Daily_income.FieldByName('PRICE').Value;

          // varDiagram_sell.SeriesCollection (i) :=
           //dm.QGet_Period_Daily_income.FieldByName('THE_DATE').asString;

           dm.QGet_Period_Daily_income.next;
      end;


      // Вычисляем списания   за период
      dm.QGet_Period_Loss.ParamByName('IN_PROVIDER_ID').Value :=
      provider_id;

      dm.QGet_Period_Loss.ParamByName('IN_DATE_BEGIN_DATE').Value :=
      exel_input_form.DateTimeFrom.Date;

      dm.QGet_Period_Loss.ParamByName('IN_DATE_END_DATE').Value :=
      exel_input_form.DateTimeTo.Date;

       // Записываем в лист
      dm.update_all;
      dm.QGet_Period_Loss.Last;
      hight_loss :=    dm.QGet_Period_Loss.RecordCount;
      dm.QGet_Period_Loss.first;
      ap.Range['L3'] := 'Списания';
      ap.Range['M3'] := 'Руб';
      for I := 0 to hight_loss - 1  do begin
           ap.Range['L' + inttostr(i+4)] := dm.QGet_Period_Loss.FieldByName('THE_DATE').asString;
           ap.Range['M' + inttostr(i+4)] := dm.QGet_Period_Loss.FieldByName('PRICE').Value;

           // varDiagram_loss.SeriesCollection (i) :=
           // dm.QGet_Period_Loss.FieldByName('THE_DATE').asString;

           dm.QGet_Period_Loss.next;
      end;


      // next provider on next sheet
      for I := 0 to k do
            dm.qlist.next;
      // ;))))))))
      if  k <> provider_count - 1 then
        sheet.WorkSheets.Add;

  end;




  Ap.DisplayAlerts := False;
  Ap.Visible := True;
end;

end.
