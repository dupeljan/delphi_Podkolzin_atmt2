unit inv_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TINV_FORM = class(TForm)
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BUTTON_ADD_PRODUCT: TButton;
    BUTTON_DELETE_PRODUCT: TButton;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  INV_FORM: TINV_FORM;
  INV_ID : INTEGER;

implementation
 uses data_moudule;

{$R *.dfm}


procedure TINV_FORM.FormCreate(Sender: TObject);
var id : integer;
begin
   
end;

end.
