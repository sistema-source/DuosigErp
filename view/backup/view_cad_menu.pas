unit view_cad_menu;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, view_cadastro, model_menu, vo_menu;

type

  { TViewCadMenu }

  TViewCadMenu = class(TViewCadastro)
    ImgCheck: TImageList;
    TrVwMenu: TTreeView;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TrVwMenuDblClick(Sender: TObject);
  private
    FMenu: TMenu;
    FModelMenu: TModelMenu;
    procedure SetMenu(AValue: TMenu);
    procedure SetModelMenu(AValue: TModelMenu);
    procedure SimularDados;
  public
    procedure MontarMenu;
    property ModelMenu: TModelMenu read FModelMenu write SetModelMenu;
    property Menu: TMenu read FMenu write SetMenu;

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

procedure TViewCadMenu.FormCreate(Sender: TObject);
begin
  FModelMenu := TModelMenu.Create(Self);
  MontarMenu;
end;

procedure TViewCadMenu.FormDestroy(Sender: TObject);
begin
  if Assigned(FModelMenu) then
    FModelMenu.Free;

  if Assigned(FMenu) then
    FMenu.Free;
end;

procedure TViewCadMenu.SetModelMenu(AValue: TModelMenu);
begin
  if FModelMenu = AValue then Exit;
  FModelMenu := AValue;
end;

procedure TViewCadMenu.SetMenu(AValue: TMenu);
begin
  if FMenu = AValue then Exit;
  FMenu := AValue;
end;

procedure TViewCadMenu.SimularDados;

procedure Adicionar(MenuOpcao : TOpcaoMenu; id, Nome, NomeDll : String; habilitado, inserir,ler, apagar,editar, print: Integer);
begin
  MenuOpcao.IsCreate:= Inserir;
  MenuOpcao.IsDelete= apagar;
  MenuOpcao.IsUpdate:= editar;
  MenuOpcao.IsRead:= ler;
  MenuOpcao.IsPrint:= print;
  MenuOpcao.Habilitado:= habilitado;
  MEnuOpcao.NomeOpcao:= Nome;
  MEnuOpcao.NomeDll:= NomeDll;
  MenuOpcao.Id:= Id;
end;

Var
  LModulo : TModulo;
  LOpcaoMenu : TOpcaoMenu;
begin
  If Not Assigned(FMenu) then
    FMenu := TMenu.Create;

    LModulo := TModulo.Create;
    LModulo.Nome := 'Geral';
    FMenu.AddModulo(LModulo);
    LOpcaoMenu := TOpcaoMenu.Create;
    Adicionar(LOpcaoMenu,'1','Atividade','cadAtividade.dll',1,1,1,1,1);

    LOpcaoMenu := TOpcaoMenu.Create;
    Adicionar(LOpcaoMenu,'1','Pessoa','cadAtividade.dll',1,1,1,1,1);


    LModulo := TModulo.Create;
    LModulo.Nome := 'Estoque';
    FMenu.AddModulo(LModulo);
    LOpcaoMenu := TOpcaoMenu.Create;
    Adicionar(LOpcaoMenu,'1','Produto','cadAtividade.dll',1,1,1,1,1);


    LModulo := TModulo.Create;
    LModulo.Nome := 'Financeiro';
    FMenu.AddModulo(LModulo);
    LOpcaoMenu := TOpcaoMenu.Create;
    Adicionar(LOpcaoMenu,'1','Contas a Receber','cadAtividade.dll',1,1,1,1,1);



    LModulo := TModulo.Create;
    LModulo.Nome := 'Fiscal/Contábil';
    FMenu.AddModulo(LModulo);
    LOpcaoMenu := TOpcaoMenu.Create;
    Adicionar(LOpcaoMenu,'1','Sped Fiscal','cadAtividade.dll',1,1,1,1,1);


    LModulo := TModulo.Create;
    LModulo.Nome := 'Vendas';
    FMenu.AddModulo(LModulo);
    LOpcaoMenu := TOpcaoMenu.Create;
    Adicionar(LOpcaoMenu,'1','Orcamento','cadAtividade.dll',1,1,1,1,1);



    LModulo := TModulo.Create;
    LModulo.Nome := 'Compras';
    FMenu.AddModulo(LModulo);
        LOpcaoMenu := TOpcaoMenu.Create;
    Adicionar(LOpcaoMenu,'1','Pedido de Compra','cadAtividade.dll',1,1,1,1,1);



    LModulo := TModulo.Create;
    LModulo.Nome := 'Configuração';
    FMenu.AddModulo(LModulo);
        LOpcaoMenu := TOpcaoMenu.Create;
    Adicionar(LOpcaoMenu,'1','Menu','cadAtividade.dll',1,1,1,1,1);



end;

procedure TViewCadMenu.MontarMenu;
var
  Raiz, Modulo, Opcao: TTreeNode;
begin
  TrVwMenu.Items.Clear;
  Raiz := TrVwMenu.Items.Add(nil, 'Menu');
  Modulo := TrVwMenu.Items.AddChild(Raiz, 'Geral');
  Opcao := TrVwMenu.Items.AddChild(Modulo, 'Paises');
  Opcao.SelectedIndex := 1;
  opcao.ImageIndex := 1;

end;

end.
