unit vo_menu;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, fpjson, jsonparser;

type

  { TOpcaoMenu }

  TOpcaoMenu = class
  private
    FHabilitado: integer;
    FId: string;
    FIsCreate: integer;
    FIsDelete: integer;
    FIsPrint: integer;
    FIsRead: integer;
    FIsUpdate: integer;
    FNomeDll: string;
    FNomeOpcao: string;
    FVersaoDll: string;
    procedure SetHabilitado(AValue: integer);
    procedure SetId(AValue: string);
    procedure SetIsCreate(AValue: integer);
    procedure SetIsDelete(AValue: integer);
    procedure SetIsPrint(AValue: integer);
    procedure SetIsRead(AValue: integer);
    procedure SetIsUpdate(AValue: integer);
    procedure SetNomeDll(AValue: string);
    procedure SetNomeOpcao(AValue: string);
    procedure SetVersaoDll(AValue: string);
  public
    property NomeOpcao: string read FNomeOpcao write SetNomeOpcao;
    property NomeDll: string read FNomeDll write SetNomeDll;
    property VersaoDll: string read FVersaoDll write SetVersaoDll;
    property Habilitado: integer read FHabilitado write SetHabilitado;
    property IsCreate: integer read FIsCreate write SetIsCreate;
    property IsRead: integer read FIsRead write SetIsRead;
    property IsUpdate: integer read FIsUpdate write SetIsUpdate;
    property IsDelete: integer read FIsDelete write SetIsDelete;
    property IsPrint: integer read FIsPrint write SetIsPrint;
    property Id: string read FId write SetId;

    function ToJSON: TJSONObject;
  end;

  { TModulo }
  TModulo = class
  private
    FNomeModulo: string;
    FOpcoes: TList;
    procedure SetNomeModulo(AValue: string);
    procedure SetOpcoes(AValue: TList);
  public
    constructor Create;
    destructor Destroy; override;
    property NomeModulo: string read FNomeModulo write SetNomeModulo;
    property Opcoes: TList read FOpcoes write SetOpcoes;
    function AddOpcao(pOpcaoMenu: TOpcaoMenu): integer;
    function ToJSON: TJSONObject;
  end;


  { TMenu }

  TMenu = class
  private
    FModulos: TList;
    FNome: string;
    procedure SetModulos(AValue: TList);
    procedure SetNome(AValue: string);
  public
    constructor Create;
    destructor Destroy; override;
    property Nome: string read FNome write SetNome;
    property Modulos: TList read FModulos write SetModulos;
    function AddModulo(pModulo: TModulo): integer;
    function ToJSON: string;
    procedure PopulateFromJSON(const AJSON: string);
  end;


implementation

{ TMenu }

procedure TMenu.SetModulos(AValue: TList);
begin
  if FModulos = AValue then Exit;
  FModulos := AValue;
end;

procedure TMenu.SetNome(AValue: string);
begin
  if FNome = AValue then Exit;
  FNome := AValue;
end;

constructor TMenu.Create;
begin
  FModulos := TList.Create;
end;

destructor TMenu.Destroy;
var
  i: integer;
begin
  for i := 0 to FModulos.Count - 1 do
  begin
    TObject(FModulos.Items[i]).Free;
  end;
  inherited Destroy;
end;

function TMenu.AddModulo(pModulo: TModulo): integer;
begin
  if Assigned(pModulo) then
    FModulos.Add(pModulo);
end;

function TMenu.ToJSON: string;
var
  I: integer;
  Modulo: TModulo;
  RootArray: TJSONArray;
begin
  RootArray := TJSONArray.Create;
  try
    for I := 0 to FModulos.Count - 1 do
    begin
      Modulo := TModulo(FModulos[I]);
      RootArray.Add(TJSONObject.Create([Modulo.NomeModulo, Modulo.ToJSON]));
    end;
    Result := RootArray.AsJSON;
  finally
    RootArray.Free;
  end;
end;

procedure TMenu.PopulateFromJSON(const AJSON: string);
var
  JSONArray: TJSONArray;
  I, J: Integer;
  JSONModule: TJSONObject;
  ModuleName, OptionName: string;
  ModuloObject, OpcaoObject: TJSONObject;
  Modulo: TModulo;
  OpcaoMenu: TOpcaoMenu;
