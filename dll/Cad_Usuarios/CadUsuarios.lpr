library CadUsuarios;

{$mode objfpc}{$H+}




uses
  Classes,
  Interfaces, // obrigatório para Lazarus GUI
  Forms,
  Windows,
  Controls,
  Dialogs,
  view_pai,
  view_cadastro,
  view_cad_usuario, teclas_funcao, model_pai, model_api;


procedure ShowFormInParent(AParent: HWND); stdcall;
begin
  if not Assigned(ViewCadUsuario) then
  begin
    Application.Initialize;
    Application.CreateForm(TViewCadUsuario, ViewCadUsuario);
    ViewCadUsuario.LEft := 0;
    ViewCadUsuario.Top := 0;
    ViewCadUsuario.BorderStyle := bsNone;
    ViewCadUsuario.Visible := False;
    ViewCadUsuario.HandleNeeded;
    SetParent(ViewCadUsuario.Handle, AParent);
    SetWindowLong(ViewCadUsuario.Handle, GWL_STYLE,
      GetWindowLong(ViewCadUsuario.Handle, GWL_STYLE) and not WS_POPUP or WS_CHILD);
    ViewCadUsuario.Preparar;
    ViewCadUsuario.Align := alClient;
    ViewCadUsuario.Visible := True;
  end;
end;

procedure AjusteTamanhoParent(pLeft, pTop, pHeigh, pWidth : Integer); stdcall;
begin
  if Assigned(ViewCadUsuario) then
  begin
    ViewCadUsuario.Left := pLeft;
    ViewCadUsuario.Top := pTop;
    ViewCadUsuario.Height:= pHeigh;
    ViewCadUsuario.Width:= pWidth;
  end;
end;

procedure FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState); stdcall;
begin
  if Assigned(ViewCadUsuario) then
  begin
    ViewCadUsuario.FormKeyUp(Sender, key, Shift);
  end;
end;



exports
  ShowFormInParent,
  AjusteTamanhoParent,
  FormKeyUp;



begin
end.
