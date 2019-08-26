unit data_moudule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBCustomDataSet, IBX.IBTable,
  IBX.IBDatabase, IBX.IBStoredProc, IBX.IBQuery;

type
  Tdm = class(TDataModule)
    my_database: TIBDatabase;
    IBTransaction1: TIBTransaction;
    TProvider: TIBTable;
    TProduct: TIBTable;
    spAddProvider: TIBStoredProc;
    spDeleteProvider: TIBStoredProc;
    spEditProvider: TIBStoredProc;
    spAddProduct: TIBStoredProc;
    spDeleteProduct: TIBStoredProc;
    spEditProduct: TIBStoredProc;
    qProductWithProvider: TIBQuery;
    TPurchase_inv: TIBTable;
    TPurchase_inv_item: TIBTable;
    spAddPurchase_inv: TIBStoredProc;
    spDeletePurchase_inv: TIBStoredProc;
    spAddPurchase_inv_item: TIBStoredProc;
    spDeletePurcahse_inv_item: TIBStoredProc;
    spEditPurchase_inv: TIBStoredProc;
    qPurchase_inv_item_filtered: TIBQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure update_all;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  my_database.Open;
end;

procedure Tdm.DataModuleDestroy(Sender: TObject);
begin
 my_database.Close
end;

procedure Tdm.update_all;
begin
  DM.TProvider.Close;
  DM.TProduct.Close;
  dm.qProductWithProvider.Close;
  dm.TPurchase_inv.Close;
  dm.TPurchase_inv_item.Close;
  dm.qPurchase_inv_item_filtered.Close;

  DM.TProvider.Open;
  DM.TProduct.Open;
  dm.qProductWithProvider.Open;
  dm.TPurchase_inv.Open;
  dm.TPurchase_inv_item.Open;
  dm.qPurchase_inv_item_filtered.Open;
end;


end.
