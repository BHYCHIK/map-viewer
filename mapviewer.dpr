program mapviewer;

uses
  Forms,
  mf in 'mf.pas' {MainForm},
  terrain in 'terrain.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
