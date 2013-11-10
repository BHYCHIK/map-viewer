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
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pbLandscape: TPaintBox
    Left = 153
    Top = 0
    Width = 692
    Height = 576
    Align = alClient
    OnMouseDown = pbLandscapeMouseDown
    OnMouseUp = pbLandscapeMouseUp
    OnPaint = pbLandscapePaint
    ExplicitLeft = 200
    ExplicitWidth = 645
  end
  object pcOptions: TPageControl
    Left = 0
    Top = 0
    Width = 153
    Height = 576
    ActivePage = tsCamera
    Align = alLeft
    TabOrder = 0
    object tsCamera: TTabSheet
      Caption = #1050#1072#1084#1077#1088#1072
      object lePosX: TLabeledEdit
        Left = 3
        Top = 160
        Width = 121
        Height = 21
        EditLabel.Width = 66
        EditLabel.Height = 13
        EditLabel.Caption = #1055#1086#1083#1086#1078#1077#1085#1080#1077' X'
        TabOrder = 0
        Text = '0'
      end
      object lePosY: TLabeledEdit
        Left = 3
        Top = 208
        Width = 121
        Height = 21
        EditLabel.Width = 66
        EditLabel.Height = 13
        EditLabel.Caption = #1055#1086#1083#1086#1078#1077#1085#1080#1077' Y'
        TabOrder = 1
        Text = '0'
      end
      object lePosZ: TLabeledEdit
        Left = 3
        Top = 112
        Width = 121
        Height = 21
        EditLabel.Width = 45
        EditLabel.Height = 13
        EditLabel.Caption = #1052#1072#1089#1096#1090#1072#1073
        TabOrder = 2
        Text = '1'
      end
      object leRotAlpha: TLabeledEdit
        Left = 3
        Top = 21
        Width = 121
        Height = 21
        EditLabel.Width = 84
        EditLabel.Height = 13
        EditLabel.Caption = #1055#1086#1074#1086#1088#1086#1090' '#1082#1072#1084#1077#1088#1099
        TabOrder = 3
        Text = '0'
      end
      object leRoBeta: TLabeledEdit
        Left = 3
        Top = 67
        Width = 121
        Height = 21
        EditLabel.Width = 78
        EditLabel.Height = 13
        EditLabel.Caption = #1053#1072#1082#1083#1086#1085' '#1082#1072#1084#1077#1088#1099
        TabOrder = 4
        Text = '0'
      end
      object btCameraApply: TButton
        Left = 3
        Top = 248
        Width = 121
        Height = 57
        Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
        TabOrder = 5
        OnClick = btCameraApplyClick
      end
    end
    object tsLight: TTabSheet
      Caption = #1057#1074#1077#1090
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object leSunX: TLabeledEdit
        Left = 11
        Top = 32
        Width = 121
        Height = 21
        EditLabel.Width = 66
        EditLabel.Height = 13
        EditLabel.Caption = #1055#1086#1083#1086#1078#1077#1085#1080#1077' X'
        TabOrder = 0
        Text = '0'
      end
      object leSunY: TLabeledEdit
        Left = 11
        Top = 72
        Width = 121
        Height = 21
        EditLabel.Width = 66
        EditLabel.Height = 13
        EditLabel.Caption = #1055#1086#1083#1086#1078#1077#1085#1080#1077' Y'
        TabOrder = 1
        Text = '0'
      end
      object leSunZ: TLabeledEdit
        Left = 11
        Top = 120
        Width = 121
        Height = 21
        EditLabel.Width = 66
        EditLabel.Height = 13
        EditLabel.Caption = #1055#1086#1083#1086#1078#1077#1085#1080#1077' Z'
        TabOrder = 2
        Text = '9999999999'
      end
      object btSunApply: TButton
        Left = 11
        Top = 256
        Width = 121
        Height = 57
        Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
        TabOrder = 3
        OnClick = btCameraApplyClick
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 416
    Top = 296
    object mmFile: TMenuItem
      Caption = #1060#1072#1081#1083
      object mmOpen: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = mmOpenClick
      end
      object N1: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = N1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mmExit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = mmExitClick
      end
    end
  end
  object odOpenLandscape: TOpenDialog
    DefaultExt = '*.rhmr'
    Filter = #1053#1077#1086#1073#1088#1072#1073#1086#1090#1072#1085#1085#1072#1103' '#1082#1072#1088#1090#1072' '#1074#1099#1089#1086#1090'|*.rhmr'
    Left = 672
    Top = 248
  end
  object SavePictureDialog1: TSavePictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 744
    Top = 320
  end
end
