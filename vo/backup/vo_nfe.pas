unit vo_nfe;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ACBrNFe.Classes, Contnrs, pcnConversao, pcnConversaoNFe;

type

  { TNFeReferenciada }

  TNFeReferenciada = class
  private
    FAnoMes: string;
    FChaveAcessoNFeReferenciada: string;
    FCnpjCpf: string;
    FIne: string;
    Fmodelo: TpcnECFModRef;
    FModeloFiscal: string;
    FNCOO: string;
    FNumeroECF: string;
    FNumNFReferenciada: integer;
    FSerie: string;
    FUF: string;
    procedure SetAnoMes(AValue: string);
    procedure SetChaveAcessoNFeReferenciada(AValue: string);
    procedure SetCnpjCpf(AValue: string);
    procedure SetIne(AValue: string);
    procedure Setmodelo(AValue: TpcnECFModRef);
    procedure SetModeloFiscal(AValue: string);
    procedure SetNCOO(AValue: string);
    procedure SetNumeroECF(AValue: string);
    procedure SetNumNFReferenciada(AValue: integer);
    procedure SetSerie(AValue: string);
    procedure SetUF(AValue: string);
  public
    property ChaveAcessoNFeReferenciada: string
      read FChaveAcessoNFeReferenciada write SetChaveAcessoNFeReferenciada;

    property Ine: string read FIne write SetIne;
    property UF: string read FUF write SetUF;
    property AnoMes: string read FAnoMes write SetAnoMes;
    property CnpjCpf: string read FCnpjCpf write SetCnpjCpf;
    property ModeloFiscal: string read FModeloFiscal write SetModeloFiscal;
    property Serie: string read FSerie write SetSerie;
    property NumNFReferenciada: integer read FNumNFReferenciada
      write SetNumNFReferenciada;

    property NumeroECF: string read FNumeroECF write SetNumeroECF;
    property modelo: TpcnECFModRef read Fmodelo write Setmodelo;
    property NCOO: string read FNCOO write SetNCOO;
  end;

  { TVoProdutosNFe }

  TVoProdutosNFe = class
  private
    FCest: string;
    FCFOP: integer;
    FCodigo: string;
    FCodigoBarra: string;
    FCodigoBarraSemValidacao: string;
    FDescricao: string;
    FEXTPIPI: string;
    FNCM: string;
    FObsProduto: string;
    FQtdade: double;
    FUnidade: string;
    FVlrDesconto: double;
    FVlrFrete: double;
    FVlrOutrasDespesas: double;
    FVlrSeguro: double;
    FVlrUnitario: double;
    procedure SetCest(AValue: string);
    procedure SetCFOP(AValue: integer);
    procedure SetCodigo(AValue: string);
    procedure SetCodigoBarra(AValue: string);
    procedure SetCodigoBarraSemValidacao(AValue: string);
    procedure SetDescricao(AValue: string);
    procedure SetEXTPIPI(AValue: string);
    procedure SetNCM(AValue: string);
    procedure SetObsProduto(AValue: string);
    procedure SetQtdade(AValue: double);
    procedure SetUnidade(AValue: string);
    procedure SetVlrDesconto(AValue: double);
    procedure SetVlrFrete(AValue: double);
    procedure SetVlrOutrasDespesas(AValue: double);
    procedure SetVlrSeguro(AValue: double);
    procedure SetVlrUnitario(AValue: double);
  public
    property Codigo: string read FCodigo write SetCodigo;
    property CodigoBarra: string read FCodigoBarra write SetCodigoBarra;
    property Descricao: string read FDescricao write SetDescricao;
    property NCM: string read FNCM write SetNCM;
    property EXTPIPI: string read FEXTPIPI write SetEXTPIPI;
    property CFOP: integer read FCFOP write SetCFOP;
    property Unidade: string read FUnidade write SetUnidade;
    property Qtdade: double read FQtdade write SetQtdade;
    property VlrUnitario: double read FVlrUnitario write SetVlrUnitario;
    property VlrOutrasDespesas: double read FVlrOutrasDespesas
      write SetVlrOutrasDespesas;
    property VlrFrete: double read FVlrFrete write SetVlrFrete;
    property VlrSeguro: double read FVlrSeguro write SetVlrSeguro;
    property VlrDesconto: double read FVlrDesconto write SetVlrDesconto;
    property Cest: string read FCest write SetCest;
    property ObsProduto: string read FObsProduto write SetObsProduto;
    property CodigoBarraSemValidacao: string
      read FCodigoBarraSemValidacao write SetCodigoBarraSemValidacao;

    property VlrTotalImpostos: double;
    property OrigemProduto: TpcnOrigemMercadoria;
    property CstIcms: TpcnCSTIcms;
    property DeterminacaoBaseIcms: TpcnDeterminacaoBaseIcms;
    property VlrBaseIcms: double;
    property PerIcms: double;
    property VlrIcms: double;
    property DeterminacaoBaseIcmsSt: TpcnDeterminacaoBaseIcmsST;
    property PerMvaSt: double;
    property PerReducaoBaseSt: double;
    property VlrBaseIcmsSt: double;
    property PerIcmsSt: double;
    property VlrIcmsSt: double;
    property PerReducaoBaseIcms: double;
    property CstSimples : TpcnCSOSNIcms;
    property PerCreditoSimplesNacional : Double;
    property VlrIcmsStDesonerado : Double;
    property MotivoDesoneracaoIcmsSt :


  end;

  { TVoNFe }

  TVoNFe = class
  private
    FBairroDestinatario: string;
    FBairroEmitente: string;
    FBairroEntrega: string;
    FBairroRetirada: string;
    FCepDestinatario: string;
    FCepEmitente: string;
    FCNAE: string;
    FCnpjCpfDestinatario: string;
    FCnpjCpfEmitente: string;
    FCnpjCpfEntrega: string;
    FCnpjCpfRetirada: string;
    FCodIBGEDestinatario: integer;
    FCodIBGEEmitente: integer;
    FCodIbgeEntrega: string;
    FCodIbgeOrigem: integer;
    FCodIbgeRetirada: string;
    FCodMunicipioFatoGerador: string;
    FCodNumericoNFe: integer;
    FCodPaisDestinatario: integer;
    FCodPaisEmitente: integer;
    FComplementoEnderecoDestinatario: string;
    FComplementoEnderecoEmitente: string;
    FComplementoEntrega: string;
    FComplementoRetirada: string;
    FDtContingencia: TDateTime;
    FDtEmissao: TDateTime;
    FDtSaida: TDateTime;
    FEnderecoDestinatario: string;
    FEnderecoEmitente: string;
    FEnderecoEntrega: string;
    FEnderecoRetirada: string;
    FFinalidadeNFe: TpcnFinalidadeNFe;
    FFoneDestinatario: string;
    FFoneEmitente: string;
    FHrSaida: TDateTime;
    FIndicadorIntermediario: TindIntermed;
    FIneDestinatario: string;
    FIneEmitente: string;
    FIneSt: string;
    FInscMunicipal: string;
    FJustificativaContingencia: string;
    FLocalEmbarque: string;
    FModeloFiscal: integer;
    FMunicipioEntrega: string;
    FMunicipioRetirada: string;
    FNaturezaOperacao: string;
    FNFeReferenciada: TObjectList;
    FNomeDestinatario: string;
    FNomeEmitente: string;
    FNomeFantasia: string;
    FNomeMunicipioDestinatario: string;
    FNomeMunicipioEmitente: string;
    FNomePaisDestinatario: string;
    FNomePaisEmitente: string;
    FNumeroEnderecoDestinatario: string;
    FNumeroEnderecoEmitente: string;
    FNumeroEnderecoEntrega: string;
    FNumeroEnderecoRetirada: string;
    FNumNFe: integer;
    FProdutos: TObjectList;
    FSerieNF: integer;
    FSuframa: string;
    FTipoAmbiente: TpcnTipoAmbiente;
    FTipoEmissaoNFe: TpcnTipoEmissao;
    FTipoImpressaoDanfe: TpcnTipoImpressao;
    FTipoNFe: TpcnTipoNFe;
    FTipoTributacaoEmpresa: TpcnCRT;
    FUFDestinatario: string;
    FUFEmbarque: string;
    FUFEmitente: string;
    FUfEntrega: string;
    FUFFatoGerador: string;
    FUForigem: string;
    FUfRetirada: string;
    FVistaPrazoOutros: TpcnIndicadorPagamento;
    procedure SetBairroDestinatario(AValue: string);
    procedure SetBairroEmitente(AValue: string);
    procedure SetBairroEntrega(AValue: string);
    procedure SetBairroRetirada(AValue: string);
    procedure SetCepDestinatario(AValue: string);
    procedure SetCepEmitente(AValue: string);
    procedure SetCNAE(AValue: string);
    procedure SetCnpjCpfDestinatario(AValue: string);
    procedure SetCnpjCpfEmitente(AValue: string);
    procedure SetCnpjCpfEntrega(AValue: string);
    procedure SetCnpjCpfRetirada(AValue: string);
    procedure SetCodIBGEDestinatario(AValue: integer);
    procedure SetCodIBGEEmitente(AValue: integer);
    procedure SetCodIbgeEntrega(AValue: string);
    procedure SetCodIbgeOrigem(AValue: integer);
    procedure SetCodIbgeRetirada(AValue: string);
    procedure SetCodMunicipioFatoGerador(AValue: string);
    procedure SetCodNumericoNFe(AValue: integer);
    procedure SetCodPaisDestinatario(AValue: integer);
    procedure SetCodPaisEmitente(AValue: integer);
    procedure SetComplementoEnderecoDestinatario(AValue: string);
    procedure SetComplementoEnderecoEmitente(AValue: string);
    procedure SetComplementoEntrega(AValue: string);
    procedure SetComplementoRetirada(AValue: string);
    procedure SetDtContingencia(AValue: TDateTime);
    procedure SetDtEmissao(AValue: TDateTime);
    procedure SetDtSaida(AValue: TDateTime);
    procedure SetEnderecoDestinatario(AValue: string);
    procedure SetEnderecoEmitente(AValue: string);
    procedure SetEnderecoEntrega(AValue: string);
    procedure SetEnderecoRetirada(AValue: string);
    procedure SetFinalidadeNFe(AValue: TpcnFinalidadeNFe);
    procedure SetFoneDestinatario(AValue: string);
    procedure SetFoneEmitente(AValue: string);
    procedure SetHrSaida(AValue: TDateTime);
    procedure SetIndicadorIntermediario(AValue: TindIntermed);
    procedure SetIneDestinatario(AValue: string);
    procedure SetIneEmitente(AValue: string);
    procedure SetIneSt(AValue: string);
    procedure SetInscMunicipal(AValue: string);
    procedure SetJustificativaContingencia(AValue: string);
    procedure SetLocalEmbarque(AValue: string);
    procedure SetModeloFiscal(AValue: integer);
    procedure SetMunicipioEntrega(AValue: string);
    procedure SetMunicipioRetirada(AValue: string);
    procedure SetNaturezaOperacao(AValue: string);
    procedure SetNFeReferenciada(AValue: TObjectList);
    procedure SetNomeDestinatario(AValue: string);
    procedure SetNomeEmitente(AValue: string);
    procedure SetNomeFantasia(AValue: string);
    procedure SetNomeMunicipioDestinatario(AValue: string);
    procedure SetNomeMunicipioEmitente(AValue: string);
    procedure SetNomePaisDestinatario(AValue: string);
    procedure SetNomePaisEmitente(AValue: string);
    procedure SetNumeroEnderecoDestinatario(AValue: string);
    procedure SetNumeroEnderecoEmitente(AValue: string);
    procedure SetNumeroEnderecoEntrega(AValue: string);
    procedure SetNumeroEnderecoRetirada(AValue: string);
    procedure SetNumNFe(AValue: integer);
    procedure SetProdutos(AValue: TObjectList);
    procedure SetSerieNF(AValue: integer);
    procedure SetSuframa(AValue: string);
    procedure SetTipoAmbiente(AValue: TpcnTipoAmbiente);
    procedure SetTipoEmissaoNFe(AValue: TpcnTipoEmissao);
    procedure SetTipoImpressaoDanfe(AValue: TpcnTipoImpressao);
    procedure SetTipoNFe(AValue: TpcnTipoNFe);
    procedure SetTipoTributacaoEmpresa(AValue: TpcnCRT);
    procedure SetUFDestinatario(AValue: string);
    procedure SetUFEmbarque(AValue: string);
    procedure SetUFEmitente(AValue: string);
    procedure SetUfEntrega(AValue: string);
    procedure SetUFFatoGerador(AValue: string);
    procedure SetUForigem(AValue: string);
    procedure SetUfRetirada(AValue: string);
    procedure SetVistaPrazoOutros(AValue: TpcnIndicadorPagamento);
  public
    property NaturezaOperacao: string read FNaturezaOperacao write SetNaturezaOperacao;
    property VistaPrazoOutros: TpcnIndicadorPagamento
      read FVistaPrazoOutros write SetVistaPrazoOutros;
    property ModeloFiscal: integer read FModeloFiscal write SetModeloFiscal;
    property SerieNF: integer read FSerieNF write SetSerieNF;
    property NumNFe: integer read FNumNFe write SetNumNFe;
    property CodNumericoNFe: integer read FCodNumericoNFe write SetCodNumericoNFe;
    property DtEmissao: TDateTime read FDtEmissao write SetDtEmissao;
    property DtSaida: TDateTime read FDtSaida write SetDtSaida;
    property HrSaida: TDateTime read FHrSaida write SetHrSaida;
    property TipoNFe: TpcnTipoNFe read FTipoNFe write SetTipoNFe;
    property TipoEmissaoNFe: TpcnTipoEmissao read FTipoEmissaoNFe
      write SetTipoEmissaoNFe;
    property TipoAmbiente: TpcnTipoAmbiente read FTipoAmbiente write SetTipoAmbiente;
    property UFFatoGerador: string read FUFFatoGerador write SetUFFatoGerador;
    property CodMunicipioFatoGerador: string
      read FCodMunicipioFatoGerador write SetCodMunicipioFatoGerador;
    property FinalidadeNFe: TpcnFinalidadeNFe read FFinalidadeNFe write SetFinalidadeNFe;
    property TipoImpressaoDanfe: TpcnTipoImpressao
      read FTipoImpressaoDanfe write SetTipoImpressaoDanfe;

    // Valores aceitos:
    // iiSemOperacao, iiOperacaoSemIntermediador, iiOperacaoComIntermediador
    property IndicadorIntermediario: TindIntermed
      read FIndicadorIntermediario write SetIndicadorIntermediario;
    property DtContingencia: TDateTime read FDtContingencia write SetDtContingencia;
    property JustificativaContingencia: string
      read FJustificativaContingencia write SetJustificativaContingencia;
    property NFeReferenciada: TObjectList read FNFeReferenciada write SetNFeReferenciada;

    property CnpjCpfEmitente: string read FCnpjCpfEmitente write SetCnpjCpfEmitente;
    property IneEmitente: string read FIneEmitente write SetIneEmitente;
    property NomeEmitente: string read FNomeEmitente write SetNomeEmitente;
    property NomeFantasia: string read FNomeFantasia write SetNomeFantasia;

    // (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)
    property TipoTributacaoEmpresa: TpcnCRT
      read FTipoTributacaoEmpresa write SetTipoTributacaoEmpresa;

    property Produtos: TObjectList read FProdutos write SetProdutos;

    property UForigem: string read FUForigem write SetUForigem;
    property CodIbgeOrigem: integer read FCodIbgeOrigem write SetCodIbgeOrigem;



    property FoneEmitente: string read FFoneEmitente write SetFoneEmitente;
    property CepEmitente: string read FCepEmitente write SetCepEmitente;
    property EnderecoEmitente: string read FEnderecoEmitente write SetEnderecoEmitente;
    property NumeroEnderecoEmitente: string
      read FNumeroEnderecoEmitente write SetNumeroEnderecoEmitente;
    property ComplementoEnderecoEmitente: string
      read FComplementoEnderecoEmitente write SetComplementoEnderecoEmitente;
    property BairroEmitente: string read FBairroEmitente write SetBairroEmitente;
    property CodIBGEEmitente: integer read FCodIBGEEmitente write SetCodIBGEEmitente;
    property NomeMunicipioEmitente: string read FNomeMunicipioEmitente
      write SetNomeMunicipioEmitente;
    property UFEmitente: string read FUFEmitente write SetUFEmitente;
    property CodPaisEmitente: integer read FCodPaisEmitente write SetCodPaisEmitente;
    property NomePaisEmitente: string read FNomePaisEmitente write SetNomePaisEmitente;
    property IneSt: string read FIneSt write SetIneSt;
    property InscMunicipal: string read FInscMunicipal write SetInscMunicipal;

    property CNAE: string read FCNAE write SetCNAE;



    property CnpjCpfDestinatario: string read FCnpjCpfDestinatario
      write SetCnpjCpfDestinatario;
    property IneDestinatario: string read FIneDestinatario write SetIneDestinatario;
    property Suframa: string read FSuframa write SetSuframa;
    property NomeDestinatario: string read FNomeDestinatario write SetNomeDestinatario;
    property FoneDestinatario: string read FFoneDestinatario write SetFoneDestinatario;
    property CepDestinatario: string read FCepDestinatario write SetCepDestinatario;
    property EnderecoDestinatario: string read FEnderecoDestinatario
      write SetEnderecoDestinatario;
    property NumeroEnderecoDestinatario: string
      read FNumeroEnderecoDestinatario write SetNumeroEnderecoDestinatario;
    property ComplementoEnderecoDestinatario: string
      read FComplementoEnderecoDestinatario write SetComplementoEnderecoDestinatario;
    property BairroDestinatario: string read FBairroDestinatario
      write SetBairroDestinatario;
    property CodIBGEDestinatario: integer read FCodIBGEDestinatario
      write SetCodIBGEDestinatario;
    property NomeMunicipioDestinatario: string
      read FNomeMunicipioDestinatario write SetNomeMunicipioDestinatario;
    property UFDestinatario: string read FUFDestinatario write SetUFDestinatario;
    property CodPaisDestinatario: integer read FCodPaisDestinatario
      write SetCodPaisDestinatario;
    property NomePaisDestinatario: string read FNomePaisDestinatario
      write SetNomePaisDestinatario;

    property CnpjCpfRetirada: string read FCnpjCpfRetirada write SetCnpjCpfRetirada;
    property EnderecoRetirada: string read FEnderecoRetirada write SetEnderecoRetirada;
    property NumeroEnderecoRetirada: string
      read FNumeroEnderecoRetirada write SetNumeroEnderecoRetirada;
    property ComplementoRetirada: string read FComplementoRetirada
      write SetComplementoRetirada;
    property BairroRetirada: string read FBairroRetirada write SetBairroRetirada;
    property CodIbgeRetirada: string read FCodIbgeRetirada write SetCodIbgeRetirada;
    property MunicipioRetirada: string read FMunicipioRetirada
      write SetMunicipioRetirada;
    property UfRetirada: string read FUfRetirada write SetUfRetirada;

    property CnpjCpfEntrega: string read FCnpjCpfEntrega write SetCnpjCpfEntrega;
    property EnderecoEntrega: string read FEnderecoEntrega write SetEnderecoEntrega;
    property NumeroEnderecoEntrega: string
      read FNumeroEnderecoEntrega write SetNumeroEnderecoEntrega;
    property ComplementoEntrega: string read FComplementoEntrega
      write SetComplementoEntrega;
    property BairroEntrega: string read FBairroEntrega write SetBairroEntrega;
    property CodIbgeEntrega: string read FCodIbgeEntrega write SetCodIbgeEntrega;
    property MunicipioEntrega: string read FMunicipioEntrega write SetMunicipioEntrega;
    property UfEntrega: string read FUfEntrega write SetUfEntrega;

    property UFEmbarque: string read FUFEmbarque write SetUFEmbarque;
    property LocalEmbarque: string read FLocalEmbarque write SetLocalEmbarque;




  end;