begin
  JSONArray := TJSONArray(GetJSON(AJSON));
  try
    for I := 0 to JSONArray.Count - 1 do
    begin
      JSONModule := JSONArray.Objects[I];

      if JSONModule.Count > 0 then
      begin
        ModuleName := JSONModule.Names[0];
        ModuloObject := JSONModule.Objects[ModuleName];

        Modulo := TModulo.Create;
        Modulo.NomeModulo := ModuleName;

        for J := 0 to ModuloObject.Count - 1 do
        begin
          OptionName := ModuloObject.Names[J];
          OpcaoObject := ModuloObject.Objects[OptionName];
          OpcaoMenu := TOpcaoMenu.Create;

          OpcaoMenu.NomeOpcao := OptionName;
          OpcaoMenu.NomeDll := OpcaoObject.Get('nome_dll', '');
          OpcaoMenu.Create := OpcaoObject.Get('criar', 0);
          OpcaoMenu.Read := OpcaoObject.Get('ler', 0);
          OpcaoMenu.Update := OpcaoObject.Get('editar', 0);
          OpcaoMenu.Delete := OpcaoObject.Get('apagar', 0);
          OpcaoMenu.Print := OpcaoObject.Get('print', 0);
          OpcaoMenu.VersaoDll := OpcaoObject.Get('versao_dll', '');
          OpcaoMenu.Id := OpcaoObject.Get('id', '');

          Modulo.AddOpcao(OpcaoMenu);
        end;

        AddModulo(Modulo);
      end;
    end;
  finally
    JSONArray.Free;
  end;
end;

{ TOpcaoMenu }

procedure TOpcaoMenu.SetHabilitado(AValue: integer);
begin
  if FHabilitado = AValue then Exit;
  FHabilitado := AValue;
end;

procedure TOpcaoMenu.SetId(AValue: string);
begin
  if FId = AValue then Exit;
  FId := AValue;
end;

procedure TOpcaoMenu.SetIsCreate(AValue: integer);
begin
  if FIsCreate = AValue then Exit;
  FIsCreate := AValue;
end;

procedure TOpcaoMenu.SetIsDelete(AValue: integer);
begin
  if FIsDelete = AValue then Exit;
  FIsDelete := AValue;
end;

procedure TOpcaoMenu.SetIsPrint(AValue: integer);
begin
  if FIsPrint = AValue then Exit;
  FIsPrint := AValue;
end;

procedure TOpcaoMenu.SetIsRead(AValue: integer);
begin
  if FIsRead = AValue then Exit;
  FIsRead := AValue;
end;

procedure TOpcaoMenu.SetIsUpdate(AValue: integer);
begin
  if FIsUpdate = AValue then Exit;
  FIsUpdate := AValue;
end;

procedure TOpcaoMenu.SetNomeDll(AValue: string);
begin
  if FNomeDll = AValue then Exit;
  FNomeDll := AValue;
end;

procedure TOpcaoMenu.SetNomeOpcao(AValue: string);
begin
  if FNomeOpcao = AValue then Exit;
  FNomeOpcao := AValue;
end;

procedure TOpcaoMenu.SetVersaoDll(AValue: string);
begin
  if FVersaoDll = AValue then Exit;
  FVersaoDll := AValue;
end;

function TOpcaoMenu.ToJSON: TJSONObject;
begin
  Result := TJSONObject.Create;
  Result.Add('nome_dll', FNomeDll);
  Result.Add('habilitado', FHabilitado); // Assumindo habilitado com base no create
  Result.Add('criar', FisCreate);
  Result.Add('ler', FIsRead);
  Result.Add('editar', FIsUpdate);
  Result.Add('apagar', FISDelete);
  Result.Add('print', FIsPrint);
  Result.Add('versao_dll', FVersaoDll);
  Result.Add('id', FId);
end;

{ TModulo }

procedure TModulo.SetNomeModulo(AValue: string);
begin
  if FNomeModulo = AValue then Exit;
  FNomeModulo := AValue;
end;

procedure TModulo.SetOpcoes(AValue: TList);
begin
  if FOpcoes = AValue then Exit;
  FOpcoes := AValue;
end;

constructor TModulo.Create;
begin
  FOpcoes := TList.Create;
end;

destructor TModulo.Destroy;
var
  i: integer;
begin
  for i := 0 to FOpcoes.Count - 1 do
  begin
    TObject(FOpcoes.Items[i]).Free;
  end;
  inherited Destroy;
end;

function TModulo.AddOpcao(pOpcaoMenu: TOpcaoMenu): integer;
begin
  if Assigned(pOpcaoMenu) then
    FOpcoes.Add(pOpcaoMenu);
end;

function TModulo.ToJSON: TJSONObject;
var
  I: integer;
  Opcao: TOpcaoMenu;
begin
  Result := TJSONObject.Create;
  for I := 0 to FOpcoes.Count - 1 do
  begin
    Opcao := TOpcaoMenu(FOpcoes[I]);
    Result.Add(Opcao.NomeOpcao, Opcao.ToJSON);
  end;
end;

end.
