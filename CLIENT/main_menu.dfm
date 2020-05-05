object MAIN_MENU_FORM: TMAIN_MENU_FORM
  Left = 0
  Top = 0
  Caption = #1043#1051#1040#1042#1053#1054#1045' '#1052#1045#1053#1070
  ClientHeight = 768
  ClientWidth = 819
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
  object Label1: TLabel
    Left = 326
    Top = 440
    Width = 110
    Height = 13
    Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086#1089#1090#1072#1074#1086#1082
  end
  object Label2: TLabel
    Left = 472
    Top = 232
    Width = 178
    Height = 13
    Caption = #1054#1055#1051#1040#1058#1040' '#1042#1067#1041#1056#1040#1053#1053#1054#1049' '#1053#1040#1050#1051#1040#1044#1053#1054#1049' '
  end
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
    Top = 39
    Width = 485
    Height = 186
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
        FieldName = 'PROVIDER_NAME'
        Title.Caption = #1055#1056#1054#1048#1047#1042#1054#1044#1048#1058#1045#1051#1068
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_NAME'
        Title.Caption = #1058#1054#1042#1040#1056
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_COUNT'
        Title.Caption = #1050#1054#1051#1048#1063#1045#1057#1058#1042#1054
        Width = 100
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
      #1055#1056#1054#1044#1040#1046#1048' '#1047#1040' '#1044#1045#1053#1068)
  end
  object DBGrid_inv_loss: TDBGrid
    Left = 326
    Top = 256
    Width = 485
    Height = 178
    DataSource = DataSource_inv_loss
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PURCHASE_INV_ID'
        Title.Caption = #1053#1040#1050#1051#1040#1044#1053#1040#1071' '#8470
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID'
        Title.Caption = #1053#1054#1052#1045#1056
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'THE_DATE'
        Title.Caption = #1044#1040#1058#1040
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUM_'
        Title.Caption = #1057#1059#1052#1052#1040
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 459
    Width = 803
    Height = 302
    DataSource = DataSource2
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PURCHASE_INV_ID'
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHIPPER_NAME'
        Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'THE_DATE'
        Title.Caption = #1044#1072#1090#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COST'
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RETURNED'
        Title.Caption = #1047#1072#1087#1083#1072#1095#1077#1085#1086
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RETURN_LEFT'
        Title.Caption = #1044#1086#1083#1075
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBT'
        Title.Caption = #1054#1087#1083#1072#1095#1077#1085#1086'?'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_EXPIRED'
        Title.Caption = #1055#1088#1086#1089#1088#1086#1095#1077#1085#1086'?'
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Left = 360
    Top = 128
    object MENU_SHIPPER: TMenuItem
      Caption = #1055#1054#1057#1058#1040#1042#1065#1048#1050#1048
      OnClick = MENU_SHIPPERClick
    end
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
        Caption = #1044#1054#1041#1040#1042#1048#1058#1068' '#1054#1055#1051#1040#1058#1059' '#1055#1056#1048#1061#1054#1044#1040
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
        Caption = #1069#1050#1057#1055#1054#1056#1058' '#1058'.'#1058'. '#1053#1040#1050#1051#1040#1044#1053#1054#1049
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
  object DataSource_inv_loss: TDataSource
    DataSet = dm.QLoss_filetered
    Left = 504
    Top = 128
  end
  object DataSource2: TDataSource
    DataSet = dm.qInv_full_info
    Left = 444
    Top = 408
  end
end
