object LOSS_FORM: TLOSS_FORM
  Left = 0
  Top = 0
  Caption = #1057#1054#1047#1044#1040#1053#1048#1045' '#1050#1042#1048#1058#1040#1053#1062#1048#1048' '#1054#1055#1051#1040#1058#1067' '#1053#1040#1050#1051#1040#1044#1053#1054#1049
  ClientHeight = 390
  ClientWidth = 773
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
    Left = 96
    Top = 64
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
  object LABEL_LOSS_NUMBER: TLabel
    Left = 76
    Top = 43
    Width = 107
    Height = 13
    Caption = 'LABEL_LOSS_NUMBER'
  end
  object Label3: TLabel
    Left = 256
    Top = 42
    Width = 31
    Height = 13
    Caption = #1057#1091#1084#1084#1072
  end
  object PICKER_DATA_LOSS: TDateTimePicker
    Left = 40
    Top = 83
    Width = 186
    Height = 21
    Date = 43702.000000000000000000
    Time = 0.594005995371844600
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 49
    Top = 357
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
  end
  object DBGrid2: TDBGrid
    Left = 12
    Top = 131
    Width = 753
    Height = 207
    DataSource = DataSource2
    TabOrder = 2
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
  object Edit_sum: TEdit
    Left = 256
    Top = 83
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '0'
  end
  object DataSource2: TDataSource
    DataSet = dm.qInv_full_info
    Left = 448
    Top = 72
  end
end
