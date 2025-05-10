unit view_principal;

{$mode Delphi}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls, horse;

type

  { TForm1 }

  TForm1 = class(TForm)
    BtnIniciar: TBitBtn;
    BtnParar: TBitBtn;
    EdtPorta: TEdit;
    Label1: TLabel;
    procedure BtnIniciarClick(Sender: TObject);
    procedure BtnPararClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public
    procedure Status;
    procedure Start;
    procedure Stop;

  end;

var
  Form1: TForm1;

implementation

procedure DoPing(Req: THorseRequest; Res: THorseResponse);
begin
  Res.Send('pong '+DateTimeToStr(now));
end;


{$R *.lfm}

{ TForm1 }

procedure TForm1.BtnIniciarClick(Sender: TObject);
begin
  Start;
  Status;
end;

procedure TForm1.BtnPararClick(Sender: TObject);
begin
  Stop;
  Status;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    THorse.Get('/ping', DoPing);
end;

procedure TForm1.Status;
begin
  BtnParar.Enabled := THorse.IsRunning;
  BtnIniciar.Enabled := not THorse.IsRunning;
  edtPorta.Enabled := not THorse.IsRunning;

end;

procedure TForm1.Start;
begin
  // Need to set "HORSE_LCL" compilation directive
  THorse.Listen(StrToInt(edtPorta.Text));

end;

procedure TForm1.Stop;
begin
  THorse.StopListen;
end;

end.
