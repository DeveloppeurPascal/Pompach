program Pompach;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {fmrMain},
  Olf.RTL.Params in '..\lib-externes\librairies\Olf.RTL.Params.pas',
  cBattery in 'cBattery.pas' {cadBattery: TFrame},
  uDMTypoDesTitres in '..\_PRIVE\src\uDMTypoDesTitres.pas' {dmTypoDesTitres: TDataModule},
  Gamolf.RTL.Scores in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.RTL.Scores.pas',
  uKeyboardSpecialKeyTest in '..\lib-externes\librairies\uKeyboardSpecialKeyTest.pas',
  Olf.FMX.TextImageFrame in '..\lib-externes\librairies\Olf.FMX.TextImageFrame.pas' {OlfFMXTextImageFrame: TFrame},
  Gamolf.FMX.Joystick in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.FMX.Joystick.pas',
  Gamolf.RTL.Joystick.DirectInput.Win in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.RTL.Joystick.DirectInput.Win.pas',
  Gamolf.RTL.Joystick.Mac in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.RTL.Joystick.Mac.pas',
  Gamolf.RTL.Joystick in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.RTL.Joystick.pas',
  iOSapi.GameController in '..\lib-externes\Delphi-Game-Engine\src\iOSapi.GameController.pas',
  Macapi.GameController in '..\lib-externes\Delphi-Game-Engine\src\Macapi.GameController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmTypoDesTitres, dmTypoDesTitres);
  Application.CreateForm(TfmrMain, fmrMain);
  Application.Run;
end.
