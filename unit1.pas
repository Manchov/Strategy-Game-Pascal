unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    Bevel1: TBevel;
    Boo0: TImage;
    Boo1: TImage;
    Boo2: TImage;
    Boo3: TImage;
    Image1: TImage;
    normal: TButton;
    nenormal: TButton;
    Detector: TTimer;
    boo0timer: TTimer;
    boo1timer: TTimer;
    boo2timer: TTimer;
    boo3timer: TTimer;
    Animacii: TTimer;
    Animacii1: TTimer;
    Label11: TLabel;
    Label12: TLabel;
    UpgradeStreli: TButton;
    Wall: TImage;
    pateka3: TImage;
    pateka2: TImage;
    pateka1: TImage;
    pateka0: TImage;
    terren1: TImage;
    terren3: TImage;
    terren2: TImage;
    terren0: TImage;
    UpgradeSpeed: TButton;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Naslov: TLabel;
    Labelzastreli: TLabel;
    Pocetno: TButton;
    Strela1: TImage;
    starter: TTimer;
    Strelatimer2: TTimer;
    Strela2: TImage;
    Strela3: TImage;
    Strela4: TImage;
    Strela5: TImage;
    Strela6: TImage;
    Strela7: TImage;
    Strela8: TImage;
    Strelatimer1: TTimer;
    Strelatimer3: TTimer;
    Strelatimer4: TTimer;
    Strelatimer5: TTimer;
    Strelatimer6: TTimer;
    Strelatimer7: TTimer;
    Strelatimer8: TTimer;
    UpgradeDMG: TButton;
    UpgradeForce: TButton;
    Zamok: TImage;
    procedure Animacii1Timer(Sender: TObject);
    procedure AnimaciiTimer(Sender: TObject);
    procedure boo0timerTimer(Sender: TObject);
    procedure boo1timerTimer(Sender: TObject);
    procedure boo2timerTimer(Sender: TObject);
    procedure boo3timerTimer(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure nenormalClick(Sender: TObject);
    procedure normalClick(Sender: TObject);
    procedure DetectorTimer(Sender: TObject);
    procedure PocetnoClick(Sender: TObject);
    procedure PocetnoKeyPress(Sender: TObject; var Key: char);
    procedure starterTimer(Sender: TObject);
    procedure Strelatimer1Timer(Sender: TObject);
    procedure Strelatimer2Timer(Sender: TObject);
    procedure Strelatimer3Timer(Sender: TObject);
    procedure Strelatimer4Timer(Sender: TObject);
    procedure Strelatimer5Timer(Sender: TObject);
    procedure Strelatimer6Timer(Sender: TObject);
    procedure Strelatimer7Timer(Sender: TObject);
    procedure Strelatimer8Timer(Sender: TObject);
    procedure UpgradeDMGClick(Sender: TObject);
    procedure UpgradeForceClick(Sender: TObject);
    procedure UpgradeSpeedClick(Sender: TObject);
    procedure UpgradeStreliClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  i: integer;
  End0,End1,End2,End3 :integer;
  Point0,Point1,Point2,Point3 :integer;
  StrelaPravec1,StrelaPravec2,StrelaPravec3,StrelaPravec4,StrelaPravec5,
  StrelaPravec6,StrelaPravec7,StrelaPravec8 :integer;
  SpeedO: integer;
  DmgO: integer;
  ForceO: integer;
  MaxStreli:integer;
  gold: integer;
  score: integer;
  BooSpeed: integer;
  pos: integer;
  boo0sila,boo1sila,boo2sila,boo3sila:integer;


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.starterTimer(Sender: TObject);
begin
  //ostatok
  zamok.visible:=false;
  zamok.visible:=true;
  End0:=0;
  End1:=500;
  End2:=500;
  End3:=0;
  Point0:=zamok.top;
  Point1:=zamok.left+zamok.width;
  Point2:=zamok.top+zamok.height;
  Point3:=zamok.left;
  speedO:=15;
  dmgO:=1;
  forceO:=1;
  maxstreli:=1;
  gold:= 200;
  boospeed:=1000;
  label5.Caption:=inttostr(speedO)+'ms';
  label6.Caption:=inttostr(dmgO);
  label7.Caption:=inttostr(forceO);
  label8.Caption:=inttostr(Maxstreli);
  label10.caption:=inttostr(gold);
  boo0timer.enabled:=true;
  boo1timer.Enabled:=true;
  boo2timer.Enabled:=true;
  boo3timer.Enabled:=true;
  boo0.visible:=true;
  boo0.top:=0;
  boo0.left:=230;
  boo1.visible:=true;
  boo1.top:=230;
  boo1.left:=460;
  boo2.visible:=true;
  boo2.Top:=460;
  boo2.left:=230;
  boo3.visible:=true;
  boo3.Top:=230;
  boo3.left:=0;
  score:=0;
  label12.caption:=inttostr(score);
  strela2.visible:=false;
  strela3.visible:=false;
  strela4.visible:=false;
  strela5.visible:=false;
  strela6.visible:=false;
  strela7.visible:=false;
  strela8.visible:=false;
  starter.Enabled:=false;
end;

procedure TForm1.Strelatimer1Timer(Sender: TObject);
begin
  if strelapravec1=0 then
    begin
         strela1.top:=strela1.Top-1;
         strela1.Transparent:=true;
         if strela1.top>point0 then
            point0:=strela1.top;
         //za vrakjanje
         if strela1.Top<=End0 then
           begin
                strela1.top:=424;
                strela1.left:=512;
                strela1.Width:=6;
                strela1.Height:=15;
                strela1.Picture.LoadFromFile('Sliki/arrow0.png');
                if end0>0 then
                  begin
                       boo0.top:=boo0.top-forceO;
                       boo0sila:=boo0sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer1.enabled:=false;
           end;
    end;
  if strelapravec1=1 then
    begin
         strela1.left:=strela1.left+1;
         strela1.Transparent:=true;
         if (strela1.left+strela1.width)>point1 then
            point1:=(strela1.left+strela1.width);
         //za vrakjanje
         if (strela1.left+strela1.Width)>=End1 then
           begin
                strela1.top:=424;
                strela1.left:=512;
                strela1.Width:=6;
                strela1.Height:=15;
                strela1.Picture.LoadFromFile('Sliki/arrow0.png');
                if end1<500 then
                  begin
                       boo1.left:=boo1.left+forceO;
                       boo1sila:=boo1sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer1.enabled:=false;
           end;
    end;
   if strelapravec1=2 then
    begin
         strela1.top:=strela1.top+1;
         strela1.Transparent:=true;
         if (strela1.top+strela1.height)>point2 then
            point2:=(strela1.top+strela1.height);
         //za vrakjanje
         if strela1.Top>=End2 then
           begin
                strela1.top:=424;
                strela1.left:=512;
                strela1.Picture.LoadFromFile('Sliki/arrow0.png');
                strela1.Width:=6;
                strela1.Height:=15;
                if end2<500 then
                  begin
                       boo2.top:=boo2.top+forceO;
                       boo2sila:=boo2sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer1.enabled:=false;
           end;
    end;
   if strelapravec1=3 then
    begin
         strela1.left:=strela1.left-1;
         strela1.Transparent:=true;
         if strela1.left<point3 then
            point3:=strela1.left;
         //za vrakjanje
         if strela1.left<=End3 then
           begin
                strela1.top:=424;
                strela1.left:=512;
                strela1.Picture.LoadFromFile('Sliki/arrow0.png');
                strela1.Width:=6;
                strela1.Height:=15;
                if end3>0 then
                  begin
                       boo3.left:=boo3.left-forceO;
                       boo3sila:=boo3sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer1.enabled:=false;
           end;
    end;
end;

procedure TForm1.Strelatimer2Timer(Sender: TObject);
begin
  if strelapravec2=0 then
    begin
         strela2.top:=strela2.Top-1;
         strela2.Transparent:=true;
         if strela2.top>point0 then
            point0:=strela2.top;
         //za vrakjanje
         if strela2.Top<=End0 then
           begin
                strela2.top:=424;
                strela2.left:=528;
                strela2.Width:=6;
                strela2.Height:=15;
                strela2.Picture.LoadFromFile('Sliki/arrow0.png');
                if end0>0 then
                  begin
                       boo0.top:=boo0.top-forceO;
                       boo0sila:=boo0sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer2.enabled:=false;
           end;
    end;
  if strelapravec2=1 then
    begin
         strela2.left:=strela2.left+1;
         strela2.Transparent:=true;
         if (strela2.left+strela2.width)>point2 then
            point1:=(strela2.left+strela2.width);
         //za vrakjanje
         if (strela2.left+strela2.Width)>=End1 then
           begin
                strela2.top:=424;
                strela2.left:=528;
                strela2.Width:=6;
                strela2.Height:=15;
                strela2.Picture.LoadFromFile('Sliki/arrow0.png');
                if end1<500 then
                  begin
                       boo1.left:=boo1.left+forceO;
                       boo1sila:=boo1sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer2.enabled:=false;
           end;
    end;
   if strelapravec2=2 then
    begin
         strela2.top:=strela2.top+1;
         strela2.Transparent:=true;
         if (strela2.top+strela2.height)>point2 then
            point2:=(strela2.top+strela2.height);
         //za vrakjanje
         if strela2.Top>=End2 then
           begin
                strela2.top:=424;
                strela2.left:=528;
                strela2.Picture.LoadFromFile('Sliki/arrow0.png');
                strela2.Width:=6;
                strela2.Height:=15;
                if end2<500 then
                  begin
                       boo2.top:=boo2.top+forceO;
                       boo2sila:=boo2sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer2.enabled:=false;
           end;
    end;
   if strelapravec2=3 then
    begin
         strela2.left:=strela2.left-1;
         strela2.Transparent:=true;
         if strela2.left<point3 then
            point3:=strela2.left;
         //za vrakjanje
         if strela2.left<=End3 then
           begin
                strela2.top:=424;
                strela2.left:=528;
                strela2.Picture.LoadFromFile('Sliki/arrow0.png');
                strela2.Width:=6;
                strela2.Height:=15;
                if end3>0 then
                  begin
                       boo3.left:=boo3.left-forceO;
                       boo3sila:=boo3sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer2.enabled:=false;
           end;
    end;
end;

procedure TForm1.Strelatimer3Timer(Sender: TObject);
begin
  if strelapravec3=0 then
    begin
         strela3.top:=strela3.Top-1;
         strela3.Transparent:=true;
         if strela3.top>point0 then
            point0:=strela2.top;
         //za vrakjanje
         if strela3.Top<=End0 then
           begin
                strela3.top:=424;
                strela3.left:=544;
                strela3.Width:=6;
                strela3.Height:=15;
                strela3.Picture.LoadFromFile('Sliki/arrow0.png');
                if end0>0 then
                  begin
                       boo0.top:=boo0.top-forceO;
                       boo0sila:=boo0sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer3.enabled:=false;
           end;
    end;
  if strelapravec3=1 then
    begin
         strela3.left:=strela3.left+1;
         strela3.Transparent:=true;
         if (strela3.left+strela3.width)>point2 then
            point1:=(strela3.left+strela3.width);
         //za vrakjanje
         if (strela3.left+strela3.Width)>=End1 then
           begin
                strela3.top:=424;
                strela3.left:=544;
                strela3.Width:=6;
                strela3.Height:=15;
                strela3.Picture.LoadFromFile('Sliki/arrow0.png');
                if end1<500 then
                  begin
                       boo1.left:=boo1.left+forceO;
                       boo1sila:=boo1sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer3.enabled:=false;
           end;
    end;
   if strelapravec3=2 then
    begin
         strela3.top:=strela3.top+1;
         strela3.Transparent:=true;
         if (strela3.top+strela3.height)>point2 then
            point2:=(strela3.top+strela3.height);
         //za vrakjanje
         if strela3.Top>=End2 then
           begin
                strela3.top:=424;
                strela3.left:=544;
                strela3.Picture.LoadFromFile('Sliki/arrow0.png');
                strela3.Width:=6;
                strela3.Height:=15;
                if end2<500 then
                  begin
                       boo2.top:=boo2.top+forceO;
                       boo2sila:=boo2sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer3.enabled:=false;
           end;
    end;
   if strelapravec3=3 then
    begin
         strela3.left:=strela3.left-1;
         strela3.Transparent:=true;
         if strela3.left<point3 then
            point3:=strela3.left;
         //za vrakjanje
         if strela3.left<=End3 then
           begin
                strela3.top:=424;
                strela3.left:=544;
                strela3.Picture.LoadFromFile('Sliki/arrow0.png');
                strela3.Width:=6;
                strela3.Height:=15;
                if end3>0 then
                  begin
                       boo3.left:=boo3.left-forceO;
                       boo3sila:=boo3sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer3.enabled:=false;
           end;
    end;
end;

procedure TForm1.Strelatimer4Timer(Sender: TObject);
begin
  if strelapravec4=0 then
    begin
         strela4.top:=strela4.Top-1;
         strela4.Transparent:=true;
         if strela4.top>point0 then
            point0:=strela2.top;
         //za vrakjanje
         if strela4.Top<=End0 then
           begin
                strela4.top:=424;
                strela4.left:=560;
                strela4.Width:=6;
                strela4.Height:=15;
                strela4.Picture.LoadFromFile('Sliki/arrow0.png');
                if end0>0 then
                  begin
                       boo0.top:=boo0.top-forceO;
                       boo0sila:=boo0sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer4.enabled:=false;
           end;
    end;
  if strelapravec4=1 then
    begin
         strela4.left:=strela4.left+1;
         strela4.Transparent:=true;
         if (strela4.left+strela4.width)>point2 then
            point1:=(strela4.left+strela4.width);
         //za vrakjanje
         if (strela4.left+strela4.Width)>=End1 then
           begin
                strela4.top:=424;
                strela4.left:=560;
                strela4.Width:=6;
                strela4.Height:=15;
                strela4.Picture.LoadFromFile('Sliki/arrow0.png');
                if end1<500 then
                  begin
                       boo1.left:=boo1.left+forceO;
                       boo1sila:=boo1sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer4.enabled:=false;
           end;
    end;
   if strelapravec4=2 then
    begin
         strela4.top:=strela4.top+1;
         strela4.Transparent:=true;
         if (strela4.top+strela4.height)>point2 then
            point2:=(strela4.top+strela4.height);
         //za vrakjanje
         if strela4.Top>=End2 then
           begin
                strela4.top:=424;
                strela4.left:=560;
                strela4.Picture.LoadFromFile('Sliki/arrow0.png');
                strela4.Width:=6;
                strela4.Height:=15;
                if end2<500 then
                  begin
                       boo2.top:=boo2.top+forceO;
                       boo2sila:=boo2sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer4.enabled:=false;
           end;
    end;
   if strelapravec4=3 then
    begin
         strela4.left:=strela4.left-1;
         strela4.Transparent:=true;
         if strela4.left<point3 then
            point3:=strela4.left;
         //za vrakjanje
         if strela4.left<=End3 then
           begin
                strela4.top:=424;
                strela4.left:=560;
                strela4.Picture.LoadFromFile('Sliki/arrow0.png');
                strela4.Width:=6;
                strela4.Height:=15;
                if end3>0 then
                  begin
                       boo3.left:=boo3.left-forceO;
                       boo3sila:=boo3sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer4.enabled:=false;
           end;
    end;
end;

procedure TForm1.Strelatimer5Timer(Sender: TObject);
begin
  if strelapravec5=0 then
    begin
         strela5.top:=strela5.Top-1;
         strela5.Transparent:=true;
         if strela5.top>point0 then
            point0:=strela2.top;
         //za vrakjanje
         if strela5.Top<=End0 then
           begin
                strela5.top:=424;
                strela5.left:=576;
                strela5.Width:=6;
                strela5.Height:=15;
                strela5.Picture.LoadFromFile('Sliki/arrow0.png');
                if end0>0 then
                  begin
                       boo0.top:=boo0.top-forceO;
                       boo0sila:=boo0sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer5.enabled:=false;
           end;
    end;
  if strelapravec5=1 then
    begin
         strela5.left:=strela5.left+1;
         strela5.Transparent:=true;
         if (strela5.left+strela5.width)>point2 then
            point1:=(strela5.left+strela5.width);
         //za vrakjanje
         if (strela5.left+strela5.Width)>=End1 then
           begin
                strela5.top:=424;
                strela5.left:=576;
                strela5.Width:=6;
                strela5.Height:=15;
                strela5.Picture.LoadFromFile('Sliki/arrow0.png');
                if end1<500 then
                  begin
                       boo1.left:=boo1.left+forceO;
                       boo1sila:=boo1sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer5.enabled:=false;
           end;
    end;
   if strelapravec5=2 then
    begin
         strela5.top:=strela5.top+1;
         strela5.Transparent:=true;
         if (strela5.top+strela5.height)>point2 then
            point2:=(strela5.top+strela5.height);
         //za vrakjanje
         if strela5.Top>=End2 then
           begin
                strela5.top:=424;
                strela5.left:=576;
                strela5.Picture.LoadFromFile('Sliki/arrow0.png');
                strela5.Width:=6;
                strela5.Height:=15;
                if end2<500 then
                  begin
                       boo2.top:=boo2.top+forceO;
                       boo2sila:=boo2sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer5.enabled:=false;
           end;
    end;
   if strelapravec5=3 then
    begin
         strela5.left:=strela5.left-1;
         strela5.Transparent:=true;
         if strela5.left<point3 then
            point3:=strela5.left;
         //za vrakjanje
         if strela5.left<=End3 then
           begin
                strela5.top:=424;
                strela5.left:=576;
                strela5.Picture.LoadFromFile('Sliki/arrow0.png');
                strela5.Width:=6;
                strela5.Height:=15;
                if end3>0 then
                  begin
                       boo3.left:=boo3.left-forceO;
                       boo3sila:=boo3sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer5.enabled:=false;
           end;
    end;
end;

procedure TForm1.Strelatimer6Timer(Sender: TObject);
begin
  if strelapravec6=0 then
    begin
         strela6.top:=strela6.Top-1;
         strela6.Transparent:=true;
         if strela6.top>point0 then
            point0:=strela2.top;
         //za vrakjanje
         if strela6.Top<=End0 then
           begin
                strela6.top:=424;
                strela6.left:=592;
                strela6.Width:=6;
                strela6.Height:=15;
                strela6.Picture.LoadFromFile('Sliki/arrow0.png');
                if end0>0 then
                  begin
                       boo0.top:=boo0.top-forceO;
                       boo0sila:=boo0sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer6.enabled:=false;
           end;
    end;
  if strelapravec6=1 then
    begin
         strela6.left:=strela6.left+1;
         strela6.Transparent:=true;
         if (strela6.left+strela6.width)>point2 then
            point1:=(strela6.left+strela6.width);
         //za vrakjanje
         if (strela6.left+strela6.Width)>=End1 then
           begin
                strela6.top:=424;
                strela6.left:=592;
                strela6.Width:=6;
                strela6.Height:=15;
                strela6.Picture.LoadFromFile('Sliki/arrow0.png');
                if end1<500 then
                  begin
                       boo1.left:=boo1.left+forceO;
                       boo1sila:=boo1sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer6.enabled:=false;
           end;
    end;
   if strelapravec6=2 then
    begin
         strela6.top:=strela6.top+1;
         strela6.Transparent:=true;
         if (strela6.top+strela6.height)>point2 then
            point2:=(strela6.top+strela6.height);
         //za vrakjanje
         if strela6.Top>=End2 then
           begin
                strela6.top:=424;
                strela6.left:=592;
                strela6.Picture.LoadFromFile('Sliki/arrow0.png');
                strela6.Width:=6;
                strela6.Height:=15;
                if end2<500 then
                  begin
                       boo2.top:=boo2.top+forceO;
                       boo2sila:=boo2sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer6.enabled:=false;
           end;
    end;
   if strelapravec6=3 then
    begin
         strela6.left:=strela6.left-1;
         strela6.Transparent:=true;
         if strela6.left<point3 then
            point3:=strela6.left;
         //za vrakjanje
         if strela6.left<=End3 then
           begin
                strela6.top:=424;
                strela6.left:=592;
                strela6.Picture.LoadFromFile('Sliki/arrow0.png');
                strela6.Width:=6;
                strela6.Height:=15;
                if end3>0 then
                  begin
                       boo3.left:=boo3.left-forceO;
                       boo3sila:=boo3sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer6.enabled:=false;
           end;
    end;
end;

procedure TForm1.Strelatimer7Timer(Sender: TObject);
begin
  if strelapravec7=0 then
    begin
         strela7.top:=strela7.Top-1;
         strela7.Transparent:=true;
         if strela7.top>point0 then
            point0:=strela7.top;
         //za vrakjanje
         if strela7.Top<=End0 then
           begin
                strela7.top:=424;
                strela7.left:=608;
                strela7.Width:=6;
                strela7.Height:=15;
                strela7.Picture.LoadFromFile('Sliki/arrow0.png');
                if end0>0 then
                  begin
                       boo0.top:=boo0.top-forceO;
                       boo0sila:=boo0sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer7.enabled:=false;
           end;
    end;
  if strelapravec7=1 then
    begin
         strela7.left:=strela7.left+1;
         strela7.Transparent:=true;
         if (strela7.left+strela7.width)>point2 then
            point1:=(strela7.left+strela7.width);
         //za vrakjanje
         if (strela7.left+strela7.Width)>=End1 then
           begin
                strela7.top:=424;
                strela7.left:=608;
                strela7.Width:=6;
                strela7.Height:=15;
                strela7.Picture.LoadFromFile('Sliki/arrow0.png');
                if end1<500 then
                  begin
                       boo1.left:=boo1.left+forceO;
                       boo1sila:=boo1sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer7.enabled:=false;
           end;
    end;
   if strelapravec7=2 then
    begin
         strela7.top:=strela7.top+1;
         strela7.Transparent:=true;
         if (strela7.top+strela7.height)>point2 then
            point2:=(strela7.top+strela7.height);
         //za vrakjanje
         if strela7.Top>=End2 then
           begin
                strela7.top:=424;
                strela7.left:=608;
                strela7.Picture.LoadFromFile('Sliki/arrow0.png');
                strela7.Width:=6;
                strela7.Height:=15;
                if end2<500 then
                  begin
                       boo2.top:=boo2.top+forceO;
                       boo2sila:=boo2sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer7.enabled:=false;
           end;
    end;
   if strelapravec7=3 then
    begin
         strela7.left:=strela7.left-1;
         strela7.Transparent:=true;
         if strela7.left<point3 then
            point3:=strela7.left;
         //za vrakjanje
         if strela7.left<=End3 then
           begin
                strela7.top:=424;
                strela7.left:=608;
                strela7.Picture.LoadFromFile('Sliki/arrow0.png');
                strela7.Width:=6;
                strela7.Height:=15;
                if end3>0 then
                  begin
                       boo3.left:=boo3.left-forceO;
                       boo3sila:=boo3sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer7.enabled:=false;
           end;
    end;
end;

procedure TForm1.Strelatimer8Timer(Sender: TObject);
begin
  if strelapravec8=0 then
    begin
         strela8.top:=strela8.Top-1;
         strela8.Transparent:=true;
         if strela8.top>point0 then
            point0:=strela8.top;
         //za vrakjanje
         if strela8.Top<=End0 then
           begin
                strela8.top:=424;
                strela8.left:=624;
                strela8.Width:=6;
                strela8.Height:=15;
                strela8.Picture.LoadFromFile('Sliki/arrow0.png');
                if end0>0 then
                  begin
                       boo0.top:=boo0.top-forceO;
                       boo0sila:=boo0sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer8.enabled:=false;
           end;
    end;
  if strelapravec8=1 then
    begin
         strela8.left:=strela8.left+1;
         strela8.Transparent:=true;
         if (strela8.left+strela8.width)>point2 then
            point1:=(strela8.left+strela8.width);
         //za vrakjanje
         if (strela8.left+strela8.Width)>=End1 then
           begin
                strela8.top:=424;
                strela8.left:=624;
                strela8.Width:=6;
                strela8.Height:=15;
                strela8.Picture.LoadFromFile('Sliki/arrow0.png');
                if end1<500 then
                  begin
                       boo1.left:=boo1.left+forceO;
                       boo1sila:=boo1sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer8.enabled:=false;
           end;
    end;
   if strelapravec8=2 then
    begin
         strela8.top:=strela8.top+1;
         strela8.Transparent:=true;
         if (strela8.top+strela8.height)>point2 then
            point2:=(strela8.top+strela8.height);
         //za vrakjanje
         if strela8.Top>=End2 then
           begin
                strela8.top:=424;
                strela8.left:=624;
                strela8.Picture.LoadFromFile('Sliki/arrow0.png');
                strela8.Width:=6;
                strela8.Height:=15;
                if end2<500 then
                  begin
                       boo2.top:=boo2.top+forceO;
                       boo2sila:=boo2sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer8.enabled:=false;
           end;
    end;
   if strelapravec8=3 then
    begin
         strela8.left:=strela8.left-1;
         strela8.Transparent:=true;
         if strela8.left<point3 then
            point3:=strela8.left;
         //za vrakjanje
         if strela8.left<=End3 then
           begin
                strela8.top:=424;
                strela8.left:=624;
                strela8.Picture.LoadFromFile('Sliki/arrow0.png');
                strela8.Width:=6;
                strela8.Height:=15;
                if end3>0 then
                  begin
                       boo3.left:=boo3.left-forceO;
                       boo3sila:=boo3sila-dmgO;
                       gold:=gold+((forceO+dmgO)div 4)+1;
                       label10.caption:=inttostr(gold);
                       score:=score+dmgO+forceO;
                       label12.caption:=inttostr(score);
                  end;
                strelatimer8.enabled:=false;
           end;
    end;
end;

procedure TForm1.UpgradeDMGClick(Sender: TObject);
begin
  if pocetno.visible=true then
  pocetno.setfocus;
  if gold>=10 then
     if dmgO<1000 then
           begin
                dmgO:=dmgO+1;
                gold:=gold-10;
                label6.caption:=inttostr(dmgO);
                label10.Caption:=inttostr(gold);
           end;
end;

procedure TForm1.UpgradeForceClick(Sender: TObject);
begin
  if pocetno.visible=true then
   pocetno.setfocus;
   if gold>=250 then
      if forceO<10 then
           begin
                forceO:=forceO+1;
                gold:=gold-250;
                label7.caption:=inttostr(forceO);
                label10.Caption:=inttostr(gold);
           end;
  end;

procedure TForm1.UpgradeSpeedClick(Sender: TObject);
begin
  if pocetno.visible=true then
  pocetno.SetFocus;
  if gold>=5 then
   if speedO>=2 then
    begin
         speedO:=speedO-1;
         gold:=gold-5;
         label5.caption:=(inttostr(speedO))+'ms';
         label10.caption:=inttostr(gold);
    end;
   end;

procedure TForm1.UpgradeStreliClick(Sender: TObject);
begin
  if pocetno.visible=true then
  pocetno.SetFocus;
  if gold>=100 then
   if maxstreli<8 then
    begin
         maxstreli:=maxstreli+1;
         gold:=gold-100;
         label8.caption:=inttostr(maxstreli);
         label10.caption:=inttostr(gold);
    end;
end;

procedure TForm1.PocetnoClick(Sender: TObject);
begin

end;

procedure TForm1.DetectorTimer(Sender: TObject);
begin
  end0:=boo0.Top+boo0.Height;
  end1:=boo1.left;
  end2:=boo2.top;
  end3:=boo3.left+boo3.Width;
  if (end0>zamok.top) or (end1<zamok.left+zamok.width) or
  (end2<zamok.top+zamok.height) or (end3>zamok.left) then
   begin
   detector.Enabled:=false;
   boo0timer.Enabled:=false;
   boo1timer.Enabled:=false;
   boo2timer.Enabled:=false;
   boo3timer.Enabled:=false;
   normal.Visible:=true;
   normal.enabled:=true;
   nenormal.visible:=true;
   nenormal.Enabled:=true;
   pocetno.Enabled:=false;
   pocetno.Visible:=false;
   showmessage('Game Over, Вашиот резултат е: '+inttostr(score));
   end;
  if (boo0sila<0) and (boo0.visible=true) then
   begin
   boo0.visible:=false;
   boo0timer.enabled:=false;
   boo0.top:=-40;
   end;
  if (boo1sila<0) and (boo1.visible=true) then
   begin
   boo1.visible:=false;
   boo1timer.enabled:=false;
   boo1.left:=540;
   end;
  if (boo2sila<0) and (boo2.visible=true) then
   begin
   boo2.visible:=false;
   boo2timer.enabled:=false;
   boo2.top:=540;
   end;
  if (boo3sila<0) and (boo3.visible=true) then
   begin
   boo3.visible:=false;
   boo3timer.enabled:=false;
   boo3.left:=-40;
   end;
  if (boo0.visible=false) and (boo1.visible=false) and (boo2.visible=false) and (boo3.visible=false) then
   begin
   detector.enabled:=false;
   normal.Visible:=true;
   normal.enabled:=true;
   nenormal.visible:=true;
   nenormal.Enabled:=true;
   pocetno.Enabled:=false;
   pocetno.Visible:=false;
   showmessage('Браво, ја завршивте играта! Со вкупен резултат: '+inttostr(score));
   end;
  if (score>800) and (boospeed=1000) then
   boospeed:=800;
  if (score>1500) and (boospeed=800) then
   boospeed:=500;
  if (score>3000) and (boospeed=500) then
   boospeed:=200;
  if (score>7000) and (boospeed=200) then
   boospeed:=100;
  if (score>11000) and (boospeed=100) then
   boospeed:=50;
  if (score>15000) and (boospeed=50) then
   boospeed:=20;
  if (maxstreli>1) and (strela2.Visible=false) then
   strela2.visible:=true;
  if (maxstreli>2) and (strela3.Visible=false) then
   strela3.visible:=true;
  if (maxstreli>3) and (strela4.Visible=false) then
   strela4.visible:=true;
  if (maxstreli>4) and (strela5.Visible=false) then
   strela5.visible:=true;
  if (maxstreli>5) and (strela6.Visible=false) then
   strela6.visible:=true;
  if (maxstreli>6) and (strela7.Visible=false) then
   strela7.visible:=true;
  if (maxstreli>7) and (strela8.Visible=false) then
   strela8.visible:=true;
  end;

procedure TForm1.boo0timerTimer(Sender: TObject);
begin
  boo0timer.Interval:=boospeed;
  boo0.top:=boo0.Top+1;
end;

procedure TForm1.AnimaciiTimer(Sender: TObject);
begin
  animacii1.enabled:=false;
  boo0.picture.loadfromfile('sliki/boo1m0.png');
  boo1.picture.loadfromfile('sliki/boo1m0.png');
  boo2.picture.loadfromfile('sliki/boo1m0.png');
  boo3.picture.loadfromfile('sliki/boo1m0.png');
  animacii1.enabled:=true;
end;

procedure TForm1.Animacii1Timer(Sender: TObject);
begin
  animacii.enabled:=false;
  boo0.picture.loadfromfile('sliki/boo1m1.png');
  boo1.picture.loadfromfile('sliki/boo1m1.png');
  boo2.picture.loadfromfile('sliki/boo1m1.png');
  boo3.picture.loadfromfile('sliki/boo1m1.png');
  animacii.enabled:=true;
end;

procedure TForm1.boo1timerTimer(Sender: TObject);
begin
  boo1timer.Interval:=boospeed;
  boo1.left:=boo1.left-1;
end;

procedure TForm1.boo2timerTimer(Sender: TObject);
begin
  boo2timer.Interval:=boospeed;
  boo2.Top:=boo2.top-1;
end;

procedure TForm1.boo3timerTimer(Sender: TObject);
begin
  boo3timer.Interval:=boospeed;
  boo3.left:=boo3.left+1;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  showmessage('Целта е да ги уништите духовите кои ја напаѓаат вашата кула, ако ја допрат губите. Контролите за мерење се копчињата "W"-север "D"-исток "S"-југо "A"-запад а за пукање "space"(празно место)');
end;

procedure TForm1.nenormalClick(Sender: TObject);
begin
  boo0.visible:=true;
  boo0.top:=0;
  boo0.left:=230;
  boo1.visible:=true;
  boo1.top:=230;
  boo1.left:=460;
  boo2.visible:=true;
  boo2.Top:=460;
  boo2.left:=230;
  boo3.visible:=true;
  boo3.Top:=230;
  boo3.left:=0;
  pocetno.Enabled:=true;
  pocetno.Visible:=true;
  pocetno.setfocus;
  starter.enabled:=true;
  boo0sila:=2000000;
  boo1sila:=2000000;
  boo2sila:=2000000;
  boo3sila:=2000000;
  detector.Enabled:=true;
  nenormal.Enabled:=false;
  nenormal.Visible:=false;
  normal.Enabled:=false;
  normal.Visible:=false;
end;

procedure TForm1.normalClick(Sender: TObject);
begin
  boo0.visible:=true;
  boo0.top:=0;
  boo0.left:=230;
  boo1.visible:=true;
  boo1.top:=230;
  boo1.left:=460;
  boo2.visible:=true;
  boo2.Top:=460;
  boo2.left:=230;
  boo3.visible:=true;
  boo3.Top:=230;
  boo3.left:=0;
  starter.enabled:=true;
  pocetno.Enabled:=true;
  pocetno.Visible:=true;
  pocetno.setfocus;
  boo0sila:=2000;
  boo1sila:=2000;
  boo2sila:=2000;
  boo3sila:=2000;
  normal.Enabled:=false;
  normal.Visible:=false;
  nenormal.Enabled:=false;
  nenormal.Visible:=false;
  detector.Enabled:=true;
end;

procedure TForm1.PocetnoKeyPress(Sender: TObject; var Key: char);
begin
  if key='w' then
  begin
  zamok.Picture.LoadFromFile('Sliki/zamok0.bmp');
  pos:=0;
  end;
  if key='d' then
  begin
  zamok.Picture.LoadFromFile('Sliki/zamok1.bmp');
  pos:=1;
  end;
  if key='s' then
  begin
  zamok.Picture.LoadFromFile('Sliki/zamok2.bmp');
  pos:=2;
  end;
  if key='a' then
  begin
  zamok.Picture.LoadFromFile('Sliki/zamok3.bmp');
  pos:=3;
  end;
   if key=' ' then
  begin
     if pos=0 then
        begin
         if Strela1.left>500 then
            begin
               strelapravec1:=pos;
               strela1.Picture.LoadFromFile('Sliki/arrow0.png');
               strela1.Width:=6;
               strela1.Height:=15;
               strela1.Top:=zamok.Top;
               strela1.left:=zamok.left+(32-3);
               strelatimer1.Interval:=SpeedO;
               strelatimer1.enabled:=true;
            end
            else
               if (Strela2.left>500) and (maxstreli>=2) then
            begin
               strelapravec2:=pos;
               strela2.Picture.LoadFromFile('Sliki/arrow0.png');
               strela2.Width:=6;
               strela2.Height:=15;
               strela2.Top:=zamok.Top;
               strela2.left:=zamok.left+(32-3);
               strelatimer2.Interval:=SpeedO;
               strelatimer2.enabled:=true;
            end
            else
            if (Strela3.left>500) and (maxstreli>=3) then
            begin
               strelapravec3:=pos;
               strela3.Picture.LoadFromFile('Sliki/arrow0.png');
               strela3.Width:=6;
               strela3.Height:=15;
               strela3.Top:=zamok.Top;
               strela3.left:=zamok.left+(32-3);
               strelatimer3.Interval:=SpeedO;
               strelatimer3.enabled:=true;
            end
            else
            if (Strela4.left>500) and (maxstreli>=4) then
            begin
               strelapravec4:=pos;
               strela4.Picture.LoadFromFile('Sliki/arrow0.png');
               strela4.Width:=6;
               strela4.Height:=15;
               strela4.Top:=zamok.Top;
               strela4.left:=zamok.left+(32-3);
               strelatimer4.Interval:=SpeedO;
               strelatimer4.enabled:=true;
            end
            else
             if (Strela5.left>500) and (maxstreli>=5) then
            begin
               strelapravec5:=pos;
               strela5.Picture.LoadFromFile('Sliki/arrow0.png');
               strela5.Width:=6;
               strela5.Height:=15;
               strela5.Top:=zamok.Top;
               strela5.left:=zamok.left+(32-3);
               strelatimer5.Interval:=SpeedO;
               //label11.caption:=inttostr(strelatimer5.interval);
               strelatimer5.enabled:=true;
            end
            else
            if (Strela6.left>500) and (maxstreli>=6) then
            begin
               strelapravec6:=pos;
               strela6.Picture.LoadFromFile('Sliki/arrow0.png');
               strela6.Width:=6;
               strela6.Height:=15;
               strela6.Top:=zamok.Top;
               strela6.left:=zamok.left+(32-3);
               strelatimer6.Interval:=SpeedO;
               strelatimer6.enabled:=true;
            end
            else
            if (Strela7.left>500) and (maxstreli>=7) then
            begin
               strelapravec7:=pos;
               strela7.Picture.LoadFromFile('Sliki/arrow0.png');
               strela7.Width:=6;
               strela7.Height:=15;
               strela7.Top:=zamok.Top;
               strela7.left:=zamok.left+(32-3);
               strelatimer7.Interval:=SpeedO;
               strelatimer7.enabled:=true;
            end
            else
            if (Strela8.left>500) and (maxstreli>=8) then
            begin
               strelapravec8:=pos;
               strela8.Picture.LoadFromFile('Sliki/arrow0.png');
               strela8.Width:=6;
               strela8.Height:=15;
               strela8.Top:=zamok.Top;
               strela8.left:=zamok.left+(32-3);
               strelatimer8.Interval:=SpeedO;
               strelatimer8.enabled:=true;
            end
        end;
     if pos=1 then
        begin
         if Strela1.left>500 then
            begin
               strelapravec1:=pos;
               strela1.Picture.LoadFromFile('Sliki/arrow1.png');
               strela1.Width:=15;
               strela1.Height:=6;
               strela1.Top:=zamok.top+(32-3);
               strela1.left:=zamok.left+(64-15);
               strelatimer1.Interval:=SpeedO;
               strelatimer1.enabled:=true;
            end
         else
           if (Strela2.left>500) and (maxstreli>=2) then
            begin
               strelapravec2:=pos;
               strela2.Picture.LoadFromFile('Sliki/arrow1.png');
               strela2.Width:=15;
               strela2.Height:=6;
               strela2.Top:=zamok.top+(32-3);
               strela2.left:=zamok.left+(64-15);
               strelatimer2.Interval:=SpeedO;
               strelatimer2.enabled:=true;
            end
         else
           if (Strela3.left>500) and (maxstreli>=3) then
            begin
               strelapravec3:=pos;
               strela3.Picture.LoadFromFile('Sliki/arrow1.png');
               strela3.Width:=15;
               strela3.Height:=6;
               strela3.Top:=zamok.top+(32-3);
               strela3.left:=zamok.left+(64-15);
               strelatimer3.Interval:=SpeedO;
               strelatimer3.enabled:=true;
            end
         else
           if (Strela4.left>500) and (maxstreli>=4) then
            begin
               strelapravec4:=pos;
               strela4.Picture.LoadFromFile('Sliki/arrow1.png');
               strela4.Width:=15;
               strela4.Height:=6;
               strela4.Top:=zamok.top+(32-3);
               strela4.left:=zamok.left+(64-15);
               strelatimer4.Interval:=SpeedO;
               strelatimer4.enabled:=true;
            end
         else
           if (Strela5.left>500) and (maxstreli>=5) then
            begin
               strelapravec5:=pos;
               strela5.Picture.LoadFromFile('Sliki/arrow1.png');
               strela5.Width:=15;
               strela5.Height:=6;
               strela5.Top:=zamok.top+(32-3);
               strela5.left:=zamok.left+(64-15);
               strelatimer5.Interval:=SpeedO;
               strelatimer5.enabled:=true;
            end
         else
           if (Strela6.left>500) and (maxstreli>=6) then
            begin
               strelapravec6:=pos;
               strela6.Picture.LoadFromFile('Sliki/arrow1.png');
               strela6.Width:=15;
               strela6.Height:=6;
               strela6.Top:=zamok.top+(32-3);
               strela6.left:=zamok.left+(64-15);
               strelatimer6.Interval:=SpeedO;
               strelatimer6.enabled:=true;
            end
         else
           if (Strela7.left>500) and (maxstreli>=7) then
            begin
               strelapravec7:=pos;
               strela7.Picture.LoadFromFile('Sliki/arrow1.png');
               strela7.Width:=15;
               strela7.Height:=6;
               strela7.Top:=zamok.top+(32-3);
               strela7.left:=zamok.left+(64-15);
               strelatimer7.Interval:=SpeedO;
               strelatimer7.enabled:=true;
            end
         else
           if (Strela8.left>500) and (maxstreli>=8) then
            begin
               strelapravec8:=pos;
               strela8.Picture.LoadFromFile('Sliki/arrow1.png');
               strela8.Width:=15;
               strela8.Height:=6;
               strela8.Top:=zamok.top+(32-3);
               strela8.left:=zamok.left+(64-15);
               strelatimer8.Interval:=SpeedO;
               strelatimer8.enabled:=true;
            end
        end;
     if pos=2 then
        begin
         if Strela1.left>500 then
            begin
               strelapravec1:=pos;
               strela1.Picture.LoadFromFile('Sliki/arrow2.png');
               strela1.Width:=6;
               strela1.Height:=15;
               strela1.Top:=zamok.top+(zamok.width-15);
               strela1.left:=zamok.left+(32-3);
               strelatimer1.Interval:=SpeedO;
               strelatimer1.enabled:=true;
            end
         else
           if (Strela2.left>500) and (maxstreli>=2) then
            begin
               strelapravec2:=pos;
               strela2.Picture.LoadFromFile('Sliki/arrow2.png');
               strela2.Width:=6;
               strela2.Height:=15;
               strela2.Top:=zamok.top+(zamok.width-15);
               strela2.left:=zamok.left+(32-3);
               strelatimer2.Interval:=SpeedO;
               strelatimer2.enabled:=true;
            end
         else
           if (Strela3.left>500) and (maxstreli>=3) then
              begin
                 strelapravec3:=pos;
                 strela3.Picture.LoadFromFile('Sliki/arrow2.png');
                 strela3.Width:=6;
                 strela3.Height:=15;
                 strela3.Top:=zamok.top+(zamok.width-15);
                 strela3.left:=zamok.left+(32-3);
                 strelatimer3.Interval:=SpeedO;
                 strelatimer3.enabled:=true;
              end
           else
           if (Strela4.left>500) and (maxstreli>=4) then
              begin
                 strelapravec4:=pos;
                 strela4.Picture.LoadFromFile('Sliki/arrow2.png');
                 strela4.Width:=6;
                 strela4.Height:=15;
                 strela4.Top:=zamok.top+(zamok.width-15);
                 strela4.left:=zamok.left+(32-3);
                 strelatimer4.Interval:=SpeedO;
                 strelatimer4.enabled:=true;
              end
           else
           if (Strela5.left>500) and (maxstreli>=5) then
              begin
                 strelapravec5:=pos;
                 strela5.Picture.LoadFromFile('Sliki/arrow2.png');
                 strela5.Width:=6;
                 strela5.Height:=15;
                 strela5.Top:=zamok.top+(zamok.width-15);
                 strela5.left:=zamok.left+(32-3);
                 strelatimer5.Interval:=SpeedO;
                 strelatimer5.enabled:=true;
              end
           else
           if (Strela6.left>500) and (maxstreli>=6) then
              begin
                 strelapravec6:=pos;
                 strela6.Picture.LoadFromFile('Sliki/arrow2.png');
                 strela6.Width:=6;
                 strela6.Height:=15;
                 strela6.Top:=zamok.top+(zamok.width-15);
                 strela6.left:=zamok.left+(32-3);
                 strelatimer6.Interval:=SpeedO;
                 strelatimer6.enabled:=true;
              end
           else
           if (Strela7.left>500) and (maxstreli>=7) then
              begin
                 strelapravec7:=pos;
                 strela7.Picture.LoadFromFile('Sliki/arrow2.png');
                 strela7.Width:=6;
                 strela7.Height:=15;
                 strela7.Top:=zamok.top+(zamok.width-15);
                 strela7.left:=zamok.left+(32-3);
                 strelatimer7.Interval:=SpeedO;
                 strelatimer7.enabled:=true;
              end
           else
           if (Strela8.left>500) and (maxstreli>=8) then
              begin
                 strelapravec8:=pos;
                 strela8.Picture.LoadFromFile('Sliki/arrow2.png');
                 strela8.Width:=6;
                 strela8.Height:=15;
                 strela8.Top:=zamok.top+(zamok.width-15);
                 strela8.left:=zamok.left+(32-3);
                 strelatimer8.Interval:=SpeedO;
                 strelatimer8.enabled:=true;
              end
        end;
     if pos=3 then
        begin
         if Strela1.left>500 then
            begin
               strelapravec1:=pos;
               strela1.Picture.LoadFromFile('Sliki/arrow3.png');
               strela1.Width:=15;
               strela1.Height:=6;
               strela1.Top:=zamok.top+(32-3);
               strela1.left:=zamok.left-15;
               strelatimer1.Interval:=SpeedO;
               strelatimer1.enabled:=true;
            end
         else
           if (Strela2.left>500) and (maxstreli>=2) then
            begin
               strelapravec2:=pos;
               strela2.Picture.LoadFromFile('Sliki/arrow3.png');
               strela2.Width:=15;
               strela2.Height:=6;
               strela2.Top:=zamok.top+(32-3);
               strela2.left:=zamok.left-15;
               strelatimer2.Interval:=SpeedO;
               strelatimer2.enabled:=true;
            end
         else
           if (Strela3.left>500) and (maxstreli>=3) then
            begin
               strelapravec3:=pos;
               strela3.Picture.LoadFromFile('Sliki/arrow3.png');
               strela3.Width:=15;
               strela3.Height:=6;
               strela3.Top:=zamok.top+(32-3);
               strela3.left:=zamok.left-15;
               strelatimer3.Interval:=SpeedO;
               strelatimer3.enabled:=true;
            end
         else
           if (Strela4.left>500) and (maxstreli>=4) then
            begin
               strelapravec4:=pos;
               strela4.Picture.LoadFromFile('Sliki/arrow3.png');
               strela4.Width:=15;
               strela4.Height:=6;
               strela4.Top:=zamok.top+(32-3);
               strela4.left:=zamok.left-15;
               strelatimer4.Interval:=SpeedO;
               strelatimer4.enabled:=true;
            end
         else
           if (Strela5.left>500) and (maxstreli>=5) then
            begin
               strelapravec5:=pos;
               strela5.Picture.LoadFromFile('Sliki/arrow3.png');
               strela5.Width:=15;
               strela5.Height:=6;
               strela5.Top:=zamok.top+(32-3);
               strela5.left:=zamok.left-15;
               strelatimer5.Interval:=SpeedO;
               strelatimer5.enabled:=true;
            end
         else
           if (Strela6.left>500) and (maxstreli>=6) then
            begin
               strelapravec6:=pos;
               strela6.Picture.LoadFromFile('Sliki/arrow3.png');
               strela6.Width:=15;
               strela6.Height:=6;
               strela6.Top:=zamok.top+(32-3);
               strela6.left:=zamok.left-15;
               strelatimer6.Interval:=SpeedO;
               strelatimer6.enabled:=true;
            end
         else
           if (Strela7.left>500) and (maxstreli>=7) then
            begin
               strelapravec7:=pos;
               strela7.Picture.LoadFromFile('Sliki/arrow3.png');
               strela7.Width:=15;
               strela7.Height:=6;
               strela7.Top:=zamok.top+(32-3);
               strela7.left:=zamok.left-15;
               strelatimer7.Interval:=SpeedO;
               strelatimer7.enabled:=true;
            end
         else
           if (Strela8.left>500) and (maxstreli>=8) then
            begin
               strelapravec8:=pos;
               strela8.Picture.LoadFromFile('Sliki/arrow3.png');
               strela8.Width:=15;
               strela8.Height:=6;
               strela8.Top:=zamok.top+(32-3);
               strela8.left:=zamok.left-15;
               strelatimer8.Interval:=SpeedO;
               strelatimer8.enabled:=true;
            end
        end;
        end;
end;







end.

