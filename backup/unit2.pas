unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type
  TForm2 = class(TForm)
  private

  public
    property Msg : TNotifyEvent;

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

end.

