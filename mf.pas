unit mf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls;

type
  TMainForm = class(TForm)
    gbSettings: TGroupBox;
    PaintBox1: TPaintBox;
    MainMenu: TMainMenu;
    mmFile: TMenuItem;
    mmOpen: TMenuItem;
    mmExit: TMenuItem;
    procedure mmExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.mmExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
