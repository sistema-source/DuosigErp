unit view_pai;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TViewPai }

  TViewPai = class(TForm)
    LblTitulo: TLabel;
  private

  protected


  public
    procedure Preparar;


  end;

var
  ViewPai: TViewPai;

implementation

{$R *.lfm}

{ TViewPai }

procedure TViewPai.Preparar;
begin

end;

end.
