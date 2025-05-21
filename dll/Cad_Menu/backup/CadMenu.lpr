library CadMenu;

{$mode objfpc}{$H+}




uses
  Classes,
  Interfaces, // obrigatório para Lazarus GUI
  Forms,
  Windows,
  Controls,
  Dialogs, LCLProc, ComCtrls, view_cad_menu, view_cadastro, view_pai, vo_menu, model_pai, model_menu, teclas_funcao, model_api;


procedure ShowFormInParent(AParent: HWND); stdcall;
begin
  if not Assigned(ViewCadMenu) then
  begin
    Application.Initialize;
    Application.CreateForm(TViewCadMenu, ViewCadMenu);
    ViewCadMenu.LEft := 0;
    ViewCadMenu.Top := 0;
    ViewCadMenu.BorderStyle := bsNone;
    ViewCadMenu.Visible := False;
    ViewCadMenu.HandleNeeded;
    SetParent(ViewCadMenu.Handle, AParent);
    SetWindowLong(ViewCadMenu.Handle, GWL_STYLE,
      GetWindowLong(ViewCadMenu.Handle, GWL_STYLE) and not WS_POPUP or WS_CHILD);
    ViewCadMenu.Preparar;
    ViewCadMenu.Align := alClient;
    ViewCadMenu.Visible := True;
  end;
end;

procedure AjusteTamanhoParent(pLeft, pTop, pHeigh, pWidth : Integer); stdcall;
begin
  if Assigned(ViewCadMenu) then
  begin
    ViewCadMenu.Left := pLeft;
    ViewCadMenu.Top := pTop;
    ViewCadMenu.Height:= pHeigh;
    ViewCadMenu.Width:= pWidth;
  end;
end;

procedure FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState); stdcall;
begin
  if Assigned(ViewCadMenu) then
  begin
    ViewCadMenu.FormKeyUp(Sender, key, Shift);
  end;
end;



exports
  ShowFormInParent,
  AjusteTamanhoParent,
  FormKeyUp;



begin
end.
