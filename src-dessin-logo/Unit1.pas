unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  Radiant.Shapes, FMX.TMSBaseControl, FMX.TMSLedmeter, FMX.Objects, FMX.Layouts;

type
  TForm1 = class(TForm)
    pile: TLayout;
    RadiantRectangle1: TRadiantRectangle;
    gaugeLED: TTMSFMXLEDMeter;
    visuelFleche: TRadiantArrow;
    RadiantCapsule1: TRadiantCapsule;
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormShow(Sender: TObject);
begin
pile.MakeScreenshot.SaveToFile('C:\Users\PATRICK PREMARTIN\Desktop\pompach-logo-1024x1024.png');
end;

end.
