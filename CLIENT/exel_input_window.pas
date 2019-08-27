unit exel_input_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ComCtrls, data_moudule,WordExelReport;

type
  TEXEL_INPUT_FORM = class(TForm)
    DateTimeFrom: TDateTimePicker;
    DateTimeTo: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BUTTON_ADD: TButton;
    BUTTON_DELETE: TButton;
    BUTTON_CREATE_EXEL: TButton;
    procedure BUTTON_ADDClick(Sender: TObject);
    procedure BUTTON_DELETEClick(Sender: TObject);
    procedure BUTTON_CREATE_EXELClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EXEL_INPUT_FORM: TEXEL_INPUT_FORM;
  LIST_ID : integer;

implementation

{$R *.dfm}

uses provider_add_window, choose_provider_window;


procedure TEXEL_INPUT_FORM.BUTTON_ADDClick(Sender: TObject);
var id : integer;
begin
    // Create prodict_add_form
    CHOOSE_PROVIDER_FORM := TCHOOSE_PROVIDER_FORM.Create(Application);
    CHOOSE_PROVIDER_FORM.ShowModal;

    // If receve information from provider_add_form
  if CHOOSE_PROVIDER_FORM.ModalResult= mrOk then
  begin

    // Fill db procedure parametrs with form valut
    id :=  dm.TProvider.FieldByName('ID').Value;
    dm.spAddList.ParamByName('IN_PROVIDER_ID').value:=  id;

    // Execute the procedure
    if not dm.spAddList.Transaction.InTransaction then
      dm.spAddList.Transaction.StartTransaction;
    dm.spAddList.ExecProc;

    dm.spAddList.Transaction.Commit;

    //  Set TProduct table and grid position
    dm.update_all;
    dm.qlist.Locate('PROVIDER_ID',id,[]);
  end;
  // Release add form
  CHOOSE_PROVIDER_FORM.Release;

end;

procedure TEXEL_INPUT_FORM.BUTTON_CREATE_EXELClick(Sender: TObject);
begin
  create_exel;
end;

procedure TEXEL_INPUT_FORM.BUTTON_DELETEClick(Sender: TObject);
begin
  // Create dialog window
  if MessageDlg('Удалить '+dm.qlist.FieldByName('PROVIDER_NAME').AsString+' из списка?',
                mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin

    // Receve id from grid
    dm.spDeleteList.ParamByName('IN_PROVIDER_ID').Value:=dm.qlist.FieldByName('PROVIDER_ID').Value;

    // Execute the procedure
    if not(dm.spDeleteList.Transaction.InTransaction) then
        dm.spDeleteList.Transaction.StartTransaction;
    dm.spDeleteList.ExecProc;
    dm.spDeleteList.Transaction.Commit;

    // Reopen table
    dm.update_all;
  end;
end;

end.
