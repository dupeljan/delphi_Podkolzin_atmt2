program Vegetables_project_atmpt2;

uses
  Vcl.Forms,
  main_menu in 'main_menu.pas' {MAIN_MENU_FORM},
  provider_window in 'provider_window.pas' {PROVIDER_FORM},
  data_moudule in 'data_moudule.pas' {dm: TDataModule},
  provider_add_window in 'provider_add_window.pas' {PROVIDER_ADD_FORM},
  product_window in 'product_window.pas' {PRODUCT_FORM},
  product_add in 'product_add.pas' {product_add_form},
  inv_window in 'inv_window.pas' {INV_FORM};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMAIN_MENU_FORM, MAIN_MENU_FORM);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TPROVIDER_FORM, PROVIDER_FORM);
  Application.CreateForm(TPROVIDER_ADD_FORM, PROVIDER_ADD_FORM);
  Application.CreateForm(TPRODUCT_FORM, PRODUCT_FORM);
  Application.CreateForm(Tproduct_add_form, product_add_form);
  Application.CreateForm(TINV_FORM, INV_FORM);
  Application.Run;
end.