implementation

{ TNFeReferenciada }

procedure TNFeReferenciada.SetAnoMes(AValue: string);
begin
  if FAnoMes = AValue then Exit;
  FAnoMes := AValue;
end;

procedure TNFeReferenciada.SetChaveAcessoNFeReferenciada(AValue: string);
begin
  if FChaveAcessoNFeReferenciada = AValue then Exit;
  FChaveAcessoNFeReferenciada := AValue;
end;

procedure TNFeReferenciada.SetCnpjCpf(AValue: string);
begin
  if FCnpjCpf = AValue then Exit;
  FCnpjCpf := AValue;
end;

procedure TNFeReferenciada.SetIne(AValue: string);
begin
  if FIne = AValue then Exit;
  FIne := AValue;
end;

procedure TNFeReferenciada.Setmodelo(AValue: TpcnECFModRef);
begin
  if Fmodelo = AValue then Exit;
  Fmodelo := AValue;
end;

procedure TNFeReferenciada.SetModeloFiscal(AValue: string);
begin
  if FModeloFiscal = AValue then Exit;
  FModeloFiscal := AValue;
end;

procedure TNFeReferenciada.SetNCOO(AValue: string);
begin
  if FNCOO = AValue then Exit;
  FNCOO := AValue;
end;

procedure TNFeReferenciada.SetNumeroECF(AValue: string);
begin
  if FNumeroECF = AValue then Exit;
  FNumeroECF := AValue;
