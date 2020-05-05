object DIAGRAM_FORM: TDIAGRAM_FORM
  Left = 0
  Top = 0
  Caption = #1044#1048#1040#1043#1056#1040#1052#1052#1040
  ClientHeight = 607
  ClientWidth = 861
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
    Left = 16
    Top = 8
    Width = 42
    Height = 13
    Caption = #1055#1045#1056#1048#1054#1044
  end
  object Label2: TLabel
    Left = 112
    Top = 21
    Width = 43
    Height = 13
    Caption = #1053#1040#1063#1040#1051#1054
  end
  object Label3: TLabel
    Left = 112
    Top = 77
    Width = 36
    Height = 13
    Caption = #1050#1054#1053#1045#1062
  end
  object Image_daily_income: TImage
    Left = 8
    Top = 198
    Width = 845
    Height = 395
  end
  object Label5: TLabel
    Left = 595
    Top = 21
    Width = 55
    Height = 13
    Caption = #1055#1054#1057#1058#1040#1042#1050#1048
  end
  object DateTimePicker_from: TDateTimePicker
    Left = 40
    Top = 40
    Width = 186
    Height = 21
    Date = 43704.000000000000000000
    Time = 0.791732129626325300
    TabOrder = 0
  end
  object DateTimePicker_to: TDateTimePicker
    Left = 40
    Top = 96
    Width = 186
    Height = 21
    Date = 43704.000000000000000000
    Time = 0.791732129626325300
    TabOrder = 1
  end
  object Button_update: TButton
    Left = 96
    Top = 144
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = Button_updateClick
  end
  object DBGrid1: TDBGrid
    Left = 467
    Top = 40
    Width = 320
    Height = 120
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'THE_DATE'
        Title.Caption = #1044#1040#1058#1040
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Title.Caption = #1062#1045#1053#1040
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = dm.qGet_global_period_purchase
    Left = 264
    Top = 144
  end
end
