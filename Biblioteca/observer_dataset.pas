unit observer_dataset;

{$mode ObjFPC}{$H+}

interface
uses db;

type

  // Interface para o Observador
  IObserver = interface
    ['{3E864AE3-195A-4125-B119-D356F4BB9909}'] // Gere seu próprio GUID
    procedure Update(Sender: TObject); // Método chamado pelo Subject para notificar
  end;

  // Interface para o Sujeito (Observável)
  ISubject = interface
    ['{296550FE-0F54-4436-9AA8-54B538E6613D}']// Gere seu próprio GUID
    procedure NotifyObservers;
  end;

implementation

end.
