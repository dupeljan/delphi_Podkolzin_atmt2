unit daily_income_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TDAILY_INCOME_FORM = class(TForm)
    PICKER_DATA_LOSS: TDateTimePicker;
    Label1: TLabel;
    LABEL_DAILY_INCOME_NUMBER :TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BUTTON_ADD_PRODUCT: TButton;
    BUTTON_DELETE_PRODUCT: TButton;
    BitBtn1: TBitBtn;
    Label2: TLabel;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure BUTTON_ADD_PRODUCTClick(Sender: TObject);
    procedure BUTTON_DELETE_PRODUCTClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DAILY_INCOME_FORM: TDAILY_INCOME_FORM;
  DAILY_INCOME_ID : INTEGER;

implementation
 uses data_moudule, product_add, dateUtils,inv_item_add_window;

{$R *.dfm}



procedure local_update_all;
begin
    // setup dataset for output
    dm.qDaily_income_item_filtered.ParamByName('in_daily_income_id').Value :=
    DAILY_INCOME_ID;
    dm.update_all;
end;

procedure TDAILY_INCOME_FORM.BUTTON_ADD_PRODUCTClick(Sender: TObject);
var id : integer;
begin
    // Create prodict_add_form
    INVOICE_ITEM_ADD_FORM := TINVOICE_ITEM_ADD_FORM.Create(Application);
    INVOICE_ITEM_ADD_FORM.ShowModal;

    // If receve information from provider_add_form
  if INVOICE_ITEM_ADD_FORM.ModalResult= mrOk then
  begin

    // Fill db procedure parametrs with form valut

    dm.spAddDaily_income_item.ParamByName('IN_PRODUCT_COUNT').AsString :=
    INVOICE_ITEM_ADD_FORM.LabeledEdit_count.Text;

    dm.spAddDaily_income_item.ParamByName('IN_PRODUCT_ID').AsString :=
    dm.qProductWithProvider.FieldByName('PRODUCT_ID').Value;

    dm.spAddDaily_income_item.ParamByName('IN_DAILY_INCOME_ID').AsInteger :=
    DAILY_INCOME_ID;


    // Execute the procedure
    if not dm.spAddDaily_income_item.Transaction.InTransaction then
      dm.spAddDaily_income_item.Transaction.StartTransaction;
    dm.spAddDaily_income_item.ExecProc;

    // Got result from bd procedure
    id:=dm.spAddDaily_income_item.ParamByName('OUT_ID').AsInteger;
    dm.spAddDaily_income_item.Transaction.Commit;

    //  Set TProduct table and grid position

    local_update_all;
    //dm.TProduct.Locate('ID',id,[]);
  end;
  // Release add form
  INVOICE_ITEM_ADD_FORM.Release;

end;

procedure TDAILY_INCOME_FORM.BUTTON_DELETE_PRODUCTClick(Sender: TObject);
begin
  // Create dialog window
  if MessageDlg('kill '+dm.qDaily_income_item_filtered.FieldByName('PRODUCT_NAME').AsString+'?',
                mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin

    // Receve id from grid
    dm.spDeleteDaily_income_item.ParamByName('IN_ID').Value:=dm.qDaily_income_item_filtered.FieldByName('daily_income_item_id').Value;

    // Execute the procedure
    if not(dm.spDeleteDaily_income_item.Transaction.InTransaction) then
        dm.spDeleteDaily_income_item.Transaction.StartTransaction;
    dm.spDeleteDaily_income_item.ExecProc;
    dm.spDeleteDaily_income_item.Transaction.Commit;

    // Reopen table
    local_update_all;
  end;
end;


procedure TDAILY_INCOME_FORM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     // Fill db procedure parametrs with form valut
    dm.spEditDaily_income.ParamByName('IN_DATE').value := PICKER_DATA_LOSS.Date;
    dm.spEditDaily_income.ParamByName('IN_ID').Value := DAILY_INCOME_ID;


    // Execute the procedure
    if not dm.spEditDaily_income.Transaction.InTransaction then
      dm.spEditDaily_income.Transaction.StartTransaction;
    dm.spEditDaily_income.ExecProc;

    // Got result from bd procedure
    dm.spEditDaily_income.Transaction.Commit;

    //  Set TProduct table and grid position
    dm.update_all;

end;

procedure TDAILY_INCOME_FORM.FormShow(Sender: TObject);
var id : integer;
begin
  // Fill db procedure parametrs with form valut
    dm.spAddDaily_income.ParamByName('IN_DATE').value :=  now;


    // Execute the procedure
    if not dm.spAddDaily_income.Transaction.InTransaction then
      dm.spAddDaily_income.Transaction.StartTransaction;
    dm.spAddDaily_income.ExecProc;

    // Got result from bd procedure
    DAILY_INCOME_ID:=dm.spAddDaily_income.ParamByName('OUT_ID').AsInteger;
    dm.spAddDaily_income.Transaction.Commit;

    //  Set TProduct table and grid position
    local_update_all;
    LABEL_DAILY_INCOME_NUMBER.Caption := INTTOSTR(DAILY_INCOME_ID);
end;

end.
