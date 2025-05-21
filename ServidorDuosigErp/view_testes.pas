unit view_testes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, fpjson, jsonparser;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private

  public
    procedure CriarJson;

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  CriarJson;
end;

procedure TForm1.CriarJson;
var
  JSONArray: TJSONArray;
  JSONObject, JsonMenu, JsonOpcao, JsonSubMenu : TJSONObject;
  i: integer;

begin
  JSONArray := TJSONArray.Create;
  JsonMenu := TJSONObject.Create;
  JsonOpcao:= TJSONObject.Create;
  JsonSubMenu := TJSONObject.Create;
  JsonSubMenu.Add('nome_dll','cadmenu.dll');
  JsonSubMenu.Add('habilitado',1);
  JsonSubMenu.Add('inserir',1);
  JsonSubMenu.Add('ler',1);
    JsonSubMenu.Add('editar',1);
      JsonSubMenu.Add('apagar',1);
  JSONArray.add(jsonSubmenu);
  jsonOpcao.Add(JSONArray);
  JsonMenu.Add('Geral',JSONArray);

  Memo1.Lines.Text := JsonMenu.AsJSON;

{   Query.First;
   while not Query.EOF do
   begin
     JSONObject := TJSONObject.Create;
     for i := 0 to Query.Fields.Count - 1 do
       JSONObject.Add(Query.Fields[i].FieldName, Query.Fields[i].AsString);
     JSONArray.Add(JSONObject);
     Query.Next;
   end;

   Result := JSONArray;  }

end;

end.
