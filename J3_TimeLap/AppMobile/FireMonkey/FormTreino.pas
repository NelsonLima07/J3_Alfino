unit FormTreino;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation;

type
  TFTreino = class(TForm)
    ScaledLayout1: TScaledLayout;
    Panel1: TPanel;
    Layout1: TLayout;
    btnLap: TButton;
    Label1: TLabel;
    Layout2: TLayout;
    Layout3: TLayout;
    Timer1: TTimer;
    procedure btnLapClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    FMilisegundos: Integer;
  public
    { Public declarations }
  end;

var
  FTreino: TFTreino;

implementation

{$R *.fmx}

procedure TFTreino.btnLapClick(Sender: TObject);
begin
  FMilisegundos := 0;
  Timer1.Enabled := true;
end;

procedure TFTreino.Timer1Timer(Sender: TObject);
var
  minutos:Integer;
  segundos:Integer;
  milisegundos:Integer;
begin
  FMilisegundos := FMilisegundos + 10;

  minutos := (FMilisegundos div 1000) div 60;
  segundos := (FMilisegundos div 1000) mod 60;
  milisegundos := FMilisegundos - ((FMilisegundos div 1000)  * 1000);

  Label1.Text := IntToStr(minutos) + ':' + IntToStr(segundos) + '.' + IntToStr(milisegundos);
end;

end.