end;

procedure TNFeReferenciada.SetNumNFReferenciada(AValue: integer);
begin
  if FNumNFReferenciada = AValue then Exit;
  FNumNFReferenciada := AValue;
end;

procedure TNFeReferenciada.SetSerie(AValue: string);
begin
  if FSerie = AValue then Exit;
  FSerie := AValue;
end;

procedure TNFeReferenciada.SetUF(AValue: string);
begin
  if FUF = AValue then Exit;
  FUF := AValue;
end;

{ TVoProdutosNFe }

procedure TVoProdutosNFe.SetCest(AValue: string);
begin
  if FCest = AValue then Exit;
  FCest := AValue;
end;

procedure TVoProdutosNFe.SetCFOP(AValue: integer);
begin
  if FCFOP = AValue then Exit;
  FCFOP := AValue;
end;

procedure TVoProdutosNFe.SetCodigo(AValue: string);
begin
  if FCodigo = AValue then Exit;
  FCodigo := AValue;
end;

procedure TVoProdutosNFe.SetCodigoBarra(AValue: string);
begin
  if FCodigoBarra = AValue then Exit;
  FCodigoBarra := AValue;
end;

procedure TVoProdutosNFe.SetCodigoBarraSemValidacao(AValue: string);
begin
  if FCodigoBarraSemValidacao = AValue then Exit;
  FCodigoBarraSemValidacao := AValue;
