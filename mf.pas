unit mf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, ComCtrls, terrain;

type
  TMainForm = class(TForm)
    PaintBox1: TPaintBox;
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
    leRotX: TLabeledEdit;
    leRoY: TLabeledEdit;
    leRotZ: TLabeledEdit;
    btCameraApply: TButton;
    odOpenLandscape: TOpenDialog;
    procedure mmExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    map: TBitmap;
    terrainView: TBitmap;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  terrainView.Free;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  terrainView = TBitmap.Create;
end;

procedure TMainForm.mmExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
