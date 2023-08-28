unit cBattery;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects;

type
  TcadBattery = class(TFrame)
    background: TRectangle;
    charge: TRectangle;
    NiveauChargeActuelle: TTimer;
    procedure NiveauChargeActuelleTimer(Sender: TObject);
  private
    FChargeLevel: integer;
    FMaxLevel: integer;
    FMinLevel: integer;
    famplitude: integer;
    FonBatteryEmpty: tnotifyevent;
    FonBatteryFull: tnotifyevent;
    FAnimationActive: boolean;
    procedure SetChargeLevel(const Value: integer);
    procedure SetMaxLevel(const Value: integer);
    procedure SetMinLevel(const Value: integer);
    procedure SetonBatteryEmpty(const Value: tnotifyevent);
    procedure SetonBatteryFull(const Value: tnotifyevent);
    procedure SetAnimationActive(const Value: boolean);
    { Déclarations privées }
  public
    { Déclarations publiques }
    property ChargeLevel: integer read FChargeLevel write SetChargeLevel;
    property MinLevel: integer read FMinLevel write SetMinLevel;
    property MaxLevel: integer read FMaxLevel write SetMaxLevel;
    property onBatteryEmpty: tnotifyevent read FonBatteryEmpty
      write SetonBatteryEmpty;
    property onBatteryFull: tnotifyevent read FonBatteryFull
      write SetonBatteryFull;
    property AnimationActive: boolean read FAnimationActive
      write SetAnimationActive;
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.fmx}

constructor TcadBattery.Create(AOwner: TComponent);
begin
  famplitude := 0;
  FMinLevel := 0;
  FMaxLevel := 100;
  FChargeLevel := FMinLevel;
  FAnimationActive := false;
  inherited;
  tthread.ForceQueue(nil,
    procedure
    begin
      background.position.x := 0;
      background.position.y := 0;
      charge.TagFloat := background.Height - background.padding.Top -
        background.padding.Bottom;
      width := background.width;
      Height := background.Height;
      // TODO : vérifier le positionnement de la zone après son redimensionnement (qui ne recalcule pas l'alignement et donc la position) => contournement effectué par mise en dur des tailles et positions
    end);
end;

procedure TcadBattery.SetAnimationActive(const Value: boolean);
begin
  if (FAnimationActive <> Value) then
    if Value then
    begin
      NiveauChargeActuelle.Tag := FChargeLevel;
      NiveauChargeActuelle.enabled := true;
    end
    else
      NiveauChargeActuelle.enabled := false;
  FAnimationActive := Value;
end;

procedure TcadBattery.SetChargeLevel(const Value: integer);
begin
  if Value < FMinLevel then
    FChargeLevel := FMinLevel
  else if Value > FMaxLevel then
    FChargeLevel := FMaxLevel
  else
    FChargeLevel := Value;
end;

procedure TcadBattery.SetMaxLevel(const Value: integer);
begin
  FMaxLevel := Value;
  famplitude := FMaxLevel - FMinLevel;
end;

procedure TcadBattery.SetMinLevel(const Value: integer);
begin
  FMinLevel := Value;
  famplitude := FMaxLevel - FMinLevel;
end;

procedure TcadBattery.SetonBatteryEmpty(const Value: tnotifyevent);
begin
  FonBatteryEmpty := Value;
end;

procedure TcadBattery.SetonBatteryFull(const Value: tnotifyevent);
begin
  FonBatteryFull := Value;
end;

procedure TcadBattery.NiveauChargeActuelleTimer(Sender: TObject);
begin
  if not FAnimationActive then
    exit;

  if (NiveauChargeActuelle.Tag < FChargeLevel) then
    NiveauChargeActuelle.Tag := NiveauChargeActuelle.Tag + 1
  else if (NiveauChargeActuelle.Tag > FChargeLevel) then
    NiveauChargeActuelle.Tag := NiveauChargeActuelle.Tag - 1;

  case NiveauChargeActuelle.Tag of
    0 .. 9:
      charge.Fill.Color := talphacolors.darkred;
    10 .. 19:
      charge.Fill.Color := talphacolors.red;
    20 .. 34:
      charge.Fill.Color := talphacolors.darkorange;
    35 .. 49:
      charge.Fill.Color := talphacolors.orange;
    50 .. 59:
      charge.Fill.Color := talphacolors.yellow;
    60 .. 74:
      charge.Fill.Color := talphacolors.lightgreen;
    75 .. 89:
      charge.Fill.Color := talphacolors.green;
  else
    charge.Fill.Color := talphacolors.darkGreen;
  end;
  charge.Height := charge.TagFloat * NiveauChargeActuelle.Tag / famplitude;

  if (NiveauChargeActuelle.Tag = FMinLevel) and assigned(onBatteryEmpty) then
    onBatteryEmpty(self);
  if (NiveauChargeActuelle.Tag = FMaxLevel) and assigned(onBatteryFull) then
    onBatteryFull(self);
end;

end.
