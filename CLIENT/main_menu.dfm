object MAIN_MENU_FORM: TMAIN_MENU_FORM
  Left = 0
  Top = 0
  Align = alClient
  Caption = #1043#1051#1040#1042#1053#1054#1045' '#1052#1045#1053#1070
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
  object MainMenu1: TMainMenu
    Left = 360
    Top = 128
    object MENU_PROVIDER: TMenuItem
      Caption = #1055#1056#1054#1048#1047#1042#1054#1044#1048#1058#1045#1051#1048
      OnClick = MENU_PROVIDERClick
    end
    object MENU_PRODUCT: TMenuItem
      Caption = #1058#1054#1042#1040#1056#1067
      OnClick = MENU_PRODUCTClick
    end
    object N1: TMenuItem
      Caption = #1053#1040#1050#1051#1040#1044#1053#1067#1045
      object N2: TMenuItem
        Caption = #1044#1054#1041#1040#1042#1048#1058#1068' '#1055#1056#1048#1061#1054#1044
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1044#1054#1041#1040#1042#1048#1058#1068' '#1057#1055#1048#1057#1040#1053#1048#1045
      end
      object N4: TMenuItem
        Caption = #1044#1054#1041#1040#1042#1048#1058#1068' '#1055#1056#1054#1044#1040#1046#1048' '#1047#1040' '#1044#1045#1053#1068
      end
      object N5: TMenuItem
        Caption = #1059#1044#1040#1051#1048#1058#1068' '#1053#1040#1050#1051#1040#1044#1053#1059#1070
      end
      object N6: TMenuItem
        Caption = #1069#1050#1057#1055#1054#1056#1058' '#1042' '#1042#1054#1056#1044
      end
    end
    object N7: TMenuItem
      Caption = #1054#1058#1063#1045#1058
    end
    object N8: TMenuItem
      Caption = #1044#1048#1040#1043#1056#1040#1052#1052#1040
    end
  end
end
