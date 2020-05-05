unit inv_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TINV_FORM = class(TForm)
    PICKER_DATA_INV: TDateTimePicker;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BUTTON_ADD_PRODUCT: TButton;
    BUTTON_DELETE_PRODUCT: TButton;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    LABEL_INV_NUMBER: TLabel;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    Label3: TLabel;
    Label4: TLabel;

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
  INV_FORM: TINV_FORM;
  INV_ID : INTEGER;

implementation
 uses data_moudule, product_add, dateUtils,inv_item_add_price_window;

{$R *.dfm}

function get_inv_id: integer;
begin
  result := inv_id;
end;

procedure local_update_all;
begin
    // setup dataset for output
    dm.qPurchase_inv_item_filtered.ParamByName('in_purchase_id').Value :=
    INV_ID;
    dm.update_all;
end;

procedure TINV_FORM.BUTTON_ADD_PRODUCTClick(Sender: TObject);
var id : integer;
begin
    // Create prodict_add_form
    INVOICE_ITEM_ADD_PRICE_FORM := TINVOICE_ITEM_ADD_PRICE_FORM.Create(Application);
    INVOICE_ITEM_ADD_PRICE_FORM.ShowModal;

    // If receve information from provider_add_form
  if INVOICE_ITEM_ADD_PRICE_FORM.ModalResult= mrOk then
  begin

    // Fill db procedure parametrs with form valut
    dm.spAddPurchase_inv_item.ParamByName('IN_PRICE').AsString :=
    INVOICE_ITEM_ADD_PRICE_FORM.LabeledEdit_price.Text;

    dm.spAddPurchase_inv_item.ParamByName('IN_PRODUCT_COUNT').AsString :=
    INVOICE_ITEM_ADD_PRICE_FORM.LabeledEdit_count.Text;

    dm.spAddPurchase_inv_item.ParamByName('IN_PRODUCT_ID').AsString :=
     dm.qProductWithProvider.FieldByName('PRODUCT_ID').Value;

    dm.spAddPurchase_inv_item.ParamByName('IN_PURCHASE_INV_ID').AsInteger :=
    INV_ID;


    // Execute the procedure
    if not dm.spAddPurchase_inv_item.Transaction.InTransaction then
      dm.spAddPurchase_inv_item.Transaction.StartTransaction;
    dm.spAddPurchase_inv_item.ExecProc;

    // Got result from bd procedure
    id:=dm.spAddPurchase_inv_item.ParamByName('OUT_ID').AsInteger;
    dm.spAddPurchase_inv_item.Transaction.Commit;

    //  Set TProduct table and grid position

    local_update_all;
    //dm.TProduct.Locate('ID',id,[]);
  end;
  // Release add form
  product_add_form.Release;

end;

procedure TINV_FORM.BUTTON_DELETE_PRODUCTClick(Sender: TObject);
begin
  // Create dialog window
  if MessageDlg('kill '+dm.qPurchase_inv_item_filtered.FieldByName('PRODUCT_NAME').AsString+'?',
                mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin

    // Receve id from grid
    dm.spDeletePurcahse_inv_item.ParamByName('IN_ID').Value:=dm.qPurchase_inv_item_filtered.FieldByName('purchase_inv_item_id').Value;

    // Execute the procedure
    if not(dm.spDeletePurcahse_inv_item.Transaction.InTransaction) then
        dm.spDeletePurcahse_inv_item.Transaction.StartTransaction;
    dm.spDeletePurcahse_inv_item.ExecProc;
    dm.spDeletePurcahse_inv_item.Transaction.Commit;

    // Reopen table
    local_update_all;
  end;
end;


procedure TINV_FORM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     // Fill db procedure parametrs with form valut
    dm.spEditPurchase_inv.ParamByName('IN_DATE').value := PICKER_DATA_INV.Date;
    dm.spEditPurchase_inv.ParamByName('IN_ID').Value := inv_id;
    dm.spEditPurchase_inv.ParamByName('IN_SHIPPER_ID').value
     := dm.TShipper.FieldByName('ID').value;

    // Execute the procedure
    if not dm.spEditPurchase_inv.Transaction.InTransaction then
      dm.spEditPurchase_inv.Transaction.StartTransaction;
    dm.spEditPurchase_inv.ExecProc;

    // Got result from bd procedure
    dm.spEditPurchase_inv.Transaction.Commit;

    //  Set TProduct table and grid position
    dm.update_all;

end;

procedure TINV_FORM.FormShow(Sender: TObject);
var id : integer;
begin
  // Fill db procedure parametrs with form valut
    dm.spAddPurchase_inv.ParamByName('IN_DATE').value :=  now;
    dm.spAddPurchase_inv.ParamByName('IN_SHIPPER_ID').Value
      := dm.TShipper.FieldByName('ID').value;

    // Execute the procedure
    if not dm.spAddPurchase_inv.Transaction.InTransaction then
      dm.spAddPurchase_inv.Transaction.StartTransaction;
    dm.spAddPurchase_inv.ExecProc;

    // Got result from bd procedure
    inv_id:=dm.spAddPurchase_inv.ParamByName('OUT_ID').AsInteger;
    dm.spAddPurchase_inv.Transaction.Commit;

    //  Set TProduct table and grid position
    local_update_all;
    LABEL_INV_NUMBER.Caption := INTTOSTR(inv_id);
end;

end.
