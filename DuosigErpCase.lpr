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
  Forms, rxnew, indylaz, zcomponent, teclas_funcao, utils_funcoes, model_sessao,
  model_pai, view_cadastro, view_pai, view_duosigcaseerp, model_conexao_sqlite,
  model_case, observer_dataset, view_blend, view_cad_dominio, model_conexao_api,
  model_conexao, vo_dominio, vo_tabela, vo_campo, view_animacao;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled := True;
  Application.Initialize;
  Application.CreateForm(TViewCadDuosiCaseErp, ViewCadDuosiCaseErp);
  Application.Run;
end.

