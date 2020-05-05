object INV_FORM: TINV_FORM
  Left = 0
  Top = 0
  Caption = #1057#1054#1047#1044#1040#1053#1048#1045'  '#1058#1054#1042#1040#1056#1053#1054'-'#1058#1056#1040#1053#1057#1055#1054#1056#1058#1053#1054#1049' '#1053#1040#1050#1051#1040#1044#1053#1054#1049
  ClientHeight = 390
  ClientWidth = 791
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 88
    Top = 107
    Width = 28
    Height = 13
    Caption = #1044#1040#1058#1040
  end
  object Label2: TLabel
    Left = 48
    Top = 40
    Width = 103
    Height = 13
    Caption = #1053#1054#1052#1045#1056' '#1053#1040#1050#1051#1040#1044#1053#1054#1049
  end
  object LABEL_INV_NUMBER: TLabel
    Left = 48
    Top = 59
    Width = 99
    Height = 13
    Caption = 'LABEL_INV_NUMBER'
  end
  object Label3: TLabel
    Left = 440
    Top = 123
    Width = 93
    Height = 13
    Caption = #1057#1055#1048#1057#1054#1050' '#1058#1054#1042#1040#1056#1054#1042
  end
  object Label4: TLabel
    Left = 456
    Top = 21
    Width = 66
    Height = 13
    Caption = #1055#1054#1057#1058#1040#1042#1065#1048#1050
  end
  object PICKER_DATA_INV: TDateTimePicker
    Left = 16
    Top = 126
    Width = 186
    Height = 21
    Date = 43702.000000000000000000
    Time = 0.594005995371844600
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 224
    Top = 142
    Width = 567
    Height = 235
    DataSource = DataSource1
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
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_NAME'
        Title.Caption = #1058#1054#1042#1040#1056
        Width = 150
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
  object BUTTON_ADD_PRODUCT: TButton
    Left = 56
    Top = 256
    Width = 105
    Height = 25
    Caption = #1044#1054#1041#1040#1042#1048#1058#1068' '#1058#1054#1042#1040#1056
    TabOrder = 2
    OnClick = BUTTON_ADD_PRODUCTClick
  end
  object BUTTON_DELETE_PRODUCT: TButton
    Left = 56
    Top = 304
    Width = 105
    Height = 25
    Caption = #1059#1044#1040#1051#1048#1058#1068' '#1058#1054#1042#1040#1056
    TabOrder = 3
    OnClick = BUTTON_DELETE_PRODUCTClick
  end
  object BitBtn1: TBitBtn
    Left = 72
    Top = 352
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 4
  end
  object DBGrid2: TDBGrid
    Left = 224
    Top = 40
    Width = 559
    Height = 77
    DataSource = DataSource2
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TEL'
        Title.Caption = #1058#1077#1083#1077#1092#1086#1085
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = dm.qPurchase_inv_item_filtered
    Left = 440
    Top = 232
  end
  object DataSource2: TDataSource
    DataSet = dm.TShipper
    Left = 232
    Top = 168
  end
end
