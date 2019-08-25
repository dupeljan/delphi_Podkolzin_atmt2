unit product_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus;

type
  TPRODUCT_FORM = class(TForm)
    MainMenu1: TMainMenu;
    ADD: TMenuItem;
    DELETE: TMenuItem;
    EDIT: TMenuItem;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure ADDClick(Sender: TObject);
    procedure DELETEClick(Sender: TObject);
    procedure EDITClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PRODUCT_FORM: TPRODUCT_FORM;

implementation

{$R *.dfm}

uses data_moudule, product_add;

procedure TPRODUCT_FORM.ADDClick(Sender: TObject);
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

procedure TPRODUCT_FORM.DELETEClick(Sender: TObject);
begin
  // Create dialog window
  if MessageDlg('kill '+dm.qProductWithProvider.FieldByName('PRODUCT_NAME').AsString+'?',
                mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin

    // Receve id from grid
    dm.spDeleteProduct.ParamByName('IN_ID').Value:=dm.qProductWithProvider.FieldByName('PRODUCT_ID').Value;

    // Execute the procedure
    if not(dm.spDeleteProduct.Transaction.InTransaction) then
        dm.spDeleteProduct.Transaction.StartTransaction;
    dm.spDeleteProduct.ExecProc;
    dm.spDeleteProduct.Transaction.Commit;

    // Reopen table
    dm.update_all;
    dm.TProduct.Open;
  end;
end;

procedure TPRODUCT_FORM.EDITClick(Sender: TObject);
var id, prov_id : integer;
var str : string;
begin
   // Create provider_add_form
  product_add_form:= Tproduct_add_form.Create(Application);

  // Fill foRm from table
  product_add_form.leName.Text :=  dm.qProductWithProvider.FieldByName('PRODUCT_NAME').AsString;
  dm.TProvider.Locate('ID',dm.qProductWithProvider.FieldByName('PROVIDER_ID').AsInteger,[]);

  // Show form
  product_add_form.ShowModal;

  // If receve information from provider_add_form
  if product_add_form.ModalResult=mrOk then
    begin
        // Fill db procedure parametrs with form valut
        str :=       product_add_form.leName.Text;
        dm.spEditProduct.ParamByName('IN_NAME').AsString:= product_add_form.leName.Text;
        prov_id :=       dm.TProvider.FieldByName('ID').AsInteger;
        dm.spEditProduct.ParamByName('IN_PROVIDER_ID').AsInteger := dm.TProvider.FieldByName('ID').AsInteger;
        id :=       dm.TProduct.FieldByName('ID').AsInteger;
        dm.spEditProduct.ParamByName('IN_ID').AsInteger:= dm.qProductWithProvider.FieldByName('PRODUCT_ID').AsInteger;


        // Execute the procedure
        if not dm.spEditProduct.Transaction.InTransaction then
          dm.spEditProduct.Transaction.StartTransaction;
        dm.spEditProduct.ExecProc;

        // Got result from table
        id:= dm.TProduct.FieldByName('ID').AsInteger;

        dm.spEditProduct.Transaction.Commit;

        //  Set TProduct table and grid position
        dm.update_all;
        dm.TProduct.Open;
        dm.TProduct.Locate('ID',id,[]);
    end;
  product_add_form.Release;

end;

procedure TPRODUCT_FORM.FormCreate(Sender: TObject);
begin
 DM.UPDATE_ALL;
end;

end.
