unit view_menu;

{$mode delphi}{$H+}

interface

uses
  Windows, SysUtils, Classes, Contnrs, Forms, Controls, Graphics, Dialogs, ActnList, StdCtrls, ExtCtrls, Buttons,
  model_conexao, model_migracao;

type
  TShowFormInParent = procedure(AParent: HWND); stdcall;
  TAjusteTamanhoParent = procedure(pLeft, pTop, pHeigh, pWidth: integer); stdcall;
  TFormKeyUp = procedure(Sender: TObject; var Key: Word; Shift: TShiftState); stdcall;

  { TRound }

  TRound = class
    class procedure Arredondamento(const AControls: TWinControl; const ARadius: integer = 10);
  end;


  { TViewMenu }

  TViewMenu = class(TForm)
    Button1: TButton;
    Button2: TButton;
    BtnCarregar: TButton;
    BtnMostrar: TButton;
    Label2: TLabel;
    Label3: TLabel;
    LstBxSubMenu: TListBox;
    MnuMigracao: TAction;
    ActionList1: TActionList;
    NbMenu: TNotebook;
    Page1: TPage;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    PnlSair: TPanel;
    PnlMenu: TPanel;
    PnlOpcao: TPanel;
    PnlTitulo: TPanel;
    SpdBtnFechar: TSpeedButton;
    SpdBtnMaximizar: TSpeedButton;
    SpdBtnMinimizar: TSpeedButton;
    SpdBtnMenu: TSpeedButton;
    SpdBtnSair1: TSpeedButton;
    SpdBtnEstoque: TSpeedButton;
    SpdBtnConfiguracao: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    procedure BtnCarregarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure LstBxSubMenuDblClick(Sender: TObject);
    procedure MnuMigracaoExecute(Sender: TObject);
    procedure PnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure PnlTituloMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
    procedure SpdBtnEstoqueClick(Sender: TObject);
    procedure SpdBtnMaximizarClick(Sender: TObject);
    procedure SpdBtnMenuClick(Sender: TObject);
    procedure SpdBtnMinimizarClick(Sender: TObject);
    procedure SpdBtnSair1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpdBtnConfiguracaoClick(Sender: TObject);
  protected
  private
    HashListPage: TFPHashList;
    ListaDll: TStringList;
    px, py: integer;
    procedure IniciarMenu;
    function ObterTamanhoBarraTarefa: integer;
    procedure AjustarTamanhoPnlMenu;
    procedure CarregarDll(pNomeDll: string; pPage: TPage);
    procedure AjustarTamanhoPaginas;

  public
  end;


const
  LTamanho_Padrao = 24;

var
  ViewMenu: TViewMenu;

implementation

{$R *.lfm}


{ TRound }

class procedure TRound.Arredondamento(const AControls: TWinControl; const ARadius: integer);
var
  ABitmap: TBitmap;
begin
  try
    ABitmap := TBitmap.Create;
    ABitmap.Monochrome := True;
    ABitmap.Width := AControls.Width;
    ABitmap.Height := AControls.Height;
    with ABitmap.canvas do
    begin
      roundrect(0, 0, AControls.Width, AControls.Height, ARadius, ARadius);
      AControls.SetShape(ABitmap);
    end;
  finally
    ABitmap.Free;
  end;

end;

{ TViewMenu }
procedure TViewMenu.MnuMigracaoExecute(Sender: TObject);
var
  LPastaMigracao: string;
  F: TForm;
  L: TListBox;
  s: string;
  B: TButton;
begin
  LPastaMigracao := ExtractFilePath(ParamStr(0)) + 'atualizacao_banco';
  if not DirectoryExists(LPastaMigracao) then
    ForceDirectories(LPastaMigracao);
  ModelMigracao := nil;
  if not Assigned(ModelMigracao) then
    ModelMigracao := TModelMigracao.Create(Self);
  try
    s := ModelMigracao.ExecutarMigrations(ModelConexao.ibConexao, ModelConexao.SQLTrans, LPastaMigracao);
    if s <> '' then
    begin
      F := TViewMenu.Create(self);
      F.color := clWhite;
      f.BorderStyle := bsSingle;
      f.BorderWidth := 5;
      F.BorderIcons := [];
      f.Caption := 'Migracoes aplicadas';
      F.Font.Name := 'Segoe UI';
      F.Font.Size := 12;
      F.Height := 500;
      F.Width := 300;
      F.Position := poMainFormCenter;
      B := TButton.Create(f);
      B.Parent := f;
      B.Align := alBottom;
      B.Caption := 'Fechar';
      B.ModalResult := mrClose;
      L := TListBox.Create(f);
      L.Parent := f;
      L.Align := alClient;
      L.Items.Text := s;
      F.ShowModal;
      FreeAndNil(f);
    end;
  finally
    ModelMigracao.Free;
  end;
end;

procedure TViewMenu.PnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  px := x;
  py := y;
end;

procedure TViewMenu.PnlTituloMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
begin
  if tag = 2 then
    if ssLeft in Shift then
      with TForm(GetTopParent) do
      begin
        left := mouse.CursorPos.X - px;
        top := mouse.CursorPos.Y - py;
      end;
  inherited MouseMove(Shift, X, Y);
