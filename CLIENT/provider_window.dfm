object PROVIDER_FORM: TPROVIDER_FORM
  Left = 0
  Top = 0
  Caption = #1055#1056#1054#1048#1047#1042#1054#1044#1048#1058#1045#1051#1048
  ClientHeight = 293
  ClientWidth = 542
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 542
    Height = 293
    Align = alClient
    DataSource = data_source1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Caption = #1053#1054#1052#1045#1056
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1045#1053#1048#1045
        Width = 300
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Left = 264
    Top = 152
    object ADD: TMenuItem
      Caption = #1044#1054#1041#1040#1042#1048#1058#1068
      OnClick = ADDClick
    end
    object DELETE: TMenuItem
      Caption = #1059#1044#1040#1051#1048#1058#1068
      OnClick = DELETEClick
    end
    object EDIT: TMenuItem
      Caption = #1048#1047#1052#1045#1053#1048#1058#1068
      OnClick = EDITClick
    end
  end
  object data_source1: TDataSource
    DataSet = dm.TProvider
    Left = 176
    Top = 152
  end
end
