unit view_dll_exemplo;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  TNotifyFormClosed = procedure(FormHandle: Pointer); stdcall;

  { TFormDll }

  TFormDll = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public
  procedure Preparar;
  end;

var
  FormDll: TFormDll;

implementation

{$R *.lfm}

{ TFormDll }

procedure TFormDll.Button1Click(Sender: TObject);
begin
  ShowMEssage('atonadsf');
end;

procedure TFormDll.Button2Click(Sender: TObject);
begin
    ShowMEssage('atonadsffim fim ');
    SElf.Visible := false;
end;

procedure TFormDll.Preparar;
begin
  Self.Caption := 'etasedta';
end;

end.
