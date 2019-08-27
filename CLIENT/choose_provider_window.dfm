object CHOOSE_PROVIDER_FORM: TCHOOSE_PROVIDER_FORM
  Left = 0
  Top = 0
  Caption = #1055#1056#1054#1048#1047#1042#1054#1044#1048#1058#1045#1051#1048
  ClientHeight = 231
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 200
    Top = 176
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 56
    Top = 24
    Width = 320
    Height = 120
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = dm.TProvider
    Left = 240
    Top = 120
  end
end
