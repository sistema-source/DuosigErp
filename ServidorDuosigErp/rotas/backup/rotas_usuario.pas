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
uses
Horse, fpjson, jsonparser, ZDataset, SysUtils;
procedure PostPedido(Req: THorseRequest;
Res: THorseResponse;
Next: TProc);
var
JObj: TJSONObject;
JArr: TJSONArray;
PedidoQry, ItemQry: TZQuery;
I: integer;
PedidoID: integer;
begin
// Parse o JSON recebido  JObj := TJSONObject(GetJSON(Req.Body));
try
// Insere na tabela PEDIDOS    PedidoQry := TZQuery.Create(nil);
try
PedidoQry.Connection := < SUA_CONEXAO > ;
PedidoQry.SQL.Text := 'INSERT INTO pedidos (cliente_id, data) VALUES (:cliente, :data) RETURNING id';
PedidoQry.ParamByName('cliente').AsInteger := JObj.Integers['cliente_id'];
PedidoQry.ParamByName('data').AsString := JObj.Strings['data'];
PedidoQry.Open; // executa e captura o id  PedidoID := PedidoQry.FieldByName('id').AsInteger;
finally
PedidoQry.Free;
end;
// Agora, os itens (por ser um array)    JArr := JObj.Arrays['itens'];
ItemQry := TZQuery.Create(nil);
try
ItemQry.Connection := < SUA_CONEXAO > ;
for I := 0 to JArr.Count -1 do
begin
ItemQry.SQL.Text := 'INSERT INTO itens_pedido (pedido_id, produto, quantidade) VALUES (:pedido, :produto, :quant)';
ItemQry.ParamByName('pedido').AsInteger := PedidoID;
ItemQry.ParamByName('produto').AsString := JArr.Objects[I].Strings['produto'];
ItemQry.ParamByName('quant').AsInteger := JArr.Objects[I].Integers['quantidade'];
ItemQry.ExecSQL;
end;
finally
ItemQry.Free;
end;
// Confirma o resultado    Res.ContentType('application/json');
Res.Send(Format('{"status":"ok", "id":%d}', [PedidoID]));
except
on E: Exception do
Res.Status(500).Send('{"error":"' +E.Message +'"}');
end;
JObj.Free;
end;
