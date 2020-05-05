object EXEL_INPUT_FORM: TEXEL_INPUT_FORM
  Left = 0
  Top = 0
  Caption = #1042#1042#1054#1044' '#1044#1040#1053#1053#1067#1061' '#1044#1051#1071' '#1054#1058#1063#1045#1058#1040
  ClientHeight = 321
  ClientWidth = 585
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
    Left = 40
    Top = 8
    Width = 42
    Height = 13
    Caption = #1055#1045#1056#1048#1054#1044
  end
  object Label2: TLabel
    Left = 104
    Top = 37
    Width = 43
    Height = 13
    Caption = #1053#1040#1063#1040#1051#1054
  end
  object Label3: TLabel
    Left = 104
    Top = 85
    Width = 36
    Height = 13
    Caption = #1050#1054#1053#1045#1062
  end
  object DateTimeFrom: TDateTimePicker
    Left = 40
    Top = 56
    Width = 186
    Height = 21
    Date = 43704.000000000000000000
    Time = 0.478155370372405700
    TabOrder = 0
  end
  object DateTimeTo: TDateTimePicker
    Left = 40
    Top = 104
    Width = 186
    Height = 21
    Date = 43704.000000000000000000
    Time = 0.478155370372405700
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 248
    Top = 56
    Width = 320
    Height = 177
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PROVIDER_NAME'
        Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082#1080
        Width = 200
        Visible = True
      end>
  end
  object BUTTON_ADD: TButton
    Left = 72
    Top = 160
    Width = 75
    Height = 25
    Caption = #1044#1054#1041#1040#1042#1048#1058#1068
    TabOrder = 3
    OnClick = BUTTON_ADDClick
  end
  object BUTTON_DELETE: TButton
    Left = 72
    Top = 191
    Width = 75
    Height = 25
    Caption = #1059#1044#1040#1051#1048#1058#1068
    TabOrder = 4
    OnClick = BUTTON_DELETEClick
  end
  object BUTTON_CREATE_EXEL: TButton
    Left = 56
    Top = 240
    Width = 113
    Height = 57
    Caption = #1057#1054#1047#1044#1040#1058#1068' '#1054#1058#1063#1045#1058
    TabOrder = 5
    OnClick = BUTTON_CREATE_EXELClick
  end
  object DataSource1: TDataSource
    DataSet = dm.qlist
    Left = 216
    Top = 224
  end
end
