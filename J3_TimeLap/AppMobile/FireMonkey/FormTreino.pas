unit FormTreino;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation, System.UIConsts;

type
  TFTreino = class(TForm)
    ScaledLayout1: TScaledLayout;
    Panel1: TPanel;
    Layout1: TLayout;
    btnLap: TButton;
    Label1: TLabel;
    Layout2: TLayout;
    Layout3: TLayout;
    TmrTempo: TTimer;
    lblMelhorBolta: TLabel;
    Label2: TLabel;
    lblVolta: TLabel;
    BtnFinalizaTreino: TButton;
    lblRefVolta: TLabel;
    procedure TmrTempoTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLapClick(Sender: TObject);
    procedure BtnFinalizaTreinoClick(Sender: TObject);
  private
    { Private declarations }
    FConfigTempoMostraVolta: Integer; (* Quanto tempo a tela fica em exibicao sem segundos *)

    FTreinoIniciado: Boolean;
    FMilisegundos: Integer;
    FVoltaAtual: Integer;
    FVoltaTotal: Integer;

    FTempoMelhorVolta: Integer;
    FTempoUltimaVolta: Integer;
    FTempoVoltaAtual: Integer;

    procedure IniciaTreino;
    procedure FinalizaTreino;
  public
    { Public declarations }

  end;

const CONFIG_TEMPO_EXIBE_VOLTA = 7; (* Tempo em segundos *)

var
  FTreino: TFTreino;

implementation

{$R *.fmx}

procedure TFTreino.BtnFinalizaTreinoClick(Sender: TObject);
begin
  FinalizaTreino;
end;

procedure TFTreino.btnLapClick(Sender: TObject);
var
  RefenciaVoltaAnterior: Integer;
begin
  if FTreinoIniciado then
  begin
    FVoltaAtual := FMilisegundos;
    FMilisegundos := 0;

    FVoltaTotal := FVoltaTotal + 1;
    FVoltaAtual := FVoltaAtual + 1;
    lblVolta.Text := IntToStr(FVoltaAtual);
    FConfigTempoMostraVolta := CONFIG_TEMPO_EXIBE_VOLTA * 1000;

    RefenciaVoltaAnterior := FVoltaAtual - FTempoUltimaVolta;
    if (RefenciaVoltaAnterior < 0) then
    begin
      lblRefVolta.TextSettings.FontColor := claBlue;
      lblRefVolta.Text := IntToStr(RefenciaVoltaAnterior);
    end
    else
    begin
      lblRefVolta.TextSettings.FontColor := claRed;
      lblRefVolta.Text := '+' + IntToStr(RefenciaVoltaAnterior);
    end;

    FTempoUltimaVolta := FVoltaAtual;

  end
  else
  begin
    IniciaTreino;
  end;
end;

procedure TFTreino.FinalizaTreino;
begin
  FTreinoIniciado := False;
  TmrTempo.Enabled := False;
end;

procedure TFTreino.FormCreate(Sender: TObject);
Begin
  FTreinoIniciado := False;
  //FConfigTempoMostraVolta := CONFIG_TEMPO_EXIBE_VOLTA * 1000;
end;

procedure TFTreino.IniciaTreino;
begin
  FTreinoIniciado := True;
  FVoltaAtual := 1;
  FVoltaTotal := 0;
  FMilisegundos := 0;
  TmrTempo.Enabled := True;

  FTempoMelhorVolta := 0;
  FTempoUltimaVolta := 0;
  FTempoVoltaAtual := 0;

  FConfigTempoMostraVolta := 0;
end;

procedure TFTreino.TmrTempoTimer(Sender: TObject);
var
  minutos:Integer;
  segundos:Integer;
  milisegundos:Integer;
begin
  FMilisegundos := FMilisegundos + 10;

  minutos := (FMilisegundos div 1000) div 60;
  segundos := (FMilisegundos div 1000) mod 60;
  milisegundos := FMilisegundos - ((FMilisegundos div 1000)  * 1000);

  if FConfigTempoMostraVolta > 0 then
    FConfigTempoMostraVolta := FConfigTempoMostraVolta - 10
  else
    Label1.Text := FormatFloat('0',minutos) + ':' + FormatFloat('00',segundos) + '.' + FormatFloat('00',milisegundos);
end;

end.
