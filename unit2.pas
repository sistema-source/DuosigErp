unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type

  { TForm2 }

  TForm2 = class(TForm)
  private
    FMsg: TNotifyEvent;
    procedure SetMsg(AValue: TNotifyEvent);

  public
    property Msg : TNotifyEvent read FMsg write SetMsg;

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.SetMsg(AValue: TNotifyEvent);
begin
  if FMsg=AValue then Exit;
  FMsg:=AValue;
end;

end.

