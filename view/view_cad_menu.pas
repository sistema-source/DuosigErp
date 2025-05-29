unit view_cad_menu;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  rxswitch, view_cadastro, model_menu, vo_menu, contnrs;

type
  THabilitado = (taHabilitado, taDesabilitado);
  TAcessoPermissao = (tapHabilitado, tapInserir, tapEditar, tapVer,
    tapApagar, tapImprimir);

  { TViewCadMenu }
  TViewCadMenu = class(TViewCadastro)
    ChkGrpAcessoPermissao: TCheckGroup;
    ImgCheck: TImageList;
    PnlAcessoPermissao: TPanel;
    TrVwMenu: TTreeView;
    procedure ChkGrpAcessoPermissaoClick(Sender: TObject);
    procedure ChkGrpAcessoPermissaoItemClick(Sender: TObject; Index: integer);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TrVwMenuClick(Sender: TObject);
    procedure TrVwMenuDblClick(Sender: TObject);
  private
    FListaOpcoes: TFPHashList;
    FMenu: TMenu;
    FModelMenu: TModelMenu;
    FOpcaoMenu: TOpcaoMenu;
    procedure SetListaOpcoes(AValue: TFPHashList);
    procedure SetMenu(AValue: TMenu);
    procedure SetModelMenu(AValue: TModelMenu);
    procedure SetOpcaoMenu(AValue: TOpcaoMenu);
    procedure SimularDados;
    procedure MostrarAcessoPermissao(pOpcaoNode: TTreeNode);
  public
    procedure MontarMenu;
    property ModelMenu: TModelMenu read FModelMenu write SetModelMenu;
    property Menu: TMenu read FMenu write SetMenu;
    property ListaOpcoes: TFPHashList read FListaOpcoes write SetListaOpcoes;
    property OpcaoMenu: TOpcaoMenu read FOpcaoMenu write SetOpcaoMenu;

  end;

var
  ViewCadMenu: TViewCadMenu;

implementation

{$R *.lfm}

{ TViewCadMenu }

procedure TViewCadMenu.TrVwMenuDblClick(Sender: TObject);
begin
  // Trocar a Imagem para habilitadado ou desabilitado

end;


procedure TViewCadMenu.SetListaOpcoes(AValue: TFPHashList);
begin
  if FListaOpcoes = AValue then Exit;
  FListaOpcoes := AValue;
end;

procedure TViewCadMenu.FormCreate(Sender: TObject);
begin
  FModelMenu := TModelMenu.Create(Self);
  FListaOpcoes := TFPHashList.Create;

  MontarMenu;

end;

procedure TViewCadMenu.ChkGrpAcessoPermissaoClick(Sender: TObject);
begin
end;

procedure TViewCadMenu.ChkGrpAcessoPermissaoItemClick(Sender: TObject; Index: integer);
begin
  if FOpcaoMenu <> nil then
    ShowMessage(FOpcaoMenu.NomeOpcao);

end;

procedure TViewCadMenu.FormDestroy(Sender: TObject);
begin
  if Assigned(FModelMenu) then
    FModelMenu.Free;

  if Assigned(FMenu) then
    FMenu.Free;

end;

procedure TViewCadMenu.TrVwMenuClick(Sender: TObject);
begin
  MostrarAcessoPermissao(TrVwMenu.Selected);
end;

procedure TViewCadMenu.SetModelMenu(AValue: TModelMenu);
begin
  if FModelMenu = AValue then Exit;
  FModelMenu := AValue;
end;

procedure TViewCadMenu.SetOpcaoMenu(AValue: TOpcaoMenu);
begin
  if FOpcaoMenu = AValue then Exit;
  FOpcaoMenu := AValue;
end;

procedure TViewCadMenu.SetMenu(AValue: TMenu);
begin
  if FMenu = AValue then Exit;
  FMenu := AValue;
end;


procedure TViewCadMenu.SimularDados;
var
  LModulo: TModulo;
  LOpcaoMenu: TOpcaoMenu;

  procedure Adicionar(Modulo: TModulo; MenuOpcao: TOpcaoMenu;
    id, Nome, NomeDll: string; habilitado, inserir, ler, apagar, editar, print: integer);
  begin
    MenuOpcao.IsCreate := Inserir;
    MenuOpcao.IsDelete := apagar;
    MenuOpcao.IsUpdate := editar;
    MenuOpcao.IsRead := ler;
    MenuOpcao.IsPrint := print;
    MenuOpcao.Habilitado := habilitado;
    MEnuOpcao.NomeOpcao := Nome;
    MEnuOpcao.NomeDll := NomeDll;
    MenuOpcao.Id := Id;
    Modulo.AddOpcao(MenuOpcao);
  end;

