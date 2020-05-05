unit shipper_add_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TSHIPPER_ADD_FORM = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit_name: TEdit;
    Edit_tel: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SHIPPER_ADD_FORM: TSHIPPER_ADD_FORM;

implementation

{$R *.dfm}

end.
