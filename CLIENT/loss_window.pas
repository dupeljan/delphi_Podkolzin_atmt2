unit loss_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TLOSS_FORM = class(TForm)
    PICKER_DATA_LOSS: TDateTimePicker;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BUTTON_ADD_PRODUCT: TButton;
    BUTTON_DELETE_PRODUCT: TButton;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    LABEL_LOSS_NUMBER: TLabel;

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
  LOSS_FORM: TLOSS_FORM;
  LOSS_ID : INTEGER;

implementation
 uses data_moudule, product_add, dateUtils,inv_item_add_window;

{$R *.dfm}



procedure local_update_all;
begin
    // setup dataset for output
    dm.qLoss_item_filtered.ParamByName('in_loss_id').Value :=
    LOSS_ID;
    dm.update_all;
end;

procedure TLOSS_FORM.BUTTON_ADD_PRODUCTClick(Sender: TObject);
var id : integer;
begin
    // Create prodict_add_form
    INVOICE_ITEM_ADD_FORM := TINVOICE_ITEM_ADD_FORM.Create(Application);
    INVOICE_ITEM_ADD_FORM.ShowModal;

    // If receve information from provider_add_form
  if INVOICE_ITEM_ADD_FORM.ModalResult= mrOk then
  begin

    // Fill db procedure parametrs with form valut

    dm.spAddLoss_item.ParamByName('IN_PRODUCT_COUNT').AsString :=
    INVOICE_ITEM_ADD_FORM.LabeledEdit_count.Text;

    dm.spAddLoss_item.ParamByName('IN_PRODUCT_ID').AsString :=
    dm.qProductWithProvider.FieldByName('PRODUCT_ID').Value;

    dm.spAddLoss_item.ParamByName('IN_LOSS_ID').AsInteger :=
    LOSS_ID;


    // Execute the procedure
    if not dm.spAddLoss_item.Transaction.InTransaction then
      dm.spAddLoss_item.Transaction.StartTransaction;
    dm.spAddLoss_item.ExecProc;

    // Got result from bd procedure
    id:=dm.spAddLoss_item.ParamByName('OUT_ID').AsInteger;
    dm.spAddLoss_item.Transaction.Commit;

    //  Set TProduct table and grid position

    local_update_all;
    //dm.TProduct.Locate('ID',id,[]);
  end;
  // Release add form
  INVOICE_ITEM_ADD_FORM.Release;

end;

procedure TLOSS_FORM.BUTTON_DELETE_PRODUCTClick(Sender: TObject);
begin
  // Create dialog window
  if MessageDlg('kill '+dm.qLoss_item_filtered.FieldByName('PRODUCT_NAME').AsString+'?',
                mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin

    // Receve id from grid
    dm.spDeleteLoss_item.ParamByName('IN_ID').Value:=dm.qLoss_item_filtered.FieldByName('loss_item_id').Value;

    // Execute the procedure
    if not(dm.spDeleteLoss_item.Transaction.InTransaction) then
        dm.spDeleteLoss_item.Transaction.StartTransaction;
    dm.spDeleteLoss_item.ExecProc;
    dm.spDeleteLoss_item.Transaction.Commit;

    // Reopen table
    local_update_all;
  end;
end;


procedure TLOSS_FORM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     // Fill db procedure parametrs with form valut
    dm.spEditLoss.ParamByName('IN_DATE').value := PICKER_DATA_LOSS.Date;
    dm.spEditLoss.ParamByName('IN_ID').Value := LOSS_ID;


    // Execute the procedure
    if not dm.spEditLoss.Transaction.InTransaction then
      dm.spEditLoss.Transaction.StartTransaction;
    dm.spEditLoss.ExecProc;

    // Got result from bd procedure
    dm.spEditLoss.Transaction.Commit;

    //  Set TProduct table and grid position
    dm.update_all;

end;

procedure TLOSS_FORM.FormShow(Sender: TObject);
var id : integer;
begin
  // Fill db procedure parametrs with form valut
    dm.spAddLoss.ParamByName('IN_DATE').value :=  now;


    // Execute the procedure
    if not dm.spAddLoss.Transaction.InTransaction then
      dm.spAddLoss.Transaction.StartTransaction;
    dm.spAddLoss.ExecProc;

    // Got result from bd procedure
    LOSS_ID:=dm.spAddLoss.ParamByName('OUT_ID').AsInteger;
    dm.spAddLoss.Transaction.Commit;

    //  Set TProduct table and grid position
    local_update_all;
    LABEL_LOSS_NUMBER.Caption := INTTOSTR(LOSS_ID);
end;

end.
