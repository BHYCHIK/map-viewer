unit mf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, ComCtrls, terrain;

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
    procedure mmExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mmOpenClick(Sender: TObject);
    procedure btCameraApplyClick(Sender: TObject);
    procedure pbLandscapePaint(Sender: TObject);
  private
    terrainView: TBitmap;
    model: TPolygonPoints;
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
begin
  camera.X := StrToFloat(lePosX.Text);
  camera.Y := StrToInt(lePosY.Text);
  camera.Z := StrToFloat(lePosZ.Text);

  DrawWire(model, camera, StrToFloat(leRotAlpha.Text), StrToFloat(leRoBeta.Text),
    terrainView);

  Invalidate;
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

procedure TMainForm.pbLandscapePaint(Sender: TObject);
begin
  pbLandscape.Canvas.Draw(0, 0, terrainView);
end;

end.
