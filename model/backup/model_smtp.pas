unit model_smtp;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, model_pai, BufDataset,
  DB;

type

  { TModelSmtp }

  TModelSmtp = class(TModelPai)
    TblSmtp: TBufDataset;
    TblSmtpHostName: TStringField;
    TblSmtpId: TStringField;
    TblSmtpNome: TStringField;
    TblSmtpPorta: TLongintField;
    TblSmtpSSL: TLongintField;
    TblSmtpTLS: TLongintField;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure GerarDados;

  public

  end;

var
  ModelSmtp: TModelSmtp;

implementation

{$R *.lfm}

{ TModelSmtp }

procedure TModelSmtp.DataModuleCreate(Sender: TObject);
begin
  TblSmtp.CreateDataset;
  GerarDados;
  inherited;
end;

procedure TModelSmtp.GerarDados;
begin
  TblSmtp.Append;
  TblSmtpNome.AsString := 'SERVIDOR TERRA';
  TblSmtpID.AsString := '1';
  TblSmtp.Post;

end;

end.

