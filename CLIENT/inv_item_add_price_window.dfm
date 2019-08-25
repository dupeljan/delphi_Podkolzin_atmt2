object INVOICE_ITEM_ADD_PRICE_FORM: TINVOICE_ITEM_ADD_PRICE_FORM
  Left = 0
  Top = 0
  Caption = #1044#1054#1041#1040#1042#1048#1058#1068' '#1058#1054#1042#1040#1056' '#1042' '#1053#1040#1050#1051#1040#1044#1053#1059#1070
  ClientHeight = 230
  ClientWidth = 639
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 496
    Top = 29
    Width = 42
    Height = 13
    Caption = #1050#1054#1051'_'#1042#1054
  end
  object Label2: TLabel
    Left = 507
    Top = 93
    Width = 28
    Height = 13
    Caption = #1062#1045#1053#1040
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 16
    Width = 345
    Height = 127
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PRODUCT_ID'
        Title.Caption = #1053#1054#1052#1045#1056
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_NAME'
        ReadOnly = True
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROVIDER_NAME'
        ReadOnly = True
        Title.Caption = #1055#1056#1054#1048#1047#1042#1054#1044#1048#1058#1045#1051#1068
        Width = 150
        Visible = True
      end>
  end
  object LabeledEdit1: TLabeledEdit
    Left = 456
    Top = 48
    Width = 121
    Height = 21
    EditLabel.Width = 61
    EditLabel.Height = 13
    EditLabel.Caption = 'LabeledEdit1'
    LabelSpacing = -15
    TabOrder = 1
  end
  object LabeledEdit2: TLabeledEdit
    Left = 456
    Top = 112
    Width = 121
    Height = 21
    EditLabel.Width = 61
    EditLabel.Height = 13
    EditLabel.Caption = 'LabeledEdit2'
    LabelSpacing = -15
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 480
    Top = 168
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 3
  end
  object DataSource1: TDataSource
    DataSet = dm.qProductWithProvider
    Left = 248
    Top = 120
  end
end