end;

procedure TVoProdutosNFe.SetDescricao(AValue: string);
begin
  if FDescricao = AValue then Exit;
  FDescricao := AValue;
end;

procedure TVoProdutosNFe.SetEXTPIPI(AValue: string);
begin
  if FEXTPIPI = AValue then Exit;
  FEXTPIPI := AValue;
end;

procedure TVoProdutosNFe.SetNCM(AValue: string);
begin
  if FNCM = AValue then Exit;
  FNCM := AValue;
end;

procedure TVoProdutosNFe.SetObsProduto(AValue: string);
begin
  if FObsProduto = AValue then Exit;
  FObsProduto := AValue;
end;

procedure TVoProdutosNFe.SetQtdade(AValue: double);
begin
  if FQtdade = AValue then Exit;
  FQtdade := AValue;
end;

procedure TVoProdutosNFe.SetUnidade(AValue: string);
begin
  if FUnidade = AValue then Exit;
  FUnidade := AValue;
end;

procedure TVoProdutosNFe.SetVlrDesconto(AValue: double);
begin
  if FVlrDesconto = AValue then Exit;
  FVlrDesconto := AValue;
end;

procedure TVoProdutosNFe.SetVlrFrete(AValue: double);
begin
  if FVlrFrete = AValue then Exit;
  FVlrFrete := AValue;
