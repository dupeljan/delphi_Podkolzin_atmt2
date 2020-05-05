unit shipper_window_;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, data_moudule, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Menus;

type
  Tshipper_form = class(TForm)
    MainMenu1: TMainMenu;
    MENU_ADD: TMenuItem;
    MENU_DELETE: TMenuItem;
    MENU_EDIT: TMenuItem;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure MENU_ADDClick(Sender: TObject);
    procedure MENU_DELETEClick(Sender: TObject);
    procedure MENU_EDITClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  shipper_form: Tshipper_form;

implementation

{$R *.dfm}

uses shipper_add_window;

procedure Tshipper_form.MENU_ADDClick(Sender: TObject);
var id : integer;
begin
  // Create provider_add_form
  shipper_add_form:= Tshipper_add_form.Create(Application);
  shipper_add_form.ShowModal;

  // If receve information from provider_add_form
  if shipper_add_form.ModalResult= mrOk then
  begin

    // Fill db procedure parametrs with form valut
    dm.spAdd_Shipper.ParamByName('IN_NAME').AsString:= shipper_add_form.edit_name.Text;
    dm.spAdd_Shipper.ParamByName('IN_TEL').AsString:= shipper_add_form.edit_tel.Text;
    // Execute the procedure
    if not dm.spAdd_Shipper.Transaction.InTransaction then
      dm.spAdd_Shipper.Transaction.StartTransaction;
    dm.spAdd_Shipper.ExecProc;

    // Got result from bd procedure
    id:=dm.spAdd_Shipper.ParamByName('OUT_ID').AsInteger;
    dm.spAdd_Shipper.Transaction.Commit;

    //  Set TProduct table and grid position
    dm.update_all;
    dm.TShipper.Locate('ID',id,[]);
  end;
  // Release add form
  shipper_add_form.Release;

end;


procedure Tshipper_form.MENU_DELETEClick(Sender: TObject);
begin
  // Create dialog window
  if MessageDlg('kill '+dm.TShipper.FieldByName('NAME').AsString+'?',
                mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin

    // Receve id from grid
    dm.spDelete_SHIPPER.ParamByName('IN_ID').Value:=
        dm.Tshipper.FieldByName('ID').Value;

    // Execute the procedure
    if not(dm.spDelete_SHIPPER.Transaction.InTransaction) then
        dm.spDelete_SHIPPER.Transaction.StartTransaction;
    dm.spDelete_SHIPPER.ExecProc;
    dm.spDelete_SHIPPER.Transaction.Commit;

    // Reopen table
    dm.update_all;
  end;
end;

procedure Tshipper_form.MENU_EDITClick(Sender: TObject);
var id : integer;
begin
   // Create provider_add_form
  shipper_add_form := Tshipper_add_form.Create(Application);

  // Fill from from table
  shipper_add_form.Edit_name.Text :=  dm.TShipper.FieldByName('NAME').AsString;
  shipper_add_form.Edit_tel.Text :=  dm.TShipper.FieldByName('TEL').AsString;
  // Show form
  shipper_add_form.ShowModal;

  // If receve information from provider_add_form
  if shipper_add_form.ModalResult=mrOk then
    begin
        // Fill db procedure parametrs with form valut
        dm.spEdit_shipper.ParamByName('IN_NAME').AsString:=
            shipper_add_form.Edit_name.Text;
        dm.spEdit_shipper.ParamByName('IN_TEL').AsString:=
            shipper_add_form.Edit_tel.Text;
        dm.spEdit_shipper.ParamByName('IN_SHIPPER_ID').Value:=
            dm.TShipper.FieldByName('ID').AsInteger;


        // Execute the procedure
        if not dm.spEdit_shipper.Transaction.InTransaction then
          dm.spEdit_shipper.Transaction.StartTransaction;
        dm.spEdit_shipper.ExecProc;

        // Got result from table
        id:= dm.TShipper.FieldByName('ID').AsInteger;

        dm.spEdit_shipper.Transaction.Commit;

        //  Set TProduct table and grid position
        dm.update_all;
        dm.TShipper.Open;
        dm.TShipper.Locate('ID',id,[]);
    end;
  shipper_add_form.Release;

end;

end.
