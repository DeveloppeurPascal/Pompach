unit fMain;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Objects,
  FMX.Layouts,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Ani,
  FMX.Edit,
  FMX.ScrollBox,
  FMX.Memo,
  System.Rtti,
  FMX.Grid.Style,
  FMX.Grid,
  FMX.Colors,
  cBattery,
  Gamolf.RTL.Scores,
  Olf.FMX.TextImageFrame,
  Gamolf.RTL.Joystick;

Const
  CChargeMin = 0;
  CChargeMax = 100;
  CChargeInitiale = 5;
  CChargeAmplitude = (CChargeMax - CChargeMin) div 10;

type
{$SCOPEDENUMS ON}
  TFlecheDirection = (gauche, droite);

  TfmrMain = class(TForm)
    ecranMenu: TLayout;
    ecranScore: TLayout;
    ecranCredits: TLayout;
    ecranJeu: TLayout;
    ecranFinDePartie: TLayout;
    GridPanelLayout1: TGridPanelLayout;
    btnPlay: TRoundRect;
    lblMenuPlay: TLabel;
    btnScore: TRoundRect;
    lblMenuScore: TLabel;
    btnCredits: TRoundRect;
    lblMenuCredits: TLabel;
    aniEcranAAfficher: TFloatAnimation;
    aniEcranAMasquer: TFloatAnimation;
    StyleEmeraldCrystal: TStyleBook;
    btnDroite: TSpeedButton;
    btnGauche: TSpeedButton;
    GridPanelLayout2: TGridPanelLayout;
    timerBaisseNiveauBatterie: TTimer;
    ColorAnimation1: TColorAnimation;
    ColorAnimation3: TColorAnimation;
    ColorAnimation4: TColorAnimation;
    ColorAnimation5: TColorAnimation;
    ColorAnimation6: TColorAnimation;
    ColorAnimation8: TColorAnimation;
    zoneSaisie: TLayout;
    edtNomduJoueur: TEdit;
    Layout1: TLayout;
    btnEnregistrerScore: TRoundRect;
    lblEnregistrerScore: TLabel;
    ColorAnimation11: TColorAnimation;
    ColorAnimation12: TColorAnimation;
    lblCreditsDuJeu: TLabel;
    VertScrollBox1: TVertScrollBox;
    listeScores: TStringGrid;
    listeScoresJoueurs: TStringColumn;
    listeScoresBatteries: TIntegerColumn;
    listeScoresScore: TIntegerColumn;
    btnQuitter: TRoundRect;
    lblMenuQuitter: TLabel;
    ColorAnimation2: TColorAnimation;
    ColorAnimation7: TColorAnimation;
    Gauge: TTrackBar;
    Pile: TcadBattery;
    FlecheVersLaGauche: TRectangle;
    FlecheVersLaDroite: TRectangle;
    FooterEcranCredits: TLayout;
    btnRetourMenuDepuisEcranCredits: TRoundRect;
    Label1: TLabel;
    ColorAnimation9: TColorAnimation;
    ColorAnimation10: TColorAnimation;
    FooterEcranFinDePartie: TLayout;
    btnRetourMenuDepuisEcranFinDePartie: TRoundRect;
    Label2: TLabel;
    ColorAnimation13: TColorAnimation;
    ColorAnimation14: TColorAnimation;
    FooterEcranScore: TLayout;
    btnRetourMenuDepuisEcranScore: TRoundRect;
    Label3: TLabel;
    ColorAnimation15: TColorAnimation;
    ColorAnimation16: TColorAnimation;
    pnlHeader: TLayout;
    zoneClicableDroite: TLayout;
    zoneClicableGauche: TLayout;
    btnPause: TSpeedButton;
    zoneScoreFinDePartie: TGridPanelLayout;
    txtTitreEcran: TOlfFMXTextImageFrame;
    txtSequence: TOlfFMXTextImageFrame;
    txtLevel: TOlfFMXTextImageFrame;
    txtScoreActuel: TOlfFMXTextImageFrame;
    txtLevelFinDePartie: TOlfFMXTextImageFrame;
    txtScoreFinDePartie: TOlfFMXTextImageFrame;
    timerGameController: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure btnPauseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnMenuClick(Sender: TObject);
    procedure aniEcranAMasquerFinish(Sender: TObject);
    procedure btnCreditsClick(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure btnScoreClick(Sender: TObject);
    procedure btnGaucheClick(Sender: TObject);
    procedure btnDroiteClick(Sender: TObject);
    procedure timerBaisseNiveauBatterieTimer(Sender: TObject);
    procedure btnEnregistrerScoreClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormSaveState(Sender: TObject);
    procedure btnQuitterClick(Sender: TObject);
    procedure edtNomduJoueurKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure timerGameControllerTimer(Sender: TObject);
  private
    { Déclarations privées }
    ecranActuel, ecranAVenir: TLayout;
    Flevel: integer;
    Fsequence: integer;
    Fscore: integer;
    FsequenceMax: integer;
    FjeuEnCours: Boolean;
    FjeuEnPause: Boolean;
    FNiveauBatterie: integer;
    FSensDeLaFleche: TFlecheDirection;
    procedure afficherEcranJouer;
    procedure afficherEcranMenu;
    procedure afficherEcranScores;
    procedure afficherEcranCredits;
    procedure afficherEcranFinDePartie;
    procedure basculeVersEcran(nouvelEcran: TLayout);
    procedure Setlevel(const Value: integer);
    procedure Setscore(const Value: integer);
    procedure Setsequence(const Value: integer);
    procedure SetsequenceMax(const Value: integer);
    procedure actionUtilisateur(reussite: Boolean);
    procedure changementOrientation;
    procedure SetjeuEnCours(const Value: Boolean);
    procedure initialiseEcranJeu(retourDePause: Boolean);
    procedure SetjeuEnPause(const Value: Boolean);
    procedure BatterieChargee(Sender: TObject);
    procedure BatterieAPlat(Sender: TObject);
    procedure SetNiveauBatterie(const Value: integer);
    procedure SetSensDeLaFleche(const Value: TFlecheDirection);
    function getScoresList: tscorelist;
    function getConvertedCharImageIndex(Sender: TOlfFMXTextImageFrame;
      AChar: Char): integer;
  protected
    Joysticks: IGamolfJoystickService;
    JoystickDPADMoved: Boolean;
  public
    { Déclarations publiques }
    property score: integer read Fscore write Setscore;
    property level: integer read Flevel write Setlevel;
    property sequence: integer read Fsequence write Setsequence;
    property sequenceMax: integer read FsequenceMax write SetsequenceMax;
    property jeuEnCours: Boolean read FjeuEnCours write SetjeuEnCours;
    property jeuEnPause: Boolean read FjeuEnPause write SetjeuEnPause;
    property NiveauBatterie: integer read FNiveauBatterie
      write SetNiveauBatterie;
    property SensDeLaFleche: TFlecheDirection read FSensDeLaFleche
      write SetSensDeLaFleche;
  end;

var
  fmrMain: TfmrMain;

implementation

{$R *.fmx}

uses
  FMX.Platform,
  uKeyboardSpecialKeyTest,
  System.Math,
  Olf.RTL.Params,
  System.IOUtils,
  uDMTypoDesTitres;

procedure TfmrMain.actionUtilisateur(reussite: Boolean);
begin
  btnGauche.Enabled := false;
  btnDroite.Enabled := false;
  if reussite then
  begin
    { TODO : biper ok }
    sequence := sequence + 1;
    score := score + 1;
    if (sequence < CChargeAmplitude) then
      NiveauBatterie := NiveauBatterie + sequence
    else
      NiveauBatterie := NiveauBatterie + CChargeAmplitude;
  end
  else
  begin
    { TODO : biper wrong }
    sequence := 0;
    NiveauBatterie := NiveauBatterie - 1;
  end;
  if jeuEnCours then
    changementOrientation;
end;

procedure TfmrMain.afficherEcranCredits;
begin
  txtTitreEcran.Text := 'Crédits';
  pnlHeader.Visible := true;
  lblCreditsDuJeu.Text :=
    'Pompach a été réalisé dans le cadre de la game jam Ludum Dare 39 en juillet 2017.'
    + slinebreak + slinebreak;
  lblCreditsDuJeu.Text := lblCreditsDuJeu.Text +
    'Développé dans un projet FireMonkey sous Delphi par Patrick Prémartin.' +
    slinebreak + slinebreak;
  lblCreditsDuJeu.Text := lblCreditsDuJeu.Text +
    'Pour plus d''informations sur ce jeu, rendez-vous sur https://pompach.gamolf.fr'
    + slinebreak + slinebreak;
  lblCreditsDuJeu.Text := lblCreditsDuJeu.Text +
    'Ce programme contient des images sous licence Adobe Stock.' + slinebreak +
    slinebreak;
  lblCreditsDuJeu.Text := lblCreditsDuJeu.Text + '(c) 2017-' +
    formatdatetime('YYYY', now) + ' Patrick Prémartin' + slinebreak;
  basculeVersEcran(ecranCredits);
end;

procedure TfmrMain.afficherEcranFinDePartie;
begin
  txtTitreEcran.Text := 'Fin de partie';
  pnlHeader.Visible := true;
  jeuEnPause := false;
  jeuEnCours := false;
  txtScoreFinDePartie.Text := 'Score: ' + score.ToString;
  if (level > 1) then
    txtLevelFinDePartie.Text := 'Batteries: ' + level.ToString
  else
    txtLevelFinDePartie.Text := 'Batterie: ' + level.ToString;
  zoneSaisie.Visible := (score > 0);
  basculeVersEcran(ecranFinDePartie);
end;

procedure TfmrMain.afficherEcranJouer;
begin
  pnlHeader.Visible := false;
  if not tParams.getValue('jeuenpause', false) then
  begin
    score := 0;
    level := 1;
    initialiseEcranJeu(false);
  end
  else
  begin
    score := tParams.getValue('score', 0);
    level := tParams.getValue('level', 1);
    sequence := tParams.getValue('sequence', 0);
    sequenceMax := tParams.getValue('sequencemax', 0);
    NiveauBatterie := tParams.getValue('gauge', 0);
    initialiseEcranJeu(true);
  end;
  jeuEnPause := false;
  basculeVersEcran(ecranJeu);
end;

procedure TfmrMain.afficherEcranMenu;
begin
  txtTitreEcran.Text := 'Pompach';
  pnlHeader.Visible := true;
  jeuEnCours := false;
{$IF Defined(IOS) or Defined(ANDROID)}
  btnQuitter.Visible := false;
  btnQuitter.Enabled := false;
{$ELSE}
  btnQuitter.Visible := true;
  btnQuitter.Enabled := true;
{$ENDIF}
  basculeVersEcran(ecranMenu);
end;

procedure TfmrMain.afficherEcranScores;
var
  scoreEnCours: tscore;
  scoreListe: tscorelist;
  numlig: integer;
begin
  txtTitreEcran.Text := 'Scores';
  pnlHeader.Visible := true;
  listeScores.BeginUpdate;
  try
    listeScores.RowCount := 0;
    scoreListe := getScoresList;
    try
      for scoreEnCours in scoreListe do
      begin
        numlig := listeScores.RowCount;
        listeScores.RowCount := listeScores.RowCount + 1;
        listeScores.Cells[0, numlig] := scoreEnCours.pseudo;
        listeScores.Cells[1, numlig] := scoreEnCours.level.ToString;
        listeScores.Cells[2, numlig] := scoreEnCours.points.ToString;
      end;
    finally
      scoreListe.Free;
    end;
  finally
    listeScores.EndUpdate;
  end;
  basculeVersEcran(ecranScore);
end;

procedure TfmrMain.aniEcranAMasquerFinish(Sender: TObject);
begin
  ecranActuel.Visible := false;
  ecranActuel.Enabled := false;
  ecranActuel := ecranAVenir;
  ecranAVenir.Enabled := true;
end;

procedure TfmrMain.basculeVersEcran(nouvelEcran: TLayout);
begin
  if not assigned(ecranActuel) then
  begin
    ecranActuel := nouvelEcran;
    ecranActuel.Visible := true;
    ecranActuel.Enabled := true;
    ecranActuel.Opacity := 1;
    ecranActuel.BringToFront;
  end
  else if (ecranActuel <> nouvelEcran) then
  begin
    ecranAVenir := nouvelEcran;
    ecranAVenir.Visible := true;
    ecranAVenir.Enabled := false;
    aniEcranAAfficher.Parent := ecranAVenir;
    aniEcranAAfficher.PropertyName := 'Position.X';
    aniEcranAAfficher.Duration := 0.5;
    aniEcranAAfficher.StartValue := ecranActuel.AbsoluteWidth;
    aniEcranAAfficher.StopValue := 0;
    aniEcranAAfficher.Start;
    aniEcranAMasquer.Parent := ecranActuel;
    aniEcranAMasquer.PropertyName := 'Position.X';
    aniEcranAMasquer.Duration := 0.5;
    aniEcranAMasquer.StartValue := 0;
    aniEcranAMasquer.StopValue := -ecranActuel.AbsoluteWidth;
    aniEcranAMasquer.Start;
  end
  else if (not ecranActuel.Visible) or (not ecranActuel.Enabled) then
  begin
    ecranActuel.Opacity := 1;
    ecranActuel.Enabled := true;
    ecranActuel.Visible := true;
  end;
end;

procedure TfmrMain.BatterieAPlat(Sender: TObject);
begin
end;

procedure TfmrMain.BatterieChargee(Sender: TObject);
begin
end;

procedure TfmrMain.btnCreditsClick(Sender: TObject);
begin
  afficherEcranCredits;
end;

procedure TfmrMain.btnDroiteClick(Sender: TObject);
begin
  if btnDroite.Enabled then
    actionUtilisateur(SensDeLaFleche = TFlecheDirection.droite);
end;

procedure TfmrMain.btnEnregistrerScoreClick(Sender: TObject);
var
  pseudo: string;
begin
  pseudo := edtNomduJoueur.Text.Trim;
  if (pseudo.Length > 0) then
    with getScoresList do
      try
        Add(pseudo, score, level);
      finally
        Free;
      end;
  afficherEcranScores;
end;

procedure TfmrMain.btnGaucheClick(Sender: TObject);
begin
  if btnGauche.Enabled then
    actionUtilisateur(SensDeLaFleche = TFlecheDirection.gauche);
end;

procedure TfmrMain.btnMenuClick(Sender: TObject);
begin
  afficherEcranMenu;
end;

procedure TfmrMain.btnPauseClick(Sender: TObject);
begin
  jeuEnPause := true;
  afficherEcranMenu;
end;

procedure TfmrMain.btnPlayClick(Sender: TObject);
begin
  afficherEcranJouer;
end;

procedure TfmrMain.btnQuitterClick(Sender: TObject);
begin
  close;
end;

procedure TfmrMain.btnScoreClick(Sender: TObject);
begin
  afficherEcranScores;
end;

procedure TfmrMain.changementOrientation;
begin
  jeuEnCours := false;
  tthread.CreateAnonymousThread(
    procedure
    var
      i: integer;
      imax: integer;
    begin
      imax := Random(10);
      for i := 0 to imax do
      begin
        sleep(10);
        tthread.Synchronize(nil,
          procedure
          begin
            if (Random(10) mod 2 = 0) then
              SensDeLaFleche := TFlecheDirection.gauche
            else
              SensDeLaFleche := TFlecheDirection.droite;
          end);
      end;
      tthread.Synchronize(nil,
        procedure
        begin
          if (Random(10) mod 2 = 0) then
            SensDeLaFleche := TFlecheDirection.gauche
          else
            SensDeLaFleche := TFlecheDirection.droite;
          btnGauche.Enabled := true;
          btnDroite.Enabled := true;
          jeuEnCours := true;
        end);
    end).Start;
end;

procedure TfmrMain.edtNomduJoueurKeyDown(Sender: TObject; var Key: Word;
var KeyChar: Char; Shift: TShiftState);
begin
  if (Key = vkReturn) then
  begin
    btnEnregistrerScoreClick(Sender);
    Key := 0;
    KeyChar := #0;
  end;
end;

procedure TfmrMain.FormCreate(Sender: TObject);
begin
  timerBaisseNiveauBatterie.Enabled := false;
  timerGameController.Enabled := false;

  if not SupportsPlatformService(IGamolfJoystickService, Joysticks) then
    Joysticks := nil;
  JoystickDPADMoved := false;

  txtTitreEcran.Font := dmTypoDesTitres.TypoDesTitres;
  txtTitreEcran.OnGetImageIndexOfUnknowChar := getConvertedCharImageIndex;
  txtLevel.Font := dmTypoDesTitres.TypoDesTitres;
  txtLevel.OnGetImageIndexOfUnknowChar := getConvertedCharImageIndex;
  txtScoreActuel.Font := dmTypoDesTitres.TypoDesTitres;
  txtScoreActuel.OnGetImageIndexOfUnknowChar := getConvertedCharImageIndex;
  txtSequence.Font := dmTypoDesTitres.TypoDesTitres;
  txtSequence.OnGetImageIndexOfUnknowChar := getConvertedCharImageIndex;
  txtScoreFinDePartie.Font := dmTypoDesTitres.TypoDesTitres;
  txtScoreFinDePartie.OnGetImageIndexOfUnknowChar := getConvertedCharImageIndex;
  txtLevelFinDePartie.Font := dmTypoDesTitres.TypoDesTitres;
  txtLevelFinDePartie.OnGetImageIndexOfUnknowChar := getConvertedCharImageIndex;
  jeuEnCours := false;
  Pile.onBatteryEmpty := BatterieAPlat;
  Pile.onBatteryFull := BatterieChargee;
  Pile.MinLevel := CChargeMin;
  Pile.MaxLevel := CChargeMax;
  Pile.AnimationActive := false;
  Gauge.Max := CChargeMax;
  Gauge.Min := CChargeMin;
  FlecheVersLaGauche.Visible := false;
  FlecheVersLaDroite.Visible := false;
{$REGION Gestion des écrans}
  ecranActuel := nil;
  ecranAVenir := nil;
  ecranMenu.Visible := false;
  ecranScore.Visible := false;
  ecranCredits.Visible := false;
  ecranJeu.Visible := false;
  ecranFinDePartie.Visible := false;
  afficherEcranMenu;
{$ENDREGION}
end;

procedure TfmrMain.FormKeyDown(Sender: TObject; var Key: Word;
var KeyChar: Char; Shift: TShiftState);
begin
  if ((Key = vkHardwareBack) or (Key = vkEscape)) then
  begin
    Key := 0;
    KeyChar := #0;
    if (ecranActuel = ecranJeu) then
      btnPauseClick(Sender)
    else if (ecranActuel = ecranMenu) then
      close
    else
      btnMenuClick(Sender);
  end
  else if (Key = vkReturn) and (ecranActuel = ecranMenu) then
  begin
    Key := 0;
    KeyChar := #0;
    btnPlayClick(Sender);
  end
  else if (ecranActuel = ecranJeu) then
  begin
    if (Key = vkLeft) or (charinset(KeyChar, ['q', 'Q'])) or
      tKeyboardSpecialKeyTest.isCtrlDown(tKeyboardSpecialKeyTestPosition.Left)
      or tKeyboardSpecialKeyTest.isShiftDown
      (tKeyboardSpecialKeyTestPosition.Left) then
    begin
      Key := 0;
      KeyChar := #0;
      btnGaucheClick(Sender);
    end
    else if (Key = vkRight) or (charinset(KeyChar, ['w', 'W'])) or
      tKeyboardSpecialKeyTest.isCtrlDown(tKeyboardSpecialKeyTestPosition.Right)
      or tKeyboardSpecialKeyTest.isShiftDown
      (tKeyboardSpecialKeyTestPosition.Right) then
    begin
      Key := 0;
      KeyChar := #0;
      btnDroiteClick(Sender);
    end;
  end;
end;

procedure TfmrMain.FormResize(Sender: TObject);
begin
{$REGION taille des éléments de l'écran du score}
  listeScores.Width := Min(500, ClientWidth - listeScores.Margins.Left -
    listeScores.Margins.Right);
  listeScoresJoueurs.Width := listeScores.Width * 3 / 5 - 5;
  listeScoresBatteries.Width := listeScores.Width * 1 / 5 - 5;
  listeScoresScore.Width := listeScores.Width * 1 / 5 - 5;
{$ENDREGION}
end;

procedure TfmrMain.FormSaveState(Sender: TObject);
begin
  if (ecranActuel = ecranJeu) then
  begin
    jeuEnPause := true;
    tParams.save;
  end;
end;

function TfmrMain.getConvertedCharImageIndex(Sender: TOlfFMXTextImageFrame;
AChar: Char): integer;
begin
  // copied from Video Title Page Generator
  // https://github.com/DeveloppeurPascal/Video-Title-Page-Generator
  result := -1;
  if (result < 0) and charinset(AChar, ['a' .. 'z']) then
    result := Sender.getImageIndexOfChar('_' + AChar);
  if (result < 0) and charinset(AChar, ['a' .. 'z']) then
    result := Sender.getImageIndexOfChar(chr(ord('A') + ord(AChar) - ord('a')));
  if (result < 0) and (AChar = '?') then
    result := Sender.getImageIndexOfChar('interrogation');
  if (result < 0) and (AChar = '$') then
    result := Sender.getImageIndexOfChar('dollar');
  if (result < 0) and (AChar = '!') then
    result := Sender.getImageIndexOfChar('exclamation');
  if (result < 0) and (AChar = '&') then
    result := Sender.getImageIndexOfChar('et');
  if (result < 0) and (AChar = '%') then
    result := Sender.getImageIndexOfChar('pourcent');
  if (result < 0) and (AChar = '''') then
    result := Sender.getImageIndexOfChar('apostrophe');
  if (result < 0) and (AChar = ',') then
    result := Sender.getImageIndexOfChar('virgule');
  if (result < 0) and (AChar = '=') then
    result := Sender.getImageIndexOfChar('egale');
  if (result < 0) and (AChar = '-') then
    result := Sender.getImageIndexOfChar('moins');
  if (result < 0) and (AChar = '+') then
    result := Sender.getImageIndexOfChar('plus');
  if (result < 0) and (AChar = 'à') then
    result := Sender.getImageIndexOfChar('_agrave');
  if (result < 0) and (AChar = 'à') then
    result := getConvertedCharImageIndex(Sender, 'a');
  if (result < 0) and (AChar = 'é') then
    result := Sender.getImageIndexOfChar('_eaigu');
  if (result < 0) and (AChar = 'è') then
    result := Sender.getImageIndexOfChar('_egrave');
  if (result < 0) and (AChar = 'ê') then
    result := Sender.getImageIndexOfChar('_ecirconflexe');
  if (result < 0) and (AChar = 'ë') then
    result := Sender.getImageIndexOfChar('_etrema');
  if (result < 0) and charinset(AChar, ['é', 'è', 'ê', 'ë']) then
    result := getConvertedCharImageIndex(Sender, 'e');
  if (result < 0) and (AChar = 'ô') then
    result := Sender.getImageIndexOfChar('_ocirconflexe');
  if (result < 0) and (AChar = 'ö') then
    result := Sender.getImageIndexOfChar('_otrema');
  if (result < 0) and charinset(AChar, ['ô', 'ö']) then
    result := getConvertedCharImageIndex(Sender, 'o');
  if (result < 0) and (AChar = 'î') then
    result := Sender.getImageIndexOfChar('_icirconflexe');
  if (result < 0) and (AChar = 'ï') then
    result := Sender.getImageIndexOfChar('_itrema');
  if (result < 0) and charinset(AChar, ['î', 'ï']) then
    result := getConvertedCharImageIndex(Sender, 'i');
  if (result < 0) and (AChar = 'û') then
    result := Sender.getImageIndexOfChar('_ucirconflexe');
  if (result < 0) and (AChar = 'ü') then
    result := Sender.getImageIndexOfChar('_utrema');
  if (result < 0) and (AChar = 'ù') then
    result := Sender.getImageIndexOfChar('_ugrave');
  // if (result < 0) and (AChar = '') then // TODO : ajouter u aigu
  // result := Sender.getImageIndexOfChar('_uaigu');
  if (result < 0) and charinset(AChar, ['û', 'ü', 'ù']) then
    // TODO : ajouter u aigu
    result := getConvertedCharImageIndex(Sender, 'u');
  if (result < 0) and (AChar = 'oe') then
    result := Sender.getImageIndexOfChar('_oe');
  // TODO : récupérer "oe" en minuscules
  if (result < 0) and (AChar = 'OE') then
    result := Sender.getImageIndexOfChar('OE');
  // TODO : récupérer "oe" en majuscules
  // if (result < 0) and (AChar = '...') then
  // TODO : récupérer points de suspensions en 1 caractère
  // result := Sender.getImageIndexOfChar('suspension'); // TODO
  if (result < 0) and (AChar = '.') then
    result := Sender.getImageIndexOfChar('point');
  if (result < 0) and (AChar = ':') then
    result := Sender.getImageIndexOfChar('deuxpoint');
  if (result < 0) and (AChar = ':') then
    result := Sender.getImageIndexOfChar('deux-point');
  if (result < 0) and (AChar = ';') then
    result := Sender.getImageIndexOfChar('pointvirgule');
  if (result < 0) and (AChar = ';') then
    result := Sender.getImageIndexOfChar('point-virgule');
  if (result < 0) and (AChar = '/') then
    result := Sender.getImageIndexOfChar('slash');
  if (result < 0) and charinset(AChar, ['.', ',', ';', ':', '!', '''']) then
    result := getConvertedCharImageIndex(Sender, ' ');
end;

function TfmrMain.getScoresList: tscorelist;
begin
  result := tscorelist.Create('Gamolf', 'Pompach');
  result.Load;
end;

procedure TfmrMain.initialiseEcranJeu(retourDePause: Boolean);
begin
  if not retourDePause then
  begin
    sequenceMax := 0;
    sequence := 0;
    NiveauBatterie := CChargeInitiale;
  end;
  Pile.AnimationActive := true;
  jeuEnCours := false;
  changementOrientation;
end;

procedure TfmrMain.SetjeuEnCours(const Value: Boolean);
begin
  FjeuEnCours := Value;
  timerBaisseNiveauBatterie.Enabled := FjeuEnCours;

  if assigned(Joysticks) then
    timerGameController.Enabled := FjeuEnCours
  else
    timerGameController.Enabled := false;
end;

procedure TfmrMain.SetjeuEnPause(const Value: Boolean);
begin
  FjeuEnPause := Value;
  tParams.setValue('jeuenpause', Value);
  if Value then
  begin
    tParams.setValue('score', score);
    tParams.setValue('level', level);
    tParams.setValue('sequence', sequence);
    tParams.setValue('sequencemax', sequenceMax);
    tParams.setValue('gauge', NiveauBatterie);
  end;
end;

procedure TfmrMain.Setlevel(const Value: integer);
begin
  Flevel := Value;
  if Flevel > 1 then
    txtLevel.Text := 'Batteries: ' + Flevel.ToString
  else
    txtLevel.Text := 'Batterie: ' + Flevel.ToString;
end;

procedure TfmrMain.SetNiveauBatterie(const Value: integer);
begin
  if Value < CChargeMin then
    FNiveauBatterie := CChargeMin
  else if Value > CChargeMax then
    FNiveauBatterie := CChargeMax
  else
    FNiveauBatterie := Value;

  Pile.ChargeLevel := FNiveauBatterie;
  Gauge.Value := FNiveauBatterie;

  if (FNiveauBatterie = 0) then
  begin
    Pile.AnimationActive := false;
    afficherEcranFinDePartie
  end
  else if (FNiveauBatterie = CChargeMax) then
  begin
    Pile.AnimationActive := false;
    score := sequenceMax * level + score;
    level := level + 1;
    NiveauBatterie := CChargeInitiale;
    Pile.AnimationActive := true;
  end;
end;

procedure TfmrMain.Setscore(const Value: integer);
begin
  Fscore := Value;
  txtScoreActuel.Text := 'Score: ' + Fscore.ToString;
end;

procedure TfmrMain.SetSensDeLaFleche(const Value: TFlecheDirection);
begin
  FSensDeLaFleche := Value;
  case FSensDeLaFleche of
    TFlecheDirection.gauche:
      begin
        FlecheVersLaDroite.Visible := false;
        FlecheVersLaGauche.Visible := true;
      end;
    TFlecheDirection.droite:
      begin
        FlecheVersLaGauche.Visible := false;
        FlecheVersLaDroite.Visible := true;
      end;
  end;
end;

procedure TfmrMain.Setsequence(const Value: integer);
begin
  Fsequence := Value;
  if (Value > 0) then
    sequenceMax := Value;
  txtSequence.Text := Fsequence.ToString + ' / ' + sequenceMax.ToString;
end;

procedure TfmrMain.SetsequenceMax(const Value: integer);
begin
  if (Value = 0) then
    FsequenceMax := 0
  else if (Value > FsequenceMax) then
    FsequenceMax := Value;
end;

procedure TfmrMain.timerBaisseNiveauBatterieTimer(Sender: TObject);
begin
  NiveauBatterie := NiveauBatterie - 1;
end;

procedure TfmrMain.timerGameControllerTimer(Sender: TObject);
var
  JoyInfo: TJoystickInfo;
begin
  if not assigned(Joysticks) then
    exit;
  if not timerGameController.Enabled then
    exit;

  Joysticks.ForEach(JoyInfo,
    procedure(JoystickID: TJoystickID; var JoystickInfo: TJoystickInfo;
      hadError: Boolean)
    begin
      if hadError then
        exit;

      if Joysticks.hasDPad(JoystickID) then
      begin
        JoystickDPADMoved := JoystickDPADMoved and
          (not Joysticks.isDPad(JoystickID, TJoystickDPad.Center));
        if not JoystickDPADMoved then
          if Joysticks.isDPad(JoystickID, [TJoystickDPad.TopLeft,
            TJoystickDPad.Left, TJoystickDPad.BottomLeft]) then
          begin
            JoystickDPADMoved := true;
            btnGaucheClick(Sender);
          end
          else if Joysticks.isDPad(JoystickID, [TJoystickDPad.TopRight,
            TJoystickDPad.Right, TJoystickDPad.BottomRight]) then
          begin
            JoystickDPADMoved := true;
            btnDroiteClick(Sender);
          end;
      end
      else;
    end);
end;

procedure initParamsUnit;
var
  NewPath, OldPath, FileName, NewFilePath: string;
begin
{$IF Defined(DEBUG)}
  NewPath := tpath.combine(tpath.GetDocumentsPath, tpath.combine('GAMOLF-debug',
    'Pompach'));
{$ELSE if Defined(RELEASE)}
  NewPath := tpath.combine(tpath.GetHomePath, tpath.combine('GAMOLF',
    'Pompach'));
{$ELSE}
{$MESSAGE FATAL 'setup problem'}
{$ENDIF}
  FileName := tpath.getfilename(tParams.getFilePath);
  NewFilePath := tpath.combine(NewPath, FileName);
  if (tfile.Exists(NewFilePath)) then
    tParams.setfoldername(NewPath)
  else
  begin
    OldPath := tpath.getDirectoryName(tParams.getFilePath);
    if tfile.Exists(tpath.combine(OldPath, FileName)) then
      tParams.MoveToFilePath(NewFilePath, false, true)
    else
      tParams.setfoldername(NewPath);
  end;
end;

initialization

initParamsUnit;

end.
