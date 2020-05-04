unit diagram_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,data_moudule, Data.DB, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,IBX.IBQuery;

type
  TDIAGRAM_FORM = class(TForm)
    DateTimePicker_from: TDateTimePicker;
    DateTimePicker_to: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button_update: TButton;
    DataSource1: TDataSource;
    Image_daily_income: TImage;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    procedure Button_updateClick(Sender: TObject);
  private
    { Private declarations }
    procedure draw_purchase;
    procedure draw_coords_purchase(margin : extended);
  public
    { Public declarations }
  end;

var
  DIAGRAM_FORM: TDIAGRAM_FORM;

implementation

{$R *.dfm}

function max_purchase : integer;
var count,i,max : integer;
begin
  with dm.qGet_global_period_purchase do begin
    last;
    count := RecordCount;
    first;

    max := 0;
    for I := 0 to count - 1 do begin
      if max < FieldByName('PRICE').AsInteger then
        max := FieldByName('PRICE').AsInteger;
      next;
    end;
  end;

   result := max;

end;

procedure TDIAGRAM_FORM.draw_purchase();
var max, h,w, record_count,i ,x ,y, price, rect_side : integer;
margin : extended;
begin
  image_daily_income.Picture := nil;

  margin := 0.15;

   max := max_purchase;
   h := Image_daily_income.Height;
   w := Image_daily_income.Width;
   rect_side := 5;

   draw_coords_purchase(margin);

   with dm.qGet_global_period_purchase do begin
        last;
         record_count := RecordCount;

         if record_count <> 0 then begin
              // begin to draw
              First;
              price := FieldByName('PRICE').asInteger;

             if record_count = 1 then
             begin
                y := round( margin * h + (1 - price / max) * h * (1 - 2 * margin));
                x := round( w / 2) ;
                Image_daily_income.Canvas.Brush.Color := clBlack;
                Image_daily_income.Canvas.Rectangle(x - (rect_side div 2),y - (rect_side div 2),
                x + (rect_side div 2),y + (rect_side div 2) );
                Image_daily_income.Canvas.Pixels[x,y] := clBlack;
             end
             else
             for I := 0 to record_count - 1 do begin

                y := round( margin * h + (1 - price / max) * h * (1 - 2 * margin));
                x := round( margin * w + i * ( ( w * ( 1 - 2 * margin) ) / (record_count-1) ) );

                // draw rect
                Image_daily_income.Canvas.Brush.Color := clBlack;
                Image_daily_income.Canvas.Rectangle(x - (rect_side div 2),y - (rect_side div 2),
                x + (rect_side div 2),y + (rect_side div 2) );

                if i = 0 then
                  Image_daily_income.Canvas.MoveTo(x,y)
                else
                  Image_daily_income.Canvas.LineTo(x,y);
                Next;
                price := FieldByName('PRICE').asInteger;
             end;

         end;
   end;


end;

 procedure TDIAGRAM_FORM.draw_coords_purchase(margin: extended);
 var max, h,w, record_count,i ,x ,y, price,rect_side, noth_len, text_h : integer;
  cur_date : TDate;
  coord_margin : extended;
 begin
  max := max_purchase;
   h := Image_daily_income.Height;
   w := Image_daily_income.Width;
   rect_side := 10;
   noth_len := 10;
   text_h := 10;
   coord_margin := margin * (2/3);

   // draw coords lines
   Image_daily_income.Canvas.MoveTo(round(coord_margin*w),0);
   Image_daily_income.Canvas.LineTo(round(coord_margin*w),h);
   Image_daily_income.Canvas.MoveTo(0,round(h*(1-coord_margin)));
   Image_daily_income.Canvas.LineTo(w,round(h*(1-coord_margin)));


   with dm.qGet_global_period_purchase do begin
        last;
         record_count := RecordCount;


         if record_count <> 0 then begin
              // begin to draw
               First;
               price := FieldByName('PRICE').asInteger;
               cur_date := FieldByName('THE_DATE').value;
               if record_count = 1 then
               begin
                  y := round( margin * h + (1 - price / max) * h * (1 - 2 * margin));
                  x := round( w / 2) ;

                  // draw date
                  Image_daily_income.Canvas.MoveTo(x,round(h-coord_margin*h-noth_len));
                  Image_daily_income.Canvas.LineTo(x,round(h-coord_margin*h+noth_len));
                  Image_daily_income.Canvas.TextOut(round(x-noth_len * 2.5),round(h-coord_margin*h+text_h),dateToStr(cur_date));
                  // draw price
                  Image_daily_income.Canvas.MoveTo(round(coord_margin*w-noth_len),y);
                  Image_daily_income.Canvas.LineTo(round(coord_margin*w+noth_len),y);
                  Image_daily_income.Canvas.TextOut(round(coord_margin*w-text_h*1.5),y-text_h,intToStr(price));


               end
               else
               for I := 0 to record_count - 1 do begin

                  y := round( margin * h + (1 - price / max) * h * (1 - 2 * margin));
                  x := round( margin * w + i * ( ( w * ( 1 - 2 * margin) ) / (record_count-1) )  );

                  // draw date
                  Image_daily_income.Canvas.MoveTo(x,round(h-coord_margin*h-noth_len));
                  Image_daily_income.Canvas.LineTo(x,round(h-coord_margin*h+noth_len));
                  Image_daily_income.Canvas.TextOut(round(x-noth_len * 2.5),round(h-coord_margin*h+text_h),dateToStr(cur_date));
                  // draw price
                  Image_daily_income.Canvas.MoveTo(round(coord_margin*w-noth_len),y);
                  Image_daily_income.Canvas.LineTo(round(coord_margin*w+noth_len),y);
                  Image_daily_income.Canvas.TextOut(round(coord_margin*w-text_h*1.5),y-text_h,intToStr(price));

                  Next;
                  price := FieldByName('PRICE').asInteger;
                  cur_date := FieldByName('THE_DATE').value;
               end;
         end;
   end;

 end;


procedure TDIAGRAM_FORM.Button_updateClick(Sender: TObject);
begin
  // setup purchase params
  dm.qGet_global_period_purchase.ParamByName('IN_DATE_BEGIN_DATE').Value :=
  DateTimePicker_from.Date;
  dm.qGet_global_period_purchase.ParamByName('IN_DATE_END_DATE').Value :=
  DateTimePicker_To.Date;
  // update all
  dm.update_all;
  // draw daily_income
  draw_purchase;

end;

end.
