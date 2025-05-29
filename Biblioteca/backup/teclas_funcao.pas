unit teclas_funcao;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TTeclas }

  TTeclas = class
    class function Tecla_Esc: word;
    class function Tecla_F1: word;
    class function Tecla_F2: word;
    class function Tecla_F3: word;
    class function Tecla_F4: word;
    class function Tecla_F5: word;
    class function Tecla_F6: word;
    class function Tecla_F12: word;

  {   _F1 = 112;
      _F2 = 113;
      _F3 = 114;
      _F4 = 115;
      _F5 = 116;
      _F6 = 117;
      _F7 = 118;
      _F8 = 119;
      _F9 = 120;
      _F10 = 121;
      _F11 = 122;
      _F12 = 123;
      _ESC = 27;
      _SETA_ACIMA = 38;
      _SETA_ABAIXO  = 40;
      _ENTER = 13; }

  end;

implementation

{ TTeclas }


class function TTeclas.Tecla_Esc: word;
begin
  Result := 27;
end;

class function TTeclas.Tecla_F1: word;
begin
  result := 112;
end;

class function TTeclas.Tecla_F2: word;
begin
  result := 113;
end;

class function TTeclas.Tecla_F3: word;
begin
  result := 114;
end;

class function TTeclas.Tecla_F4: word;
begin
   result := 115;
end;

class function TTeclas.Tecla_F5: word;
begin
   result := 116;
end;

class function TTeclas.Tecla_F6: word;
begin
    result := 117;
end;

class function TTeclas.Tecla_F12: word;
begin
  result := 123;
end;

end.
