unit view_duosig_pdv_autotomatico;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons, DBGrids, ubarcodes, RxDBGrid, BCButton, bufdataset,
  BCMaterialDesignButton, BCSVGButton, utils_funcoes, DB, model_duosig_pdv;

type

  { TViewDuosigPdvAutomatico }

  TViewDuosigPdvAutomatico = class(TForm)
    BarcodeQR: TBarcodeQR;
    BCButton1: TBCButton;
    BtnCredito: TBCButton;
    BtnDebito: TBCButton;
    BtnPagar: TBCButton;
    BtnPaginaAnterior: TBCButton;
    BtnPix: TBCButton;
    BtnProximaPagina: TBCButton;
    DtSrcProdutos: TDataSource;
    EdtNumOrcamento: TEdit;
    EdtNumOrcamentoEscondido: TEdit;
    EdtVlrOrcamento: TEdit;
    Image: TImage;
    Image1: TImage;
    ImgVoltar: TImage;
    LblInstrucaoPagamento: TLabel;
    LblNumOrcamentoBase: TLabel;
    LblTituloProduto: TLabel;
    LblVlrOrcamento: TLabel;
    LblVlrPagar: TLabel;
    LblTitulo: TLabel;
    LblNumOrcamento: TLabel;
    LblTitVlrPagar: TLabel;
    LblEscolhaFormaPagamento: TLabel;
    Nb: TNotebook;
    PnlBotoesPagto: TPanel;
    PgIniciar: TPage;
    PnlFormaPagto: TPanel;
    PnlTituloProduto: TPanel;
    Panel3: TPanel;
    PnlTotalizador: TPanel;
    PgPagamento: TPage;
    PgPrincipal: TPage;
    PnlTitulo: TPanel;
    PnlNumVlrOrcamento: TPanel;
    PnlRodape: TPanel;
    DBGrdProduto: TRxDBGrid;
    ShpEdtNumOrcamento: TShape;
    ShpEdtVlrOrcamento: TShape;
    ShpEdtVlrPagar: TShape;
    procedure BtnCreditoClick(Sender: TObject);
    procedure BtnDebitoClick(Sender: TObject);
    procedure BtnPagarClick(Sender: TObject);
    procedure BtnPaginaAnteriorClick(Sender: TObject);
    procedure BtnPixClick(Sender: TObject);
    procedure BtnProximaPaginaClick(Sender: TObject);
    procedure DtSrcProdutosDataChange(Sender: TObject; Field: TField);
    procedure EdtNumOrcamentoEscondidoChange(Sender: TObject);
    procedure EdtNumOrcamentoEscondidoKeyDown(Sender: TObject;
      var Key: word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ImgVoltarClick(Sender: TObject);
    procedure PnlBtnDebitoClick(Sender: TObject);
    procedure PnlBtnPixClick(Sender: TObject);
  private
    FModelDuosigPdv: TModelDuosigPdv;
    procedure ConfigurarPnlNumOrcamento;
    procedure ConfigurarDBGrid;
    procedure ConfigurarTotalizador;
    procedure ConfigurarCheckout;
    procedure SetModelDuosigPdv(AValue: TModelDuosigPdv);
    procedure MostrarBotaoProximaPagina;
  public

    property ModelDuosigPdv: TModelDuosigPdv
      read FModelDuosigPdv write SetModelDuosigPDv;
  end;


const
  _Cor_Label = $00ACAC00;

var
  ViewDuosigPdvAutomatico: TViewDuosigPdvAutomatico;

implementation

{$R *.lfm}

{ TViewDuosigPdvAutomatico }

procedure TViewDuosigPdvAutomatico.EdtNumOrcamentoEscondidoChange(Sender: TObject);
begin
  EdtNumOrcamento.Text := EdtNumOrcamentoEscondido.Text;
end;

procedure TViewDuosigPdvAutomatico.EdtNumOrcamentoEscondidoKeyDown(Sender: TObject;
  var Key: word; Shift: TShiftState);
begin
  if Key = 13 then
  begin
    LblTituloProduto.Caption := ' AGUARDE .....';
    try
      EdtVlrOrcamento.Text := 'R$' + FormatFloat('###,###,##0.00',
        ModelDuosigPdv.ObterOrcamento(StrToIntDef(EdtNumOrcamento.Text, 0)));
      MostrarBotaoProximaPagina;

    finally
      LblTituloProduto.Caption := 'Produtos'
    end;
  end;
end;

procedure TViewDuosigPdvAutomatico.BtnPagarClick(Sender: TObject);
begin
  application.ProcessMessages;
  BarcodeQR.Visible := False;
  Image.Visible := False;
  LblVlrPagar.Caption := EdtVlrOrcamento.Text;
  LblInstrucaoPagamento.Caption := '';
  Nb.PageIndex := 1;

end;

procedure TViewDuosigPdvAutomatico.BtnCreditoClick(Sender: TObject);
begin
  application.ProcessMessages;
  BarcodeQR.Visible := False;
  Image.Visible := true;
  LblInstrucaoPagamento.Caption :=  'Siga as instruções do PinPad';
end;

procedure TViewDuosigPdvAutomatico.BtnDebitoClick(Sender: TObject);
begin
  application.ProcessMessages;
  BarcodeQR.Visible := False;
  Image.Visible := true;
  LblInstrucaoPagamento.Caption :=  'Siga as instruções do PinPad';
end;

procedure TViewDuosigPdvAutomatico.BtnPaginaAnteriorClick(Sender: TObject);
var
  I, PageSize: integer;
begin
  PageSize := 11;
  for I := 1 to PageSize do
    if not DtSrcProdutos.DataSet.BOF then
      DtSrcProdutos.DataSet.Prior
    else
      BtnPaginaAnterior.Visible := False;

  MostrarBotaoProximaPagina;
end;

procedure TViewDuosigPdvAutomatico.BtnPixClick(Sender: TObject);
begin
    application.ProcessMessages;
  BarcodeQR.Visible := true;
  Image.Visible := false;
    LblInstrucaoPagamento.Caption :=  'Abra o aplicativo do banco e escaneio o QrCode';
end;

procedure TViewDuosigPdvAutomatico.BtnProximaPaginaClick(Sender: TObject);
var
  I, PageSize: integer;
begin
  BtnPaginaAnterior.Visible := True;
  PageSize := 11;
  for I := 1 to PageSize do
    if not DtSrcProdutos.DataSet.EOF then
      DtSrcProdutos.DataSet.Next
    else
      BtnProximaPagina.Visible := False;
end;

procedure TViewDuosigPdvAutomatico.DtSrcProdutosDataChange(Sender: TObject;
  Field: TField);
begin
  if DtSrcProdutos.DataSet.RecordCount > 0 then
    BtnPagar.Visible := True
  else
    BtnPagar.Visible := False;
end;

procedure TViewDuosigPdvAutomatico.FormCreate(Sender: TObject);
begin
  FModelDuosigPdv := TModelDuosigPdv.Create(Self);
  BtnPagar.Visible := False;
end;

procedure TViewDuosigPdvAutomatico.FormResize(Sender: TObject);
var
  LBloco: integer;
begin
  LblTitulo.Font.Color := _Cor_Label;
  LblTitVlrPagar.Font.Color := LblTitulo.Font.Color;
  LblVlrOrcamento.Font.Color := LblTitulo.Font.Color;
  LblEscolhaFormaPagamento.Font.Color := LblTitulo.Font.Color;
  LblNumOrcamento.Font.Color := LblTitulo.Font.Color;
  LblVlrPagar.Font.Color := LblTitulo.Font.Color;
  EdtNumOrcamento.Font.Color := LblTitulo.Font.Color;
  EdtVlrOrcamento.Font.Color := LblTitulo.Font.Color;

  ShpEdtVlrOrcamento.Pen.Color := LblTitulo.Font.Color;
  ShpEdtNumOrcamento.Pen.Color := LblTitulo.Font.Color;

  ShpEdtVlrPagar.Pen.Color := LblTitulo.Font.Color;

  LblTituloProduto.Font.Color := LblTitulo.Font.Color;


  ConfigurarPnlNumOrcamento;
  ConfigurarDBGrid;
  ConfigurarTotalizador;
  ConfigurarCheckout;

end;

procedure TViewDuosigPdvAutomatico.FormShow(Sender: TObject);
begin
  FormResize(Sender);
end;

procedure TViewDuosigPdvAutomatico.ImgVoltarClick(Sender: TObject);
begin
  Nb.PageIndex := 0;
end;

procedure TViewDuosigPdvAutomatico.PnlBtnDebitoClick(Sender: TObject);
begin
  Image.Visible := True;
  BarcodeQR.Visible := False;
end;

procedure TViewDuosigPdvAutomatico.PnlBtnPixClick(Sender: TObject);
begin
  Image.Visible := False;
  BarcodeQR.Visible := True;
end;

procedure TViewDuosigPdvAutomatico.ConfigurarPnlNumOrcamento;
var
  LBloco: integer;
begin

  PnlTitulo.BevelOuter := bvNone;
  PnlNumVlrOrcamento.BevelOuter := bvNone;
  PnlTituloProduto.BevelOuter := bvNone;

  LBloco := (PnlNumVlrOrcamento.Width - (LblNumOrcamento.Width + 20 +
    ShpEdtNumOrcamento.Width)) div 2;
  LblNumOrcamento.Left := LBloco;
  ShpEdtNumOrcamento.Left := LblNumOrcamento.Left + LblNumOrcamento.Width + 20;

  EdtNumOrcamento.LEft := ShpEdtNumOrcamento.Left + 10;
  EdtNumOrcamento.Width := ShpEdtNumOrcamento.Width - 20;
  EdtNumOrcamento.Top := ShpEdtNumOrcamento.Top + 5;
  EdtNumOrcamento.BorderStyle := bsNone;

end;

procedure TViewDuosigPdvAutomatico.ConfigurarDBGrid;
begin

  DBGrdProduto.Columns.ColumnByFieldname('DCRPRD').Width := DBGrdProduto.Width - 364;
  DBGrdProduto.BorderStyle := bsNone;
  DBGrdProduto.Options := [];
  DBGrdProduto.Font.Color := LblTitulo.Font.Color;
  DBGrdProduto.Columns[0].Font.Color := LblTitulo.Font.Color;
  DBGrdProduto.Columns[1].Font.Color := LblTitulo.Font.Color;
end;

procedure TViewDuosigPdvAutomatico.ConfigurarTotalizador;
begin

  EdtVlrOrcamento.Left := ShpEdtVlrOrcamento.Left + 7;
  EdtVlrOrcamento.Width := ShpEdtVlrOrcamento.Width - 30;
  EdtVlrOrcamento.Top := ShpEdtVlrOrcamento.Top + 10;
  EdtVlrOrcamento.BorderStyle := bsNone;

end;

procedure TViewDuosigPdvAutomatico.ConfigurarCheckout;
begin

  LblVlrPagar.Left := ShpEdtVlrPagar.Left + 20;
  ImgVoltar.Top := Self.Height - ImgVoltar.Height;
  ImgVoltar.Left := 1;
  BarcodeQR.Left := (Self.Width - BarcodeQR.Width) div 2;
  Image.Left := (Self.Width - Image.Width) div 2;
  PnlBotoesPagto.Left := (Self.Width - PnlBotoesPagto.Width) div 2;
  PnlBotoesPagto.BevelOuter := bvNone;

end;


procedure TViewDuosigPdvAutomatico.SetModelDuosigPdv(AValue: TModelDuosigPdv);
begin
  if FModelDuosigPdv = AValue then Exit;
  FModelDuosigPdv := AValue;
end;

procedure TViewDuosigPdvAutomatico.MostrarBotaoProximaPagina;
begin
  if DtSrcProdutos.DataSet.RecordCount > 11 then
    BtnProximaPagina.Visible := True;

end;


end.
