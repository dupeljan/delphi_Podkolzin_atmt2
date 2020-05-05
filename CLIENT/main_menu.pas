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
    MENU_WORD_EXPORT: TMenuItem;
    MENU_REPORT: TMenuItem;
    DIAGRAM_MENU: TMenuItem;
    DBGrid_inv: TDBGrid;
    DBGrid_inv_item: TDBGrid;
    DataSource_inv: TDataSource;
    DataSource_inv_item: TDataSource;
    ComboBox_inv: TComboBox;
    DBGrid_inv_loss: TDBGrid;
    DataSource_inv_loss: TDataSource;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    MENU_SHIPPER: TMenuItem;
    procedure MENU_PROVIDERClick(Sender: TObject);
    procedure MENU_PRODUCTClick(Sender: TObject);
    procedure MENU_PURCHASE_INV_ADDClick(Sender: TObject);
    procedure MENU_LOSS_ADDClick(Sender: TObject);
    procedure MENU_DAILY_INCOME_ADDClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox_invChange(Sender: TObject);
    procedure DBGrid_invCellClick(Column: TColumn);
    procedure MENU_DELETE_INVClick(Sender: TObject);
    procedure MENU_WORD_EXPORTClick(Sender: TObject);
    procedure MENU_REPORTClick(Sender: TObject);
    procedure DIAGRAM_MENUClick(Sender: TObject);
    procedure MENU_SHIPPERClick(Sender: TObject);
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
  daily_income_window, data_moudule, WordExelReport, exel_input_window,
  diagram_window, shipper_window_;

procedure TMAIN_MENU_FORM.ComboBox_invChange(Sender: TObject);
begin
 case ComboBox_inv.ItemIndex of
  0:DataSource_inv.DataSet := dm.TPurchase_inv;
  //1:DataSource_inv.DataSet := dm.TLoss;
  1:DataSource_inv.DataSet := dm.TDaily_income;
  end;

  dm.update_all
end;



procedure TMAIN_MENU_FORM.DBGrid_invCellClick(Column: TColumn);
var id : integer;
begin
  // Меняем содержимое правой таблицы по нажатию на левую
  // В зависимости от состояния комбобокса

  case ComboBox_inv.ItemIndex of
    0:begin
      id :=  dm.TPurchase_inv.FieldByName('ID').Value;
      dm.qPurchase_inv_item_filtered.ParamByName('in_purchase_id').Value:= id;
      DataSource_inv_item.DataSet := dm.qPurchase_inv_item_filtered;
      // Set loss table
      dm.QLoss_filetered.ParamByName('IN_PURCHASE_INV_ID').Value
        := dm.TPurchase_inv.FieldByName('ID').Value;
    end;


    1: begin
      id := dm.TDaily_income.FieldByName('ID').Value;
      dm.QDaily_incomeWithPrice.ParamByName('in_daily_income_id').Value:= id;
      DataSource_inv_item.DataSet := dm.QDaily_incomeWithPrice;
    end;
  end;
  dm.update_all;
  case ComboBox_inv.ItemIndex of
  0: dm.TPurchase_inv.Locate('ID',id,[]);
  //1: dm.TLoss.Locate('ID',id,[]);
  1: dm.TDaily_income.Locate('ID',id,[]);
  end;
end;

procedure TMAIN_MENU_FORM.DIAGRAM_MENUClick(Sender: TObject);
begin
   DIAGRAM_FORM.showmodal;
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

procedure TMAIN_MENU_FORM.MENU_REPORTClick(Sender: TObject);
begin
 EXEL_INPUT_FORM.showModal;
end;

procedure TMAIN_MENU_FORM.MENU_SHIPPERClick(Sender: TObject);
begin
 SHIPPER_FORM.showModal;
end;

procedure TMAIN_MENU_FORM.MENU_WORD_EXPORTClick(Sender: TObject);
begin
  create_invoice;

end;

end.
