library DuosigErpDll_001;
uses
  Interfaces, // obrigatório para Lazarus GUI
  Forms, Windows, Controls, Dialogs,
   view_pai, view_cadastro, view_cad_usuario;

{$R *.res}

procedure ShowFormInParent(AParent: HWND); stdcall;
begin
  if not Assigned(ViewCadUsuario) then
  begin
    Application.Initialize;
    Application.CreateForm(TFormDll, FormDll);
    FormDll.LEft := 0;
    FormDll.Top := 0;
    FormDll.BorderStyle := bsNone;
    FormDll.Visible := False;
    FormDll.HandleNeeded;
    SetParent(FormDll.Handle, AParent);
    SetWindowLong(FormDll.Handle, GWL_STYLE,
      GetWindowLong(FormDll.Handle, GWL_STYLE) and not WS_POPUP or WS_CHILD);
    FormDll.Preparar;
    FormDll.Align := alClient;
    FormDll.Visible := True;
  end;
end;

procedure AjusteTamanhoParent(pLeft, pTop, pHeigh, pWidth : Integer); stdcall;
begin
  if Assigned(FormDll) then
  begin
    FormDll.Left := pLeft;
    FormDll.Top := pTop;
    FormDll.Height:= pHeigh;
    FormDll.Width:= pWidth;
  end;
end;

exports
  ShowFormInParent,
  AjusteTamanhoParent;

begin
end.
