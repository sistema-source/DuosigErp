unit rotas_usuario;

{$mode Delphi}{$H+}

interface

uses
  Classes, SysUtils, Horse, Horse.Jhonson, fpjson, jsonparser, dao_usuario;

procedure Registry;

implementation

procedure GetUsers(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
var
  JSONArray: TJSONArray;
  JSONObject: TJSONObject;
begin
  JSONArray := TJSONArray.Create;
  try
    JSONObject := TJSONObject.Create;
    JSONObject.Add('id', 1);
    JSONObject.Add('nome', 'Tone Cezar');

    JSONArray.Add(JSONObject);
    Res.Send<TJSONArray>(JSONArray);
  finally
    JSONArray.Free;
  end;
end;


procedure ObterUsuarioByNome(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
var
  JSONArray: TJSONArray;
  JSONObject: TJSONObject;
  DaoUsuario: TDaoUsuario;
  lNomeUsuario: string;
begin
  DaoUsuario := TDaoUsuario.Create(nil);
  lNomeUsuario := Req.Params['nome_usuario'];
  JSONArray := DaoUsuario.ObterRegistroByNome(lNomeUsuario);
  try
    Res.Send<TJSONArray>(JSONArray).status(200);
  finally
    DaoUsuario.Free;
  end;
end;

procedure ObterUsuarioById(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
var
  JSONArray: TJSONArray;
  JSONObject: TJSONObject;
  DaoUsuario: TDaoUsuario;
  LId: string;
begin
  DaoUsuario := TDaoUsuario.Create(nil);
  LId := Req.Params['id'];
  JSONArray := DaoUsuario.ObterRegistroById(LId);
  try
    Res.Send<TJSONArray>(JSONArray).status(200);
  finally
    DaoUsuario.Free;
  end;
end;

procedure ObterUsuarioByEmail(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
var
  JSONArray: TJSONArray;
  JSONObject: TJSONObject;
  DaoUsuario: TDaoUsuario;
  LEmail: string;
begin
  DaoUsuario := TDaoUsuario.Create(nil);
  LEmail := Req.Params['email'];
  JSONArray := DaoUsuario.ObterRegistroByEmail(LEmail);
  try
    Res.Send<TJSONArray>(JSONArray).status(200);
  finally
    DaoUsuario.Free;
  end;
end;

procedure GravarUsuario(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
var
  LJsonObj: TJSONObject;
  I: integer;
  LId: string;
  LDao: TDaoUsuario;
  Status : Integer;
  LRetorno : String;
begin
  LJsonObj := TJSONObject(GetJSON(Req.Body));
{  LDao := TDaoUsuario.Create(nil);
  try
    Try
      LRetorno := LDao.GravarUsuario(LJsonObj, Status);
    Except
      on e : exception
    end;


  finally
    LDao.Free;
  end;   }

end;

procedure Registry;
begin
  THorse.Get('/usuario/nome_usuario/:nome_usuario', ObterUsuarioByNome);
  THorse.Get('/usuario/id/:id', ObterUsuarioById);
  THorse.Get('/usuario/email/:email', ObterUsuarioByEmail);
  THorse.Post('/usuario', GravarUsuario);
  THorse.Put('/usuario', GravarUsuario);
end;

end.
end;