end;

procedure TVoProdutosNFe.SetVlrOutrasDespesas(AValue: double);
begin
  if FVlrOutrasDespesas = AValue then Exit;
  FVlrOutrasDespesas := AValue;
end;

procedure TVoProdutosNFe.SetVlrSeguro(AValue: double);
begin
  if FVlrSeguro = AValue then Exit;
  FVlrSeguro := AValue;
end;

procedure TVoProdutosNFe.SetVlrUnitario(AValue: double);
begin
  if FVlrUnitario = AValue then Exit;
  FVlrUnitario := AValue;
end;

{ TVoNFe }

procedure TVoNFe.SetCnpjCpfEmitente(AValue: string);
begin
  if FCnpjCpfEmitente = AValue then Exit;
  FCnpjCpfEmitente := AValue;
end;

procedure TVoNFe.SetBairroDestinatario(AValue: string);
begin
  if FBairroDestinatario = AValue then Exit;
  FBairroDestinatario := AValue;
end;

procedure TVoNFe.SetBairroEmitente(AValue: string);
begin
  if FBairroEmitente = AValue then Exit;
  FBairroEmitente := AValue;
end;

procedure TVoNFe.SetBairroEntrega(AValue: string);
begin
  if FBairroEntrega = AValue then Exit;
  FBairroEntrega := AValue;
