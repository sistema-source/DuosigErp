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
  Forms, zcomponent, rxnew, view_duosig_pdv_autotomatico, utils_funcoes, model_duosig_pdv, model_nfe, vo_nfe, model_052, model_conexao
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled := True;
  Application.Initialize;
  Application.CreateForm(TViewDuosigPdvAutomatico, ViewDuosigPdvAutomatico);
  Application.Run;
end.

