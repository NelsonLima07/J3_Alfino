unit FormPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls, FMX.Controls.Presentation, System.Bluetooth,
  System.Bluetooth.Components, FMX.Objects, System.ImageList, FMX.ImgList;

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
    Button3: TButton;
    Button4: TButton;
    lblData: TLabel;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Image1: TImage;
    ImageList1: TImageList;
    Image2: TImage;
    Glyph1: TGlyph;
    procedure btnTreinoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
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

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
  lblData.Text := FormatDateTime('dd/mm/yyyy',now);
end;

procedure TFPrincipal.Image1Click(Sender: TObject);
begin
  Bluetooth1.Enabled := not Bluetooth1.Enabled;
  if Bluetooth1.Enabled then

end;

end.
