unit uhelper;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Controls, Graphics, ExtCtrls, Forms;

type

  { TRound }

  TRound = class
    class procedure Arredondamento(const AControls: TWinControl; const ARadius : integer = 10);
  end;

  { TPanel }

  TPanel = class(Extctrls.TPanel)
  private
    px,py : integer;
  protected
    procedure Paint; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
  end;

  { TForm }

  TForm = class(forms.TForm)
  public
    constructor Create(TheOwner: TComponent); override;
  protected
     procedure Paint; override;
     procedure KeyPress(var Key: char); override;
  end;


implementation

{ TRound }

class procedure TRound.Arredondamento(const AControls: TWinControl;  const ARadius: integer);
var
  ABitmap: TBitmap;
begin
   try
     ABitmap := TBitmap.create;
     ABitmap.Monochrome:=true;
     ABitmap.Width     := AControls.Width;
     ABitmap.Height    := AControls.Height;
     With ABitmap.canvas do
     begin
       roundrect(0,0,AControls.Width, AControls.Height, ARadius,ARadius);
       AControls.SetShape(ABitmap);
     end;
   finally
     ABitmap.free;
   end;

end;

{ TPanel }

procedure TPanel.Paint;
begin
  inherited Paint;
  if tag = 1 then
     TRound.Arredondamento(Self,15);
end;

procedure TPanel.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  px := x;
  py := y;
end;

procedure TPanel.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  if tag = 2 then
  if ssLeft in Shift then
    with TForm(GetTopParent) do
    begin
      left := mouse.CursorPos.X - px;
      top  := mouse.CursorPos.Y - py;
    end;
  inherited MouseMove(Shift, X, Y);
end;

{ TForm }

constructor TForm.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  KeyPreview:=true;
end;

procedure TForm.Paint;
begin
  inherited Paint;
  TRound.Arredondamento(Self,20);
end;

procedure TForm.KeyPress(var Key: char);
begin
  inherited KeyPress(Key);
  if key = #13 then
     selectNext(ActiveControl,true,true);
end;

end.