end;

procedure TVoNFe.SetBairroRetirada(AValue: string);
begin
  if FBairroRetirada = AValue then Exit;
  FBairroRetirada := AValue;
end;

procedure TVoNFe.SetCepDestinatario(AValue: string);
begin
  if FCepDestinatario = AValue then Exit;
  FCepDestinatario := AValue;
end;

procedure TVoNFe.SetCepEmitente(AValue: string);
begin
  if FCepEmitente = AValue then Exit;
  FCepEmitente := AValue;
end;

procedure TVoNFe.SetCNAE(AValue: string);
begin
  if FCNAE = AValue then Exit;
  FCNAE := AValue;
end;

procedure TVoNFe.SetCnpjCpfDestinatario(AValue: string);
begin
  if FCnpjCpfDestinatario = AValue then Exit;
  FCnpjCpfDestinatario := AValue;
end;

procedure TVoNFe.SetCnpjCpfEntrega(AValue: string);
begin
  if FCnpjCpfEntrega = AValue then Exit;
  FCnpjCpfEntrega := AValue;
end;

procedure TVoNFe.SetCnpjCpfRetirada(AValue: string);
begin
  if FCnpjCpfRetirada = AValue then Exit;
  FCnpjCpfRetirada := AValue;
end;

procedure TVoNFe.SetCodIBGEDestinatario(AValue: integer);
begin
  if FCodIBGEDestinatario = AValue then Exit;
  FCodIBGEDestinatario := AValue;
end;

procedure TVoNFe.SetCodIBGEEmitente(AValue: integer);
begin
  if FCodIBGEEmitente = AValue then Exit;
  FCodIBGEEmitente := AValue;
end;

procedure TVoNFe.SetCodIbgeEntrega(AValue: string);
begin
  if FCodIbgeEntrega = AValue then Exit;
  FCodIbgeEntrega := AValue;
end;

procedure TVoNFe.SetCodIbgeOrigem(AValue: integer);
begin
  if FCodIbgeOrigem = AValue then Exit;
  FCodIbgeOrigem := AValue;
end;

procedure TVoNFe.SetCodIbgeRetirada(AValue: string);
begin
  if FCodIbgeRetirada = AValue then Exit;
  FCodIbgeRetirada := AValue;
end;

procedure TVoNFe.SetCodMunicipioFatoGerador(AValue: string);
begin
  if FCodMunicipioFatoGerador = AValue then Exit;
  FCodMunicipioFatoGerador := AValue;
end;

procedure TVoNFe.SetCodNumericoNFe(AValue: integer);
begin
  if FCodNumericoNFe = AValue then Exit;
  FCodNumericoNFe := AValue;
end;

procedure TVoNFe.SetCodPaisDestinatario(AValue: integer);
begin
  if FCodPaisDestinatario = AValue then Exit;
  FCodPaisDestinatario := AValue;
end;

procedure TVoNFe.SetCodPaisEmitente(AValue: integer);
begin
  if FCodPaisEmitente = AValue then Exit;
  FCodPaisEmitente := AValue;
end;

procedure TVoNFe.SetComplementoEnderecoDestinatario(AValue: string);
begin
  if FComplementoEnderecoDestinatario = AValue then Exit;
  FComplementoEnderecoDestinatario := AValue;
end;

procedure TVoNFe.SetComplementoEnderecoEmitente(AValue: string);
begin
  if FComplementoEnderecoEmitente = AValue then Exit;
  FComplementoEnderecoEmitente := AValue;
