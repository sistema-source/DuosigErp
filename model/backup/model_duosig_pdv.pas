unit model_duosig_pdv;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, BufDataset, DB, model_052;

type

  { TModelDuosigPdv }

  TModelDuosigPdv = class(TDataModule)
    TblProdutos: TBufDataset;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FModel052: TModel052;
    procedure CriarCampos;
    procedure SetModel052(AValue: TModel052);
  public
    function ObterOrcamento(pNumOrcamento : Integer) : Currency;
    property Model052: TModel052 read FModel052 write SetModel052;
  end;

var
  ModelDuosigPdv: TModelDuosigPdv;

implementation

{$R *.lfm}

{ TModelDuosigPdv }

procedure TModelDuosigPdv.DataModuleCreate(Sender: TObject);
begin
  FModel052 := TModel052.Create(Self);
  CriarCampos;
  TblProdutos.CreateDataset;
end;

procedure TModelDuosigPdv.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(FModel052) then
    FModel052.Free;
end;

procedure TModelDuosigPdv.CriarCampos;
begin
  TblProdutos.FieldDefs.Add('EMPGRP',ftString,2);
  TblProdutos.FieldDefs.Add('CODLJA',ftString,2);
  TblProdutos.FieldDefs.Add('NUMORC',ftInteger);
  TblProdutos.FieldDefs.Add('VLRTOTORC',ftCurrency);
  TblProdutos.FieldDefs.Add('DTAORC',ftDate);
  TblProdutos.FieldDefs.Add('CGCCPFCLI',ftString,18);
  TblProdutos.FieldDefs.Add('CODPRD',ftInteger);
  TblProdutos.FieldDefs.Add('ORDGRVPRD',ftInteger);
  TblProdutos.FieldDefs.Add('VLRTOTPRD',ftCurrency);
  TblProdutos.FieldDefs.Add('QTDPRD',ftFloat);
  TblProdutos.FieldDefs.Add('DCRPRD',ftString,60);
end;

procedure TModelDuosigPdv.SetModel052(AValue: TModel052);
begin
  if FModel052 = AValue then Exit;
  FModel052 := AValue;
end;

function TModelDuosigPdv.ObterOrcamento(pNumOrcamento: Integer): Currency;
begin
  result := FModel052.PopularDados(TblProdutos, pNumOrcamento);
  TblProdutos.First;
end;

end.
