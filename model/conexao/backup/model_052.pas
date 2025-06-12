unit model_052;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZDataset, model_conexao, bufDataSet;

type

  { TModel052 }

  TModel052 = class(TDataModule)
    Qry052: TZQuery;
    Qry053: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FModelConexao: TModelConexao;
    procedure SetModelConexao(AValue: TModelConexao);
  public
    function PopularDados(pTbl: TBufDataset; pNumOrcamento : Integer): currency;
    property ModelConexao: TModelConexao read FModelConexao write SetModelConexao;
  end;


implementation


{$R *.lfm}

{ TModel052 }

procedure TModel052.DataModuleCreate(Sender: TObject);
begin
  FModelConexao := TModelConexao.Create(Self);
  Qry052.Connection := ModelConexao.Conexao;
  Qry053.Connection := Qry052.Connection;
end;

procedure TModel052.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(FModelConexao) then
    FModelConexao.Free;
end;

procedure TModel052.SetModelConexao(AValue: TModelConexao);
begin
  if FModelConexao = AValue then Exit;
  FModelConexao := AValue;
end;

function TModel052.PopularDados(pTbl: TBufDataset; pNumOrcamento : Integer): currency;
var
  s, FieldName: string;
  i, LOrdem: integer;
begin
  s := ' SELECT S052.NUMORC, S052.CODLJA, S052.vlrtotorc, S052.dtaorc,  S052.cgccpfcli, '
    + ' S053.CODPRD, S053.vlrtotprd, S053.QTDPRD, ' +
    ' S034.DCRPRD FROM SINAF052 S052 ' +
    ' LEFT JOIN SINAF053 S053 ON S053.EMPGRP = S052.EMPGRP AND S053.CODLJA = S052.CODLJA AND S053.NUMORC = S052.NUMORC '
    + ' LEFT JOIN SINAF034 S034 ON S034.CODPRD = S053.CODPRD ' +
    ' WHERE S053.EMPGRP = :pEmpGrp AND S052.CODLJA = :pCodLja AND S052.NUMORC  = :pNumOrc ';

  Qry052.Close;
  Qry052.SQL.Text := s;
  QRY052.ParamByName('pEmpGrp').AsString :=  '01';
  QRY052.ParamByName('pCodLja').AsString :=  '01';
  QRY052.ParamByName('pNumOrc').AsInteger :=  pNumOrcamento;

  Qry052.Open;

  pTbl.Active := False;
  pTbl.Active := True;

  LOrdem := 1;
  while not Qry052.EOF do
  begin
    pTbl.Append;
    for i := 0 to Qry052.FieldCount - 1 do
    begin
      FieldName := Qry052.Fields[i].FieldName;
      pTbl.FieldByName(FieldName).AsString := Qry052.FieldByName(FieldName).AsString;
    end;
    pTbl.FieldByName('ORDGRVPRD').AsInteger := LOrdem;
    Inc(LOrdem);
    pTbl.Post;
    Qry052.Next;

  end;
  Result := Qry052.FieldByName('VLRTOTORC').AsCurrency;
end;

end.
