unit product_add;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  Tproduct_add_form = class(TForm)
    leName: TLabeledEdit;
    LabelProvider: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  product_add_form: Tproduct_add_form;

implementation
{$R *.dfm}

uses data_module;

procedure Tproduct_add_form.FormCreate(Sender: TObject);
begin
  // Open table before print it
  dm.update_all;
  dm.Tprovider.Open;
end;

end.
