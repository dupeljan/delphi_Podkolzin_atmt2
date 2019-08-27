unit main_menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.CheckLst, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TMAIN_MENU_FORM = class(TForm)
    MainMenu1: TMainMenu;
    MENU_PROVIDER: TMenuItem;
    MENU_PRODUCT: TMenuItem;
    N1: TMenuItem;
    MENU_PURCHASE_INV_ADD: TMenuItem;
    MENU_LOSS_ADD: TMenuItem;
    MENU_DAILY_INCOME_ADD: TMenuItem;
    MENU_DELETE_INV: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    DBGrid_inv: TDBGrid;
    DBGrid_inv_item: TDBGrid;
    DataSource_inv: TDataSource;
    DataSource_inv_item: TDataSource;
    ComboBox_inv: TComboBox;
    procedure MENU_PROVIDERClick(Sender: TObject);
    procedure MENU_PRODUCTClick(Sender: TObject);
    procedure MENU_PURCHASE_INV_ADDClick(Sender: TObject);
    procedure MENU_LOSS_ADDClick(Sender: TObject);
    procedure MENU_DAILY_INCOME_ADDClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox_invChange(Sender: TObject);
    procedure DBGrid_invCellClick(Column: TColumn);
    procedure MENU_DELETE_INVClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MAIN_MENU_FORM: TMAIN_MENU_FORM;

implementation

{$R *.dfm}

uses provider_window, product_window, inv_window, loss_window,
  daily_income_window, data_moudule, WordExelReport;

procedure TMAIN_MENU_FORM.ComboBox_invChange(Sender: TObject);
begin
 case ComboBox_inv.ItemIndex of
  0:DataSource_inv.DataSet := dm.TPurchase_inv;
  1:DataSource_inv.DataSet := dm.TLoss;
  2:DataSource_inv.DataSet := dm.TDaily_income;
  end;

  dm.update_all
end;

procedure TMAIN_MENU_FORM.DBGrid_invCellClick(Column: TColumn);
var id : integer;
begin
  // ������ ���������� ������ ������� �� ������� �� �����
  // � ����������� �� ��������� ����������

  case ComboBox_inv.ItemIndex of
    0:begin
      id :=  dm.TPurchase_inv.FieldByName('ID').Value;
      dm.qPurchase_inv_item_filtered.ParamByName('in_purchase_id').Value:= id;
      DataSource_inv_item.DataSet := dm.qPurchase_inv_item_filtered;
    end;

    1: begin
      id :=   dm.TLoss.FieldByName('ID').Value;
      dm.QLossWithPrice.ParamByName('in_loss_id').Value:= id;
      DataSource_inv_item.DataSet := dm.QLossWithPrice;
    end;

    2: begin
      id := dm.TDaily_income.FieldByName('ID').Value;
      dm.QDaily_incomeWithPrice.ParamByName('in_daily_income_id').Value:= id;
      DataSource_inv_item.DataSet := dm.QDaily_incomeWithPrice;
    end;
  end;
  dm.update_all;
  case ComboBox_inv.ItemIndex of
  0: dm.TPurchase_inv.Locate('ID',id,[]);
  1: dm.TLoss.Locate('ID',id,[]);
  2: dm.TDaily_income.Locate('ID',id,[]);
  end;
end;

procedure TMAIN_MENU_FORM.FormCreate(Sender: TObject);
begin
  ComboBox_inv.itemindex := 0;
  DataSource_inv.DataSet := dm.TPurchase_inv;
  dm.update_all;
end;

procedure TMAIN_MENU_FORM.MENU_DAILY_INCOME_ADDClick(Sender: TObject);
begin
   DAILY_INCOME_FORM.SHOWMODAL;
end;

procedure TMAIN_MENU_FORM.MENU_DELETE_INVClick(Sender: TObject);
begin
  case ComboBox_inv.ItemIndex of
  0:   begin
     // Create dialog window
      if MessageDlg('kill '+dm.TPurchase_inv.FieldByName('ID').AsString+'?',
                mtConfirmation,[mbYes,mbNo],0)=mrYes then
        begin

          // Receve id from grid
          dm.spDeletePurchase_inv.ParamByName('IN_ID').Value:=dm.TPurchase_inv.FieldByName('ID').Value;

          // Execute the procedure
          if not(dm.spDeletePurchase_inv.Transaction.InTransaction) then
             dm.spDeletePurchase_inv.Transaction.StartTransaction;
          dm.spDeletePurchase_inv.ExecProc;
          dm.spDeletePurchase_inv.Transaction.Commit;

          // Reopen table
        end;
    end;
  1: begin
       // Create dialog window
      if MessageDlg('kill '+dm.TLoss.FieldByName('ID').AsString+'?',
                mtConfirmation,[mbYes,mbNo],0)=mrYes then
        begin

          // Receve id from grid
          dm.spDeleteLoss.ParamByName('IN_ID').Value:=dm.TLoss.FieldByName('ID').Value;

          // Execute the procedure
          if not(dm.spDeleteLoss.Transaction.InTransaction) then
             dm.spDeleteLoss.Transaction.StartTransaction;
          dm.spDeleteLoss.ExecProc;
          dm.spDeleteLoss.Transaction.Commit;

          // Reopen table
        end;
  end;

  2: begin
      // Create dialog window
      if MessageDlg('kill '+dm.TDaily_income.FieldByName('ID').AsString+'?',
                mtConfirmation,[mbYes,mbNo],0)=mrYes then
        begin

          // Receve id from grid
          dm.spDeleteDaily_income.ParamByName('IN_ID').Value:=dm.TDaily_income.FieldByName('ID').Value;

          // Execute the procedure
          if not(dm.spDeleteDaily_income.Transaction.InTransaction) then
             dm.spDeleteDaily_income.Transaction.StartTransaction;
          dm.spDeleteDaily_income.ExecProc;
          dm.spDeleteDaily_income.Transaction.Commit;

          // Reopen table
        end;
  end;

  end;
  dm.update_all;
end;

procedure TMAIN_MENU_FORM.MENU_LOSS_ADDClick(Sender: TObject);
begin
  LOSS_FORM.SHOWMODAL;
end;

procedure TMAIN_MENU_FORM.MENU_PRODUCTClick(Sender: TObject);
begin
  PRODUCT_FORM.SHOWMODAL;
end;

procedure TMAIN_MENU_FORM.MENU_PROVIDERClick(Sender: TObject);
begin
  PROVIDER_FORM.SHOWMODAL;
end;

procedure TMAIN_MENU_FORM.MENU_PURCHASE_INV_ADDClick(Sender: TObject);
begin
   INV_FORM.ShowModal;
end;

procedure TMAIN_MENU_FORM.N6Click(Sender: TObject);
begin
  case ComboBox_inv.ItemIndex of
  0: create_invoice;
  1: create_loss;
  2: create_daily_income;
  end;

end;

end.
