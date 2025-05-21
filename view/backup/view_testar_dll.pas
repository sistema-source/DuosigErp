unit view_testar_dll;

{$mode objfpc}{$H+}

interface

uses
  Windows, Classes, SysUtils, Forms, Controls, Graphics, Dialogs;



  type
    TShowFormInParent = procedure(AParent: HWND); stdcall;
    TAjusteTamanhoParent = procedure(pLeft, pTop, pHeigh, pWidth: integer); stdcall;
    TFormKeyUp = procedure(Sender: TObject; var Key: Word; Shift: TShiftState); stdcall;

  { TViewTestarDll }

  TViewTestarDll = class(TForm)
    ScrollBox1: TScrollBox;
    procedure ScrollBox1Click(Sender: TObject);
  private

  public

  end;

var
  ViewTestarDll: TViewTestarDll;

implementation

{$R *.lfm}

{ TViewTestarDll }

procedure TViewTestarDll.ScrollBox1Click(Sender: TObject);
var
  DLLHandle: THandle;
  ShowFormInParent: TShowFormInParent;
  AjusteTamanhoParent: TAjusteTamanhoParent;
begin
  DLLHandle := LoadLibrary('CadMenu.dll');
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


  ShowFormInParent(ScrollBox1.Handle);

  // Pegar a Funcao para Ajustar o tamanho
  @AjusteTamanhoParent := GetProcAddress(DLLHandle, 'AjusteTamanhoParent');
  if not Assigned(AjusteTamanhoParent) then
  begin
    ShowMessage('Função AjusteTamanhoParent não encontrada na  dll CadUsuarios.dll');
    Exit;
  end;
  AjusteTamanhoParent(0, 0, ScrollBox1.Height, ScrollBox1.Width);

end;

end.