end;

procedure TViewMenu.SpdBtnEstoqueClick(Sender: TObject);
begin
  LstBxSubMenu.Items.Clear;
  LstBxSubMenu.Height := 1;
  LstBxSubMenu.Left := PnlOpcao.Left + PnlOpcao.Width;
  LstBxSubMenu.Top := SpdBtnEstoque.Top + PnlMenu.Height;
  LstBxSubMenu.Visible := True;

  LstBxSubMenu.Items.Add('Produtos');
  LstBxSubMenu.Height := LstBxSubMenu.Height + LTamanho_Padrao;

  LstBxSubMenu.Items.Add('Marcas');
  LstBxSubMenu.Height := LstBxSubMenu.Height + LTamanho_Padrao;

  LstBxSubMenu.Items.Add('Unidades');
  LstBxSubMenu.Height := LstBxSubMenu.Height + LTamanho_Padrao;

  LstBxSubMenu.Items.Add('Ajustes de Estoque');
  LstBxSubMenu.Height := LstBxSubMenu.Height + LTamanho_Padrao;

end;

procedure TViewMenu.SpdBtnMaximizarClick(Sender: TObject);
begin
  if Self.WindowState = wsMaximized then
    Self.WindowState := wsNormal
  else
    Self.WindowState := wsMaximized;
end;

procedure TViewMenu.SpdBtnMenuClick(Sender: TObject);
begin
  if PnlOpcao.Width <= 109 then
    PnlOpcao.Width := 200
  else
    PnlOpcao.Width := 109;

  AjustarTamanhoPnlMenu;
end;

procedure TViewMenu.SpdBtnMinimizarClick(Sender: TObject);
begin
  Self.WindowState := wsMinimized;
end;

procedure TViewMenu.SpdBtnSair1Click(Sender: TObject);
begin
  Close;
end;

procedure TViewMenu.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TViewMenu.SpdBtnConfiguracaoClick(Sender: TObject);
begin
  LstBxSubMenu.Items.Clear;
  LstBxSubMenu.Height := 1;
  LstBxSubMenu.Left := PnlOpcao.Left + PnlOpcao.Width;
  LstBxSubMenu.Top := SpdBtnConfiguracao.Top + PnlMenu.Height;
  LstBxSubMenu.Visible := True;

  LstBxSubMenu.Items.Add('Usuários');
  LstBxSubMenu.Height := LstBxSubMenu.Height + LTamanho_Padrao;

  LstBxSubMenu.Items.Add('Programas');
  LstBxSubMenu.Height := LstBxSubMenu.Height + LTamanho_Padrao;

  LstBxSubMenu.Items.Add('Configuração Geral');
  LstBxSubMenu.Height := LstBxSubMenu.Height + LTamanho_Padrao;

  LstBxSubMenu.Items.Add('Configurações Usuário');
  LstBxSubMenu.Height := LstBxSubMenu.Height + LTamanho_Padrao;

end;

procedure TViewMenu.IniciarMenu;
begin
  {ObterTamanhoBarraTarefa;
  Self.Width := Screen.Width;
  Self.Height := Screen.Height - 48; }
  Self.BorderStyle := bsNone;

  PnlMenu.Color := PnlOpcao.Color;
  PnlSair.Color := PnlOpcao.Color;

  PnlMenu.Width := PnlOpcao.Width;

 { PnlMenu.Width := PnlOpcao.Width;

  Self.Top := 0;
  Self.Left := 0;  }
end;

function TViewMenu.ObterTamanhoBarraTarefa: integer;
var
  r: TRect;
  screenWidth, screenHeight: integer;
  taskbarHeight: integer;
begin
  SystemParametersInfo(SPI_GETWORKAREA, 0, @r, 0);

  screenWidth := GetSystemMetrics(SM_CXSCREEN);
  screenHeight := GetSystemMetrics(SM_CYSCREEN);

  // Comparando com a área de trabalho para descobrir a posição da barra de tarefas
  if r.Bottom < screenHeight then
    taskbarHeight := screenHeight - r.Bottom  // barra embaixo
  else if r.Top > 0 then
    taskbarHeight := r.Top                    // barra em cima
  else if r.Left > 0 then
    taskbarHeight := r.Left                   // barra à esquerda
  else if r.Right < screenWidth then
    taskbarHeight := screenWidth - r.Right    // barra à direita
  else
    taskbarHeight := 0; // barra oculta ou em modo automático

end;

procedure TViewMenu.AjustarTamanhoPnlMenu;
begin
  PnlMenu.Width := PnlOpcao.Width;
end;

procedure TViewMenu.CarregarDll(pNomeDll: string; pPage: TPage);
var
  DLLHandle: THandle;
  ShowFormInParent: TShowFormInParent;
  AjusteTamanhoParent: TAjusteTamanhoParent;
  ScrBxDesktop: TScrollBox;
