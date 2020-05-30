unit FormPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls, FMX.Controls.Presentation, System.Bluetooth,
  System.Bluetooth.Components;

type
  TFPrincipal = class(TForm)
    ScaledLayout1: TScaledLayout;
    Layout1: TLayout;
    Layout2: TLayout;
    Label1: TLabel;
    btnTreino: TButton;
    btnCorrida: TButton;
    Button1: TButton;
    Bluetooth1: TBluetooth;
    procedure btnTreinoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.fmx}

uses FormTreino;

procedure TFPrincipal.btnTreinoClick(Sender: TObject);
begin
  FTreino.Show;
end;

end.
