program J3_TimeLap;

uses
  System.StartUpCopy,
  FMX.Forms,
  FormPrincipal in 'FormPrincipal.pas' {FPrincipal},
  FormTreino in 'FormTreino.pas' {FTreino};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Landscape, TFormOrientation.InvertedLandscape];
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TFTreino, FTreino);
  Application.Run;
end.
