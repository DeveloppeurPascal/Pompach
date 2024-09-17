/// <summary>
/// ***************************************************************************
///
/// Pompach
///
/// Copyright 2017-2024 Patrick Prémartin under AGPL 3.0 license.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
/// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
/// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
/// DEALINGS IN THE SOFTWARE.
///
/// ***************************************************************************
///
/// Author(s) :
/// Patrick PREMARTIN
///
/// Site :
/// https://pompach.gamolf.fr/
///
/// Project site :
/// https://github.com/DeveloppeurPascal/Pompach/
///
/// ***************************************************************************
/// File last update : 2024-09-17T17:59:24.480+02:00
/// Signature : a3c3e3f4d33e65df524b1f4833dab71949a6fc64
/// ***************************************************************************
/// </summary>

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
