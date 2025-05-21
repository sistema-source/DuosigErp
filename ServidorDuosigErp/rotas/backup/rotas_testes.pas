unit rotas_testes;

{$mode Delphi}{$H+}

interface

uses
  Classes, SysUtils, Horse, Horse.Jhonson, fpjson, jsonparser, vo_menu, Dialogs;

procedure Registry;

implementation

procedure ObterJsonMenu(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
var
  Menu, menu1: TMenu;
  Modulo: TModulo;
  OpcaoMenu: TOpcaoMenu;
  JSONData: TJSONData;
  JSONArray: TJSONArray;
begin
  Menu := TMenu.Create;
  Modulo := TModulo.Create;

  Modulo.NomeModulo := 'Geral';
  Menu.AddModulo(Modulo);

  OpcaoMenu := TOpcaoMenu.Create;
  OpcaoMenu.NomeOpcao := 'Paises';
  OpcaoMenu.NomeDll := 'cad_menu.dll';
  OpcaoMenu.VersaoDll := '1';
  OpcaoMenu.IsCreate := 1;
  OpcaoMenu.IsRead := 1;
  OpcaoMenu.IsUpdate := 1;
  OpcaoMenu.IsDelete := 1;
  OpcaoMenu.IsPrint := 1;
  OpcaoMenu.ID := 'adsf';
  OpcaoMenu.Habilitado := 1;
  Modulo.AddOpcao(OpcaoMenu);


  Modulo := TModulo.Create;
  Modulo.NomeModulo := 'Estoque';
  Menu.AddModulo(Modulo);
  OpcaoMenu := TOpcaoMenu.Create;
  OpcaoMenu.NomeOpcao := 'Produto';
  OpcaoMenu.NomeDll := 'cad_produto.dll';
  OpcaoMenu.VersaoDll := '1';
  OpcaoMenu.IsCreate := 1;
  OpcaoMenu.IsRead := 1;
  OpcaoMenu.IsUpdate := 1;
  OpcaoMenu.IsDelete := 1;
  OpcaoMenu.IsPrint := 1;
  OpcaoMenu.ID := 'adsf';
  OpcaoMenu.Habilitado := 1;
  Modulo.AddOpcao(OpcaoMenu);


  Modulo := TModulo.Create;
  Modulo.NomeModulo := 'Vendas';
  Menu.AddModulo(Modulo);
  OpcaoMenu := TOpcaoMenu.Create;
  OpcaoMenu.NomeOpcao := 'Orcamento';
  OpcaoMenu.NomeDll := 'cad_orcamento.dll';
  OpcaoMenu.VersaoDll := '1';
  OpcaoMenu.IsCreate := 1;
  OpcaoMenu.IsRead := 1;
  OpcaoMenu.IsUpdate := 1;
  OpcaoMenu.IsDelete := 1;
  OpcaoMenu.IsPrint := 1;
  OpcaoMenu.ID := 'adsf';
  OpcaoMenu.Habilitado := 1;
  Modulo.AddOpcao(OpcaoMenu);


  // Analisa a string JSON e cria um TJSONData
  JSONData := GetJSON(Menu.ToJSON);
  JSONArray := TJSONArray(JSONData);


  Res.Send<TJSONArray>(JSONArray).status(200);

Menu1 := TMenu.Create;
Menu1.PopulateFromJSON(Menu.ToJSON);
  ShowMessage(TModulo(Menu1.Modulos).NomeModulo);

end;


procedure Registry;
begin
  THorse.Get('/teste/ObterJsonMenu', ObterJsonMenu);
end;

end.
end;
