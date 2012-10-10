object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #1042#1080#1079#1091#1072#1083#1080#1079#1072#1090#1086#1088' '#1083#1072#1085#1076#1096#1072#1092#1090#1086#1074
  ClientHeight = 576
  ClientWidth = 845
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 145
    Top = 0
    Width = 700
    Height = 576
    Align = alClient
    ExplicitLeft = 736
    ExplicitTop = 328
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object gbSettings: TGroupBox
    Left = 0
    Top = 0
    Width = 145
    Height = 576
    Align = alLeft
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    TabOrder = 0
  end
  object MainMenu: TMainMenu
    Left = 416
    Top = 296
    object mmFile: TMenuItem
      Caption = #1060#1072#1081#1083
      object mmOpen: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
      end
      object mmExit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = mmExitClick
      end
    end
  end
end
