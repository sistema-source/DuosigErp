unit view_principal;

{$mode Delphi}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls, horse, Horse.Jhonson,
  fpjson, jsonparser,
  rotas_usuario,
  rotas_testes;

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

procedure DoPing(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
begin
  Res.Send('pong ' + DateTimeToStr(now));
end;

procedure DoPingJson(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
var
  LBody: TJSONObject;
  Arrayj : TJsonArray;
begin
  Arrayj := TJsonArray.Create;
  LBody := TJSONObject.Create;
  LBody.Add('none', 'Tone Cezar da');
  LBody.Add('sobrenome', 'Costa');
  ArrayJ.Add(LBody);
  //Res.Send<TJSONObject>(LBody).status(200);
  Res.Send<TJSONArray>(ArrayJ).status(200);
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

  THorse.Use(Jhonson);
  rotas_usuario.Registry;
    rotas_testes.Registry;

  THorse.Get('/ping', DoPing);
  THorse.Get('/ping/json', DoPingJson);
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
