program DuosigErpCase;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcomponent, view_principal, teclas_funcao, utils_funcoes, model_sessao,
  model_pai, view_cadastro, view_pai, view_duosigcaseerp, model_conexao_sqlite,
  model_case
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TViewCadDuosiCaseErp, ViewCadDuosiCaseErp);
  Application.CreateForm(TModelConexaoSQLite, ModelConexaoSQLite);
  Application.CreateForm(TModelCase, ModelCase);
  Application.Run;
end.

