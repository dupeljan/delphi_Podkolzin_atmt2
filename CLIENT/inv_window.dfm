object INV_FORM: TINV_FORM
  Left = 0
  Top = 0
  Caption = #1057#1054#1047#1044#1040#1053#1048#1045' '#1053#1040#1050#1051#1040#1044#1053#1054#1049
  ClientHeight = 390
  ClientWidth = 727
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 104
    Top = 96
    Width = 28
    Height = 13
    Caption = #1044#1040#1058#1040
  end
  object DateTimePicker1: TDateTimePicker
    Left = 48
    Top = 120
    Width = 186
    Height = 21
    Date = 43702.000000000000000000
    Time = 0.594005995371844600
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 240
    Top = 8
    Width = 465
    Height = 345
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object BUTTON_ADD_PRODUCT: TButton
    Left = 88
    Top = 208
    Width = 105
    Height = 25
    Caption = #1044#1054#1041#1040#1042#1048#1058#1068' '#1058#1054#1042#1040#1056
    TabOrder = 2
  end
  object BUTTON_DELETE_PRODUCT: TButton
    Left = 88
    Top = 256
    Width = 105
    Height = 25
    Caption = #1059#1044#1040#1051#1048#1058#1068' '#1058#1054#1042#1040#1056
    TabOrder = 3
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
    DataSet = dm.TPurchase_inv
    Left = 440
    Top = 232
  end
end
