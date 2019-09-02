unit inv_item_add_price_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TINVOICE_ITEM_ADD_PRICE_FORM = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    LabeledEdit_count: TLabeledEdit;
    Label1: TLabel;
    LabeledEdit_price: TLabeledEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    Button_new_product: TButton;
    procedure Button_new_productClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  INVOICE_ITEM_ADD_PRICE_FORM: TINVOICE_ITEM_ADD_PRICE_FORM;

implementation
        uses data_moudule, product_add;
{$R *.dfm}

procedure TINVOICE_ITEM_ADD_PRICE_FORM.Button_new_productClick(Sender: TObject);
var id : integer;
begin
    // Create prodict_add_form
    product_add_form := Tproduct_add_form.Create(Application);
    product_add_form.ShowModal;

    // If receve information from provider_add_form
  if product_add_form.ModalResult= mrOk then
  begin

    // Fill db procedure parametrs with form valut
    dm.spAddProduct.ParamByName('IN_NAME').AsString:= product_add_form.leName.Text;
    dm.spAddProduct.ParamByName('IN_PROVIDER_ID').AsInteger:= dm.TProvider.FieldByName('ID').Value;

    // Execute the procedure
    if not dm.spAddProduct.Transaction.InTransaction then
      dm.spAddProduct.Transaction.StartTransaction;
    dm.spAddProduct.ExecProc;

    // Got result from bd procedure
    id:=dm.spAddProduct.ParamByName('OUT_ID').AsInteger;
    dm.spAddProduct.Transaction.Commit;

    //  Set TProduct table and grid position
    dm.update_all;
    dm.TProduct.Open;
    dm.TProduct.Locate('ID',id,[]);
  end;
  // Release add form
  product_add_form.Release;

end;

end.
