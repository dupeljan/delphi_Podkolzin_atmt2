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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  INVOICE_ITEM_ADD_PRICE_FORM: TINVOICE_ITEM_ADD_PRICE_FORM;

implementation
        uses data_moudule;
{$R *.dfm}

end.
