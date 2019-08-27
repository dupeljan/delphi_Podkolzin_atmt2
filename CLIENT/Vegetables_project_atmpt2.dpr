program Vegetables_project_atmpt2;

uses
  Vcl.Forms,
  main_menu in 'main_menu.pas' {MAIN_MENU_FORM},
  provider_window in 'provider_window.pas' {PROVIDER_FORM},
  data_moudule in 'data_moudule.pas' {dm: TDataModule},
  provider_add_window in 'provider_add_window.pas' {PROVIDER_ADD_FORM},
  product_window in 'product_window.pas' {PRODUCT_FORM},
  product_add in 'product_add.pas' {product_add_form},
  inv_window in 'inv_window.pas' {INV_FORM},
  inv_item_add_price_window in 'inv_item_add_price_window.pas' {INVOICE_ITEM_ADD_PRICE_FORM},
  inv_item_add_window in 'inv_item_add_window.pas' {INVOICE_ITEM_ADD_FORM},
  loss_window in 'loss_window.pas' {LOSS_FORM},
  daily_income_window in 'daily_income_window.pas' {DAILY_INCOME_FORM},
  WordExelReport in 'WordExelReport.pas',
  exel_input_window in 'exel_input_window.pas' {EXEL_INPUT_FORM},
  choose_provider_window in 'choose_provider_window.pas' {CHOOSE_PROVIDER_FORM},
  diagram_window in 'diagram_window.pas' {DIAGRAM_FORM};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TMAIN_MENU_FORM, MAIN_MENU_FORM);
  Application.CreateForm(TPROVIDER_FORM, PROVIDER_FORM);
  Application.CreateForm(TPROVIDER_ADD_FORM, PROVIDER_ADD_FORM);
  Application.CreateForm(TPRODUCT_FORM, PRODUCT_FORM);
  Application.CreateForm(Tproduct_add_form, product_add_form);
  Application.CreateForm(TINV_FORM, INV_FORM);
  Application.CreateForm(TINVOICE_ITEM_ADD_PRICE_FORM, INVOICE_ITEM_ADD_PRICE_FORM);
  Application.CreateForm(TINVOICE_ITEM_ADD_FORM, INVOICE_ITEM_ADD_FORM);
  Application.CreateForm(TLOSS_FORM, LOSS_FORM);
  Application.CreateForm(TDAILY_INCOME_FORM, DAILY_INCOME_FORM);
  Application.CreateForm(TEXEL_INPUT_FORM, EXEL_INPUT_FORM);
  Application.CreateForm(TCHOOSE_PROVIDER_FORM, CHOOSE_PROVIDER_FORM);
  Application.CreateForm(TDIAGRAM_FORM, DIAGRAM_FORM);
  Application.Run;
end.
