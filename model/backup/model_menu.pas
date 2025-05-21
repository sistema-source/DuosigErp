unit model_menu;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, model_pai;

type

  { TModelMenu }

  TModelMenu = class(TModelPai)
  private

  public

    function ObterListaMenu(pIdGrupo: string): string;
  end;


implementation

{$R *.lfm}

{ TModelMenu }

function TModelMenu.ObterListaMenu(pIdGrupo: string): string;
begin

end;

end.
