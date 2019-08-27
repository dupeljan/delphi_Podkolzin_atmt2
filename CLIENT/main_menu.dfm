object MAIN_MENU_FORM: TMAIN_MENU_FORM
  Left = 0
  Top = 0
  Caption = #1043#1051#1040#1042#1053#1054#1045' '#1052#1045#1053#1070
  ClientHeight = 424
  ClientWidth = 791
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid_inv: TDBGrid
    Left = 0
    Top = 35
    Width = 320
    Height = 401
    DataSource = DataSource_inv
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid_invCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        ReadOnly = True
        Title.Caption = #1053#1054#1052#1045#1056
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'THE_DATE'
        ReadOnly = True
        Title.Caption = #1044#1040#1058#1040
        Width = 100
        Visible = True
      end>
  end
  object DBGrid_inv_item: TDBGrid
    Left = 326
    Top = 48
    Width = 473
    Height = 377
    DataSource = DataSource_inv_item
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PRODUCT_NAME'
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROVIDER_NAME'
        Title.Caption = #1055#1056#1054#1048#1047#1042#1054#1044#1048#1058#1045#1051#1068
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_COUNT'
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Title.Caption = #1062#1045#1053#1040
        Visible = True
      end>
  end
  object ComboBox_inv: TComboBox
    Left = 0
    Top = 8
    Width = 777
    Height = 21
    TabOrder = 2
    Text = 'ComboBox_inv'
    OnChange = ComboBox_invChange
    Items.Strings = (
      #1055#1056#1048#1061#1054#1044#1053#1067#1045' '#1053#1040#1050#1051#1040#1044#1053#1067#1045
      #1057#1055#1048#1057#1040#1053#1048#1071
      #1055#1056#1054#1044#1040#1046#1048' '#1047#1040' '#1044#1045#1053#1068)
  end
  object MainMenu1: TMainMenu
    Left = 360
    Top = 128
    object MENU_PROVIDER: TMenuItem
      Caption = #1055#1056#1054#1048#1047#1042#1054#1044#1048#1058#1045#1051#1048
      OnClick = MENU_PROVIDERClick
    end
    object MENU_PRODUCT: TMenuItem
      Caption = #1058#1054#1042#1040#1056#1067
      OnClick = MENU_PRODUCTClick
    end
    object N1: TMenuItem
      Caption = #1053#1040#1050#1051#1040#1044#1053#1067#1045
      object MENU_PURCHASE_INV_ADD: TMenuItem
        Caption = #1044#1054#1041#1040#1042#1048#1058#1068' '#1055#1056#1048#1061#1054#1044
        OnClick = MENU_PURCHASE_INV_ADDClick
      end
      object MENU_LOSS_ADD: TMenuItem
        Caption = #1044#1054#1041#1040#1042#1048#1058#1068' '#1057#1055#1048#1057#1040#1053#1048#1045
        OnClick = MENU_LOSS_ADDClick
      end
      object MENU_DAILY_INCOME_ADD: TMenuItem
        Caption = #1044#1054#1041#1040#1042#1048#1058#1068' '#1055#1056#1054#1044#1040#1046#1048' '#1047#1040' '#1044#1045#1053#1068
        OnClick = MENU_DAILY_INCOME_ADDClick
      end
      object MENU_DELETE_INV: TMenuItem
        Caption = #1059#1044#1040#1051#1048#1058#1068' '#1053#1040#1050#1051#1040#1044#1053#1059#1070
        OnClick = MENU_DELETE_INVClick
      end
      object MENU_WORD_EXPORT: TMenuItem
        Caption = #1069#1050#1057#1055#1054#1056#1058' '#1042' '#1042#1054#1056#1044
        OnClick = MENU_WORD_EXPORTClick
      end
    end
    object MENU_REPORT: TMenuItem
      Caption = #1054#1058#1063#1045#1058
      OnClick = MENU_REPORTClick
    end
    object DIAGRAM_MENU: TMenuItem
      Caption = #1044#1048#1040#1043#1056#1040#1052#1052#1040
      OnClick = DIAGRAM_MENUClick
    end
  end
  object DataSource_inv: TDataSource
    DataSet = dm.TPurchase_inv
    Left = 376
    Top = 8
  end
  object DataSource_inv_item: TDataSource
    DataSet = dm.qPurchase_inv_item_filtered
    Left = 496
    Top = 8
  end
end
