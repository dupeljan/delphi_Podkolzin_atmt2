object DAILY_INCOME_FORM: TDAILY_INCOME_FORM
  Left = 0
  Top = 0
  Caption = #1057#1054#1047#1044#1040#1053#1048#1045' '#1055#1056#1054#1044#1040#1046' '#1047#1040' '#1044#1045#1053#1068
  ClientHeight = 390
  ClientWidth = 743
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
    Left = 104
    Top = 96
    Width = 28
    Height = 13
    Caption = #1044#1040#1058#1040
  end
  object Label2: TLabel
    Left = 76
    Top = 24
    Width = 103
    Height = 13
    Caption = #1053#1054#1052#1045#1056' '#1053#1040#1050#1051#1040#1044#1053#1054#1049
  end
  object LABEL_DAILY_INCOME_NUMBER: TLabel
    Left = 68
    Top = 43
    Width = 157
    Height = 13
    Caption = 'LABEL_DAILY_INCOME_NUMBER'
  end
  object PICKER_DATA_LOSS: TDateTimePicker
    Left = 48
    Top = 115
    Width = 186
    Height = 21
    Date = 43702.000000000000000000
    Time = 0.594005995371844600
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 240
    Top = 8
    Width = 489
    Height = 345
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
    Left = 88
    Top = 208
    Width = 105
    Height = 25
    Caption = #1044#1054#1041#1040#1042#1048#1058#1068' '#1058#1054#1042#1040#1056
    TabOrder = 2
    OnClick = BUTTON_ADD_PRODUCTClick
  end
  object BUTTON_DELETE_PRODUCT: TButton
    Left = 88
    Top = 256
    Width = 105
    Height = 25
    Caption = #1059#1044#1040#1051#1048#1058#1068' '#1058#1054#1042#1040#1056
    TabOrder = 3
    OnClick = BUTTON_DELETE_PRODUCTClick
  end
  object BitBtn1: TBitBtn
    Left = 104
    Top = 304
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 4
  end
  object DataSource1: TDataSource
    DataSet = dm.qDaily_income_item_filtered
    Left = 440
    Top = 232
  end
end
