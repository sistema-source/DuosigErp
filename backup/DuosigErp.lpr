program DuosigErp;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcomponent, view_menu, model_conexao, configuracao_ini_file, model_migracao
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TModelConexao, ModelConexao);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TModelMigracao, ModelMigracao);
  Application.Run;
end.

