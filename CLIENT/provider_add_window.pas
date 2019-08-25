unit provider_add_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TPROVIDER_ADD_FORM = class(TForm)
    labelEdit_name: TLabeledEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PROVIDER_ADD_FORM: TPROVIDER_ADD_FORM;

implementation

{$R *.dfm}

end.
