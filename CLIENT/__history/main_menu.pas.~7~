unit main_menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TMAIN_MENU_FORM = class(TForm)
    MainMenu1: TMainMenu;
    MENU_PROVIDER: TMenuItem;
    MENU_PRODUCT: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure MENU_PROVIDERClick(Sender: TObject);
    procedure MENU_PRODUCTClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MAIN_MENU_FORM: TMAIN_MENU_FORM;

implementation

{$R *.dfm}

uses provider_window, product_window, inv_window;

procedure TMAIN_MENU_FORM.MENU_PRODUCTClick(Sender: TObject);
begin
  PRODUCT_FORM.SHOWMODAL;
end;

procedure TMAIN_MENU_FORM.MENU_PROVIDERClick(Sender: TObject);
begin
  PROVIDER_FORM.SHOWMODAL;
end;

procedure TMAIN_MENU_FORM.N2Click(Sender: TObject);
begin
   INV_FORM.ShowModal;
end;

end.
