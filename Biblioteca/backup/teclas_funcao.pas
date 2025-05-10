unit teclas_funcao;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TTeclas }

  TTeclas = class
    class function Tecla_Esc: word;
    class function Tecla_F2: word;
    class function Tecla_F3: word;
    class function Tecla_F4: word;
    class function Tecla_F5: word;
    class function Tecla_F6: word;

  end;

implementation

{ TTeclas }


class function TTeclas.Tecla_Esc: word;
begin
  Result := 27;
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

end.
