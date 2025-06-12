program DuosigPDVCliente;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcomponent, rxnew, view_duosig_pdv_autotomatico, utils_funcoes, model_duosig_pdv, model_052
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled := True;
  Application.Initialize;
  Application.CreateForm(TModelDuosigPdv, ModelDuosigPdv);
  Application.CreateForm(TModel052, Model052);
  Application.Run;
end.