begin
  DLLHandle := LoadLibrary('CadUsuarios.dll');
  if DLLHandle = 0 then
  begin
    ShowMessage('Erro ao carregar DLL CadUsuarios.dll ');
    Exit;
  end;
  @ShowFormInParent := GetProcAddress(DLLHandle, 'ShowFormInParent');
  if not Assigned(ShowFormInParent) then
  begin
    ShowMessage('Função ShowFormInParent não encontrada na  dll CadUsuarios.dll');
    Exit;
  end;

  // Passa o handle do TPanel
  ScrBxDesktop := TScrollBox.Create(pPage);
  ScrBxDesktop.Parent := pPage;
  ScrBxDesktop.Align := alClient;
  ScrBxDesktop.Name := 'ScrBxCadUsusario';
  ShowFormInParent(ScrBxDesktop.Handle);

  // Pegar a Funcao para Ajustar o tamanho
  @AjusteTamanhoParent := GetProcAddress(DLLHandle, 'AjusteTamanhoParent');
  if not Assigned(AjusteTamanhoParent) then
  begin
    ShowMessage('Função AjusteTamanhoParent não encontrada na  dll CadUsuarios.dll');
    Exit;
  end;
  AjusteTamanhoParent(0, 0, ScrBxDesktop.Height, ScrBxDesktop.Width);
  ListaDll.Add(pNomeDll);
end;

procedure TViewMenu.AjustarTamanhoPaginas;
var
  DLLHandle: THandle;
  AjusteTamanhoParent: TAjusteTamanhoParent;
  i : Integer;
  ScrBxDesktop : TScrollBox;
begin

  For i := 0 To ListaDll.Count - 1 do
  begin

    DLLHandle := LoadLibrary('CadUsuarios.dll');
    if DLLHandle = 0 then
    begin
      ShowMessage('Erro ao carregar DLL CadUsuarios.dll ');
      Exit;
    end;

    // Pegar a Funcao para Ajustar o tamanho
    @AjusteTamanhoParent := GetProcAddress(DLLHandle, 'AjusteTamanhoParent');
    if not Assigned(AjusteTamanhoParent) then
    begin
      ShowMessage('Função AjusteTamanhoParent não encontrada na  dll CadUsuarios.dll');
      Exit;
    end;
    ScrBxDesktop := TScrollBox(PAge1.FindChildControl('ScrBxCadUsusario'));
    AjusteTamanhoParent(0, 0, ScrBxDesktop.Height, ScrBxDesktop.Width);

  end;
end;

procedure TViewMenu.BtnCarregarClick(Sender: TObject);
var
  DLLHandle: THandle;
  ShowFormInParent: TShowFormInParent;
  AjusteTamanhoParent: TAjusteTamanhoParent;
begin
 { DLLHandle := LoadLibrary('DllFormularioEmbedado.dll');
  if DLLHandle = 0 then
  begin
    ShowMessage('Erro ao carregar DLL');
    Exit;
  end;
  @ShowFormInParent := GetProcAddress(DLLHandle, 'ShowFormInParent');
  if not Assigned(ShowFormInParent) then
  begin
    ShowMessage('Função não encontrada');
    Exit;
  end;

  // Passa o handle do TPanel
  ShowFormInParent(ScrBxDesktop.Handle);

  // Pegar a Funcao para Ajustar o tamanho
  @AjusteTamanhoParent := GetProcAddress(DLLHandle, 'AjusteTamanhoParent');
  if not Assigned(AjusteTamanhoParent) then
  begin
    ShowMessage('Função AjusteTamanhoParent não encontrada');
    Exit;
  end;
  AjusteTamanhoParent(0, 0, ScrBxDesktop.Height, ScrBxDesktop.Width);
  }
end;

procedure TViewMenu.FormCreate(Sender: TObject);
begin
  IniciarMenu;
  ListaDll := TStringList.Create;

end;

procedure TViewMenu.FormDestroy(Sender: TObject);
begin
  ListaDll.Free;
end;

procedure TViewMenu.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  DLLHandle: THandle;
  FormKeyUp: TFormKeyUp;
  i : Integer;
begin
    DLLHandle := LoadLibrary('CadUsuarios.dll');
    if DLLHandle = 0 then
    begin
      ShowMessage('Erro ao carregar DLL CadUsuarios.dll ');
      Exit;
    end;

    // Pegar a Funcao de KeyUp
    @FormKeyUp := GetProcAddress(DLLHandle, 'FormKeyUp');
    if not Assigned(FormKeyUp) then
    begin
      ShowMessage('Função FormKeyUp não encontrada na  dll CadUsuarios.dll');
      Exit;
    end;
    FormKeyUp(Sender,Key,Shift);
end;

procedure TViewMenu.FormResize(Sender: TObject);
begin
  AjustarTamanhoPaginas;
end;

procedure TViewMenu.LstBxSubMenuDblClick(Sender: TObject);
begin
  ShowMessage('Chamar a Opcao');
  if LstBxSubMenu.Items[LstBxSubMenu.ItemIndex] = 'Usuários' then
    CarregarDll('CadUsuarios.dll', PAge1);
  LstBxSubMenu.Visible := False;
  PnlOpcao.Width := 109;
  AjustarTamanhoPnlMenu;
end;

end.
