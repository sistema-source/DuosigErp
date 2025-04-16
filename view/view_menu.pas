unit view_menu;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ActnList, StdCtrls, model_conexao, model_migracao;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    MnuMigracao: TAction;
    ActionList1: TActionList;
    procedure MnuMigracaoExecute(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MnuMigracaoExecute(Sender: TObject);
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
      F := TForm1.Create(self);
      F.color := clWhite;
      f.BorderStyle := bsSingle;
      f.BorderWidth:= 5;
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

end.
