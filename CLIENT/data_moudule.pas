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
    TLoss: TIBTable;
    spAddLoss: TIBStoredProc;
    spDeleteLoss: TIBStoredProc;
    spEditLoss: TIBStoredProc;
    spAddLoss_item: TIBStoredProc;
    spDeleteLoss_item: TIBStoredProc;
    TLoss_item: TIBTable;
    qLoss_item_filtered: TIBQuery;
    TDaily_income: TIBTable;
    spAddDaily_income: TIBStoredProc;
    spDeleteDaily_income: TIBStoredProc;
    spEditDaily_income: TIBStoredProc;
    spAddDaily_income_item: TIBStoredProc;
    spDeleteDaily_income_item: TIBStoredProc;
    TDaily_income_item: TIBTable;
    qDaily_income_item_filtered: TIBQuery;
    QLoss_filetered: TIBQuery;
    QDaily_incomeWithPrice: TIBQuery;
    qlist: TIBQuery;
    spDeleteList: TIBStoredProc;
    spAddList: TIBStoredProc;
    QGetProvider_products: TIBQuery;
    spGetCount: TIBStoredProc;
    spGetPrice: TIBStoredProc;
    QGet_Period_Daily_income: TIBQuery;
    QGet_Period_Loss: TIBQuery;
    qGet_global_period_daily_income: TIBQuery;
    qGet_global_period_loss: TIBQuery;
    qPurchase_inv_item_filered_prov: TIBQuery;
    qPurchase_inv_item_only_povider: TIBQuery;
    QGet_Period_purchase: TIBQuery;
    qGet_global_period_purchase: TIBQuery;
    TShipper: TIBTable;
    qInv_full_info: TIBQuery;
    qShippers_Unset: TIBQuery;
    qInv_full_filtered_period: TIBQuery;
    spAdd_shipper: TIBStoredProc;
    spEdit_shipper: TIBStoredProc;
    spDelete_shipper: TIBStoredProc;
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
  dm.TLoss.Close;
  dm.TLoss_item.Close;
  dm.qLoss_item_filtered.Close;
  dm.TDaily_income.Close;
  dm.TDaily_income_item.Close;
  dm.qDaily_income_item_filtered.Close;
  dm.QDaily_incomeWithPrice.Close;
  dm.QLoss_filetered.Close;
  dm.qlist.Close;
  dm.QGetProvider_products.Close;
  dm.QGet_Period_Daily_income.Close;
  dm.QGet_Period_Loss.Close;
  dm.qGet_global_period_daily_income.Close;
  dm.qGet_global_period_loss.Close;
  dm.qPurchase_inv_item_filered_prov.Close;
  dm.qGet_global_period_purchase.Close;
  dm.TShipper.Close;
  dm.qInv_full_info.Close;
  dm.qShippers_Unset.Close;

  DM.TProvider.Open;
  DM.TProduct.Open;
  dm.qProductWithProvider.Open;
  dm.TPurchase_inv.Open;
  dm.TPurchase_inv_item.Open;
  dm.qPurchase_inv_item_filtered.Open;
  dm.TLoss.Open;
  dm.TLoss_item.Open;
  dm.qLoss_item_filtered.Open;
  dm.TDaily_income.Open;
  dm.TDaily_income_item.Open;
  dm.qDaily_income_item_filtered.Open;
  dm.QDaily_incomeWithPrice.Open;
  dm.QLoss_filetered.Open;
  dm.qlist.Open;
  dm.QGetProvider_products.Open;
  dm.QGet_Period_Daily_income.Open;
  dm.QGet_Period_Loss.Open;
  dm.qGet_global_period_daily_income.Open;
  dm.qGet_global_period_loss.Open;
  dm.qPurchase_inv_item_filered_prov.Open;
  dm.qGet_global_period_purchase.open;
  dm.TShipper.Open;
  dm.qInv_full_info.Open;
  dm.qShippers_Unset.Open;

end;


end.
