program Pompach;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {fmrMain},
  cBattery in 'cBattery.pas' {cadBattery: TFrame},
  uDMTypoDesTitres in '..\_PRIVE\src\uDMTypoDesTitres.pas' {dmTypoDesTitres: TDataModule},
  Gamolf.RTL.Scores in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.RTL.Scores.pas',
  Gamolf.FMX.Joystick in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.FMX.Joystick.pas',
  Gamolf.RTL.Joystick.DirectInput.Win in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.RTL.Joystick.DirectInput.Win.pas',
  Gamolf.RTL.Joystick.Mac in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.RTL.Joystick.Mac.pas',
  Gamolf.RTL.Joystick in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.RTL.Joystick.pas',
  iOSapi.GameController in '..\lib-externes\Delphi-Game-Engine\src\iOSapi.GameController.pas',
  Macapi.GameController in '..\lib-externes\Delphi-Game-Engine\src\Macapi.GameController.pas',
  Olf.FMX.TextImageFrame in '..\lib-externes\librairies\src\Olf.FMX.TextImageFrame.pas' {OlfFMXTextImageFrame: TFrame},
  Olf.RTL.Params in '..\lib-externes\librairies\src\Olf.RTL.Params.pas',
  uKeyboardSpecialKeyTest in '..\lib-externes\librairies\src\uKeyboardSpecialKeyTest.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmTypoDesTitres, dmTypoDesTitres);
  Application.CreateForm(TfmrMain, fmrMain);
  Application.Run;
end.