end;

procedure TVoNFe.SetComplementoEntrega(AValue: string);
begin
  if FComplementoEntrega = AValue then Exit;
  FComplementoEntrega := AValue;
end;

procedure TVoNFe.SetComplementoRetirada(AValue: string);
begin
  if FComplementoRetirada = AValue then Exit;
  FComplementoRetirada := AValue;
end;

procedure TVoNFe.SetDtContingencia(AValue: TDateTime);
begin
  if FDtContingencia = AValue then Exit;
  FDtContingencia := AValue;
end;

procedure TVoNFe.SetDtEmissao(AValue: TDateTime);
begin
  if FDtEmissao = AValue then Exit;
  FDtEmissao := AValue;
end;

procedure TVoNFe.SetDtSaida(AValue: TDateTime);
begin
  if FDtSaida = AValue then Exit;
  FDtSaida := AValue;
end;

procedure TVoNFe.SetEnderecoDestinatario(AValue: string);
begin
  if FEnderecoDestinatario = AValue then Exit;
  FEnderecoDestinatario := AValue;
end;

procedure TVoNFe.SetEnderecoEmitente(AValue: string);
begin
  if FEnderecoEmitente = AValue then Exit;
  FEnderecoEmitente := AValue;
end;

procedure TVoNFe.SetEnderecoEntrega(AValue: string);
begin
  if FEnderecoEntrega = AValue then Exit;
  FEnderecoEntrega := AValue;
end;

procedure TVoNFe.SetEnderecoRetirada(AValue: string);
begin
  if FEnderecoRetirada = AValue then Exit;
  FEnderecoRetirada := AValue;
end;

procedure TVoNFe.SetFinalidadeNFe(AValue: TpcnFinalidadeNFe);
begin
  if FFinalidadeNFe = AValue then Exit;
  FFinalidadeNFe := AValue;
end;

procedure TVoNFe.SetFoneDestinatario(AValue: string);
begin
  if FFoneDestinatario = AValue then Exit;
  FFoneDestinatario := AValue;
end;

procedure TVoNFe.SetFoneEmitente(AValue: string);
begin
  if FFoneEmitente = AValue then Exit;
  FFoneEmitente := AValue;
end;

procedure TVoNFe.SetHrSaida(AValue: TDateTime);
begin
  if FHrSaida = AValue then Exit;
  FHrSaida := AValue;
end;

procedure TVoNFe.SetIndicadorIntermediario(AValue: TindIntermed);
begin
  if FIndicadorIntermediario = AValue then Exit;
  FIndicadorIntermediario := AValue;
end;

procedure TVoNFe.SetIneDestinatario(AValue: string);
begin
  if FIneDestinatario = AValue then Exit;
  FIneDestinatario := AValue;
end;

procedure TVoNFe.SetIneEmitente(AValue: string);
begin
  if FIneEmitente = AValue then Exit;
  FIneEmitente := AValue;
end;

procedure TVoNFe.SetIneSt(AValue: string);
begin
  if FIneSt = AValue then Exit;
  FIneSt := AValue;
end;

procedure TVoNFe.SetInscMunicipal(AValue: string);
begin
  if FInscMunicipal = AValue then Exit;
  FInscMunicipal := AValue;
end;

procedure TVoNFe.SetJustificativaContingencia(AValue: string);
begin
  if FJustificativaContingencia = AValue then Exit;
  FJustificativaContingencia := AValue;
end;

procedure TVoNFe.SetLocalEmbarque(AValue: string);
begin
  if FLocalEmbarque = AValue then Exit;
  FLocalEmbarque := AValue;
end;

procedure TVoNFe.SetModeloFiscal(AValue: integer);
begin
  if FModeloFiscal = AValue then Exit;
  FModeloFiscal := AValue;
end;

procedure TVoNFe.SetMunicipioEntrega(AValue: string);
begin
  if FMunicipioEntrega = AValue then Exit;
  FMunicipioEntrega := AValue;
end;

procedure TVoNFe.SetMunicipioRetirada(AValue: string);
begin
  if FMunicipioRetirada = AValue then Exit;
  FMunicipioRetirada := AValue;
end;

procedure TVoNFe.SetNaturezaOperacao(AValue: string);
begin
  if FNaturezaOperacao = AValue then Exit;
  FNaturezaOperacao := AValue;
end;

procedure TVoNFe.SetNFeReferenciada(AValue: TObjectList);
begin
  if FNFeReferenciada = AValue then Exit;
  FNFeReferenciada := AValue;
end;

procedure TVoNFe.SetNomeDestinatario(AValue: string);
begin
  if FNomeDestinatario = AValue then Exit;
  FNomeDestinatario := AValue;
end;

procedure TVoNFe.SetNomeEmitente(AValue: string);
begin
  if FNomeEmitente = AValue then Exit;
  FNomeEmitente := AValue;
end;

