unit mf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, ComCtrls, terrain, jpeg, Vcl.ExtDlgs;

type
  TMainForm = class(TForm)
    pbLandscape: TPaintBox;
    MainMenu: TMainMenu;
    mmFile: TMenuItem;
    mmOpen: TMenuItem;
    mmExit: TMenuItem;
    pcOptions: TPageControl;
    tsCamera: TTabSheet;
    tsLight: TTabSheet;
    lePosX: TLabeledEdit;
    lePosY: TLabeledEdit;
    lePosZ: TLabeledEdit;
    leRotAlpha: TLabeledEdit;
    leRoBeta: TLabeledEdit;
    btCameraApply: TButton;
    odOpenLandscape: TOpenDialog;
    leSunX: TLabeledEdit;
    leSunY: TLabeledEdit;
    leSunZ: TLabeledEdit;
    btSunApply: TButton;
    N1: TMenuItem;
    N2: TMenuItem;
    SavePictureDialog1: TSavePictureDialog;
    procedure mmExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mmOpenClick(Sender: TObject);
    procedure btCameraApplyClick(Sender: TObject);
    procedure pbLandscapePaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure pbLandscapeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pbLandscapeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
  private
    terrainView: TBitmap;
    model: TPolygonPoints;
    RememberedX: Integer;
    RememberedY: Integer;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.btCameraApplyClick(Sender: TObject);
var
  camera: TPolygonPoint;
  sun: TPolygonPoint;
begin
  try
    camera.RealX := StrToFloat(lePosX.Text);
    camera.RealY := StrToFloat(lePosY.Text);
    camera.RealZ := StrToFloat(lePosZ.Text);

    sun.RealX := StrToFloat(leSunX.Text);
    sun.RealY := StrToFloat(leSunY.Text);
    sun.RealZ := StrToFloat(leSunZ.Text);
    DrawSimple(model, camera, sun,StrToFloat(leRotAlpha.Text), StrToFloat(leRoBeta.Text), terrainView);

    Invalidate;
  except on e: Exception do
  begin
    ShowMessage('����������� ����');
  end;

  end;

end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  terrainView.Free;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  terrainView := TBitmap.Create;
  terrainView.Width := pbLandscape.Width;
  terrainView.Height := pbLandscape.Height;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  terrainView.Width := pbLandscape.Width;
  terrainView.Height := pbLandscape.Height;
end;

procedure TMainForm.mmExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMainForm.mmOpenClick(Sender: TObject);
begin
  if odOpenLandscape.Execute() then
  begin
    model := OpenTerrain(odOpenLandscape.FileName);
  end;

end;

procedure TMainForm.N1Click(Sender: TObject);
begin
  if SavePictureDialog1.Execute then
  begin
    terrainView.SaveToFile(SavePictureDialog1.FileName);
  end;
end;

procedure TMainForm.pbLandscapeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  RememberedX := X;
  RememberedY := Y;
end;

procedure TMainForm.pbLandscapeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   //lePosX.Text := IntToStr(StrToInt(lePosX.Text) - RememberedX + X);
   //PosY.Text := IntToStr(StrToInt(lePosX.Text) - RememberedY + Y);
   btCameraApply.Click;
end;

procedure TMainForm.pbLandscapePaint(Sender: TObject);
begin
  pbLandscape.Canvas.Draw(0, 0, terrainView);
end;

end.
