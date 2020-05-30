program J3_TimeLap;

uses
  System.StartUpCopy,
  FMX.Forms,
  FormPrincipal in 'FormPrincipal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