procedure TVoNFe.SetNomeFantasia(AValue: string);
begin
  if FNomeFantasia = AValue then Exit;
  FNomeFantasia := AValue;
end;

procedure TVoNFe.SetNomeMunicipioDestinatario(AValue: string);
begin
  if FNomeMunicipioDestinatario = AValue then Exit;
  FNomeMunicipioDestinatario := AValue;
end;

procedure TVoNFe.SetNomeMunicipioEmitente(AValue: string);
begin
  if FNomeMunicipioEmitente = AValue then Exit;
  FNomeMunicipioEmitente := AValue;
end;

procedure TVoNFe.SetNomePaisDestinatario(AValue: string);
begin
  if FNomePaisDestinatario = AValue then Exit;
  FNomePaisDestinatario := AValue;
end;

procedure TVoNFe.SetNomePaisEmitente(AValue: string);
begin
  if FNomePaisEmitente = AValue then Exit;
  FNomePaisEmitente := AValue;
end;

procedure TVoNFe.SetNumeroEnderecoDestinatario(AValue: string);
begin
  if FNumeroEnderecoDestinatario = AValue then Exit;
  FNumeroEnderecoDestinatario := AValue;
end;

procedure TVoNFe.SetNumeroEnderecoEmitente(AValue: string);
begin
  if FNumeroEnderecoEmitente = AValue then Exit;
  FNumeroEnderecoEmitente := AValue;
end;

procedure TVoNFe.SetNumeroEnderecoEntrega(AValue: string);
begin
  if FNumeroEnderecoEntrega = AValue then Exit;
  FNumeroEnderecoEntrega := AValue;
end;

procedure TVoNFe.SetNumeroEnderecoRetirada(AValue: string);
begin
  if FNumeroEnderecoRetirada = AValue then Exit;
  FNumeroEnderecoRetirada := AValue;
end;

procedure TVoNFe.SetNumNFe(AValue: integer);
begin
  if FNumNFe = AValue then Exit;
  FNumNFe := AValue;
end;

procedure TVoNFe.SetProdutos(AValue: TObjectList);
begin
  if FProdutos = AValue then Exit;
  FProdutos := AValue;
end;

procedure TVoNFe.SetSerieNF(AValue: integer);
begin
  if FSerieNF = AValue then Exit;
  FSerieNF := AValue;
end;

procedure TVoNFe.SetSuframa(AValue: string);
begin
  if FSuframa = AValue then Exit;
  FSuframa := AValue;
end;

procedure TVoNFe.SetTipoAmbiente(AValue: TpcnTipoAmbiente);
begin
  if FTipoAmbiente = AValue then Exit;
  FTipoAmbiente := AValue;
end;

procedure TVoNFe.SetTipoEmissaoNFe(AValue: TpcnTipoEmissao);
begin
  if FTipoEmissaoNFe = AValue then Exit;
  FTipoEmissaoNFe := AValue;
end;

procedure TVoNFe.SetTipoImpressaoDanfe(AValue: TpcnTipoImpressao);
begin
  if FTipoImpressaoDanfe = AValue then Exit;
  FTipoImpressaoDanfe := AValue;
end;

procedure TVoNFe.SetTipoNFe(AValue: TpcnTipoNFe);
begin
  if FTipoNFe = AValue then Exit;
  FTipoNFe := AValue;
end;

procedure TVoNFe.SetTipoTributacaoEmpresa(AValue: TpcnCRT);
begin
  if FTipoTributacaoEmpresa = AValue then Exit;
  FTipoTributacaoEmpresa := AValue;
end;


procedure TVoNFe.SetUFDestinatario(AValue: string);
begin
  if FUFDestinatario = AValue then Exit;
  FUFDestinatario := AValue;
end;

procedure TVoNFe.SetUFEmbarque(AValue: string);
begin
  if FUFEmbarque = AValue then Exit;
  FUFEmbarque := AValue;
end;

procedure TVoNFe.SetUFEmitente(AValue: string);
begin
  if FUFEmitente = AValue then Exit;
  FUFEmitente := AValue;
end;

procedure TVoNFe.SetUfEntrega(AValue: string);
begin
  if FUfEntrega = AValue then Exit;
  FUfEntrega := AValue;
end;

procedure TVoNFe.SetUFFatoGerador(AValue: string);
begin
  if FUFFatoGerador = AValue then Exit;
  FUFFatoGerador := AValue;
end;

procedure TVoNFe.SetUForigem(AValue: string);
begin
  if FUForigem = AValue then Exit;
  FUForigem := AValue;
end;

procedure TVoNFe.SetUfRetirada(AValue: string);
begin
  if FUfRetirada = AValue then Exit;
  FUfRetirada := AValue;
end;

procedure TVoNFe.SetVistaPrazoOutros(AValue: TpcnIndicadorPagamento);
begin
  if FVistaPrazoOutros = AValue then Exit;
  FVistaPrazoOutros := AValue;
end;

end.
