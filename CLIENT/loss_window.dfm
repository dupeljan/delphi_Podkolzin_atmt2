object LOSS_FORM: TLOSS_FORM
  Left = 0
  Top = 0
  Caption = #1057#1054#1047#1044#1040#1053#1048#1045' '#1057#1055#1048#1057#1040#1053#1048#1071
  ClientHeight = 390
  ClientWidth = 733
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
  object BUTTON_ADD_PRODUCT: TButton
    Left = 64
    Top = 248
    Width = 105
    Height = 25
    Caption = #1044#1054#1041#1040#1042#1048#1058#1068' '#1058#1054#1042#1040#1056
    TabOrder = 1
    OnClick = BUTTON_ADD_PRODUCTClick
  end
  object BUTTON_DELETE_PRODUCT: TButton
    Left = 64
    Top = 296
    Width = 105
    Height = 25
    Caption = #1059#1044#1040#1051#1048#1058#1068' '#1058#1054#1042#1040#1056
    TabOrder = 2
    OnClick = BUTTON_DELETE_PRODUCTClick
  end
  object BitBtn1: TBitBtn
    Left = 80
    Top = 344
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 3
  end
  object DBGrid2: TDBGrid
    Left = 56
    Top = 122
    Width = 641
    Height = 95
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
        Visible = True
      end>
  end
  object Edit_sum: TEdit
    Left = 256
    Top = 83
    Width = 121
    Height = 21
    TabOrder = 5
    Text = '0'
  end
  object DataSource2: TDataSource
    DataSet = dm.qInv_full_info
    Left = 200
    Top = 232
  end
end
