object shipper_form: Tshipper_form
  Left = 0
  Top = 0
  Caption = 'shipper_form'
  ClientHeight = 231
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 505
    Height = 233
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
        FieldName = 'NAME'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TEL'
        Title.Caption = #1058#1077#1083#1077#1092#1086#1085
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Left = 272
    Top = 112
    object MENU_ADD: TMenuItem
      Caption = #1044#1054#1041#1040#1042#1048#1058#1068
      OnClick = MENU_ADDClick
    end
    object MENU_DELETE: TMenuItem
      Caption = #1059#1044#1040#1051#1048#1058#1068
      OnClick = MENU_DELETEClick
    end
    object MENU_EDIT: TMenuItem
      Caption = #1048#1047#1052#1045#1053#1048#1058#1068
      OnClick = MENU_EDITClick
    end
  end
  object DataSource1: TDataSource
    DataSet = dm.TShipper
    Left = 112
    Top = 80
  end
end