begin
  if not Assigned(FMenu) then
    FMenu := TMenu.Create;

  LModulo := TModulo.Create;
  LModulo.NomeModulo := 'Geral';
  FMenu.AddModulo(LModulo);

  LOpcaoMenu := TOpcaoMenu.Create;
  Adicionar(LModulo, LOpcaoMenu, '1', 'Atividade', 'cadAtividade.dll', 0, 1, 1, 1, 1, 1);

  LOpcaoMenu := TOpcaoMenu.Create;
  Adicionar(LModulo, LOpcaoMenu, '1', 'Pessoa', 'cadAtividade.dll', 1, 1, 1, 1, 1, 1);


  LModulo := TModulo.Create;
  LModulo.NomeModulo := 'Estoque';
  FMenu.AddModulo(LModulo);
  LOpcaoMenu := TOpcaoMenu.Create;
  Adicionar(LModulo, LOpcaoMenu, '1', 'Produto', 'cadAtividade.dll', 1, 1, 1, 1, 1, 1);


  LModulo := TModulo.Create;
  LModulo.NomeModulo := 'Financeiro';
  FMenu.AddModulo(LModulo);
  LOpcaoMenu := TOpcaoMenu.Create;
  Adicionar(LModulo, LOpcaoMenu, '1', 'Contas a Receber', 'cadAtividade.dll',
    1, 1, 1, 1, 1, 1);



  LModulo := TModulo.Create;
  LModulo.NomeModulo := 'Fiscal/Contábil';
  FMenu.AddModulo(LModulo);
  LOpcaoMenu := TOpcaoMenu.Create;
  Adicionar(LModulo, LOpcaoMenu, '1', 'Sped Fiscal', 'cadAtividade.dll', 1,
    1, 1, 1, 1, 1);


  LModulo := TModulo.Create;
  LModulo.NomeModulo := 'Vendas';
  FMenu.AddModulo(LModulo);
  LOpcaoMenu := TOpcaoMenu.Create;
  Adicionar(LModulo, LOpcaoMenu, '1', 'Orcamento', 'cadAtividade.dll', 1, 1, 1, 1, 1, 1);



  LModulo := TModulo.Create;
  LModulo.NomeModulo := 'Compras';
  FMenu.AddModulo(LModulo);
  LOpcaoMenu := TOpcaoMenu.Create;
  Adicionar(LModulo, LOpcaoMenu, '1', 'Pedido de Compra', 'cadAtividade.dll',
    1, 1, 1, 1, 1, 1);



  LModulo := TModulo.Create;
  LModulo.NomeModulo := 'Configuração';
  FMenu.AddModulo(LModulo);
  LOpcaoMenu := TOpcaoMenu.Create;
  Adicionar(LModulo, LOpcaoMenu, '1', 'Opção Menu', 'cadAtividade.dll',
    1, 1, 1, 1, 1, 1);

end;

procedure TViewCadMenu.MostrarAcessoPermissao(pOpcaoNode: TTreeNode);
begin

  FOpcaoMenu := TOpcaoMenu(FListaOpcoes.Find(pOpcaoNode.Text));

  if FOpcaoMenu <> nil then
  begin

    PnlAcessoPermissao.Visible := True;

    ChkGrpAcessoPermissao.Checked[Ord(tapHabilitado)] := FOpcaoMenu.Habilitado > 0;
    ChkGrpAcessoPermissao.Checked[Ord(tapInserir)] := FOpcaoMenu.IsCreate > 0;
    ChkGrpAcessoPermissao.Checked[Ord(tapEditar)] := FOpcaoMenu.IsUpdate > 0;
    ChkGrpAcessoPermissao.Checked[Ord(tapVer)] := FOpcaoMenu.IsRead > 0;
    ChkGrpAcessoPermissao.Checked[Ord(tapVer)] := FOpcaoMenu.IsDelete > 0;
    ChkGrpAcessoPermissao.Checked[5] := FOpcaoMenu.IsPrint > 0;

    if FOpcaoMenu.Habilitado > 0 then
    begin
      pOpcaoNode.SelectedIndex := Ord(taHabilitado);
      pOpcaoNode.ImageIndex := Ord(taHabilitado);

    end
    else
    begin
      pOpcaoNode.SelectedIndex := Ord(taDesabilitado);
      pOpcaoNode.ImageIndex := Ord(taDesabilitado);
    end;

  end
  else
  begin
    PnlAcessoPermissao.Visible := False;
  end;

end;

procedure TViewCadMenu.MontarMenu;
var
  LRaizNode, LModuloNode, LOpcaoNode: TTreeNode;
  i, j, p: integer;
  LModulo: TModulo;
  LOpcaoMenu: TOpcaoMenu;
begin
  TrVwMenu.Items.Clear;

  LRaizNode := TrVwMenu.Items.Add(nil, 'Menu');

  SimularDados;

  p := 0;
  for i := 0 to Menu.Modulos.Count - 1 do
  begin
    LModulo := TModulo(Menu.Modulos.Items[i]);
    LModuloNode := TrVwMenu.Items.AddChild(LRaizNode, LModulo.NomeModulo);

    for j := 0 to LModulo.Opcoes.Count - 1 do
    begin
      LOpcaoMenu := TOpcaoMenu(LModulo.Opcoes.Items[j]);
      LOpcaoNode := TrVwMenu.Items.AddChild(LModuloNode, LOpcaoMenu.NomeOpcao);
      FListaOpcoes.Add(LOpcaoMenu.NomeOpcao, LOpcaoMenu);
      MostrarAcessoPermissao(LOpcaoNode);
    end;
  end;
  TrVwMenu.Selected := LRaizNode;
  MostrarAcessoPermissao(LRaizNode);

end;

end.
