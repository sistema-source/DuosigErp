unit model_nfe;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ACBrNFe, ACBrDFeSSL, ACBrNFe.Classes, ACBrNFeNotasFiscais, vo_nfe, pcnConversao;

type

  { TModelNFe }


  TModelNFe = class(TDataModule)
    ACBrNFe: TACBrNFe;
  private
    FAdicao: TAdiCollectionItem;
    FArma: TArmaCollectionItem;
    FDefensivo: TdefensivoCollectionItem;
    FDI: TDICollectionItem;
    FDuplicata: TDupCollectionItem;
    Fgropecuario: Tagropecuario;
    FLacre: TLacresCollectionItem;
    FMedicamento: TMedCollectionItem;
    FnfoPgto: TpagCollectionItem;
    FNotaF: NotaFiscal;
    FObsComplementar: TobsContCollectionItem;
    FObsFisco: TobsFiscoCollectionItem;
    FOk: boolean;
    FProcReferenciado: TprocRefCollectionItem;
    FProduto: TDetCollectionItem;
    FRastro: TrastroCollectionItem;
    FReboque: TreboqueCollectionItem;
    FReferenciada: TNFrefCollectionItem;
    FServico: TDetCollectionItem;
    FVolume: TVolCollectionItem;
    procedure SetAdicao(AValue: TAdiCollectionItem);
    procedure SetArma(AValue: TArmaCollectionItem);
    procedure SetDefensivo(AValue: TdefensivoCollectionItem);
    procedure SetDI(AValue: TDICollectionItem);
    procedure SetDuplicata(AValue: TDupCollectionItem);
    procedure Setgropecuario(AValue: Tagropecuario);
    procedure SetLacre(AValue: TLacresCollectionItem);
    procedure SetMedicamento(AValue: TMedCollectionItem);
    procedure SetnfoPgto(AValue: TpagCollectionItem);
    procedure SetNotaF(AValue: NotaFiscal);
    procedure SetObsComplementar(AValue: TobsContCollectionItem);
    procedure SetObsFisco(AValue: TobsFiscoCollectionItem);
    procedure SetOk(AValue: boolean);
    procedure SetProcReferenciado(AValue: TprocRefCollectionItem);
    procedure SetProduto(AValue: TDetCollectionItem);
    procedure SetRastro(AValue: TrastroCollectionItem);
    procedure SetReboque(AValue: TreboqueCollectionItem);
    procedure SetReferenciada(AValue: TNFrefCollectionItem);
    procedure SetServico(AValue: TDetCollectionItem);
    procedure SetVolume(AValue: TVolCollectionItem);

    procedure GerarXMLIde(pVoNFe : TVoNFe);
    procedure GerarXMLEmitente(pVoNfe : TVoNfe);
    procedure GerarXMLNFeAvulsa(pVONfe : TVoNfe);
    procedure GerarXMLDestinatario(pVoNfe : TVoNfe);
    procedure GerarXMLRetirada(pVoNfe : TVoNfe);
    procedure GerarXMLEntrega(pVoNfe : TVoNfe);
    procedure GerarXMLProdutos(pVoNfe : TVoNfe);
    procedure GerarXMLDeclaracaoImportacao(pVoProdutoNFe : TVoProdutosNFe);
    procedure GerarXMLVeiculosNovos(pVoProdutoNFe : TVoProdutosNFe);
    procedure GerarXMLRastreabilidade(pVoProdutoNFe : TVoProdutosNFe);
    procedure GerarXMLMedicamentos(pVoProdutoNFe : TVoProdutosNFe);
    procedure GerarXMLArmamento(pVoProdutoNFe : TVoProdutosNFe);
    procedure GErarXMLAgropecuario(pVoProdutoNFe : TVoProdutosNFe);
    procedure GerarXMLImposto(pVoProdutoNFe : TVoProdutosNFe);
    procedure GErarXMLImpostosIcmsSimples(pVoProdutoNFe : TVoProdutosNFe);
    procedure GErarXMLFundoPobreza(pVoProdutoNFe : TVoProdutoNfe);
    procedure GErarXMLImpostosPisCofins(pVoProdutoNFe : TVoProdutosNFe);
    procedure GErarXMLImpostosIpi(pVoProdutoNFe : TVoProdutosNFe);
    procedure GErarXMLImpostosImportacao(pVoProdutoNFe : TVoProdutosNFe);
  public

    function GerarNFe(pVONfe : TVONfe) : boolean;
    property Ok: boolean read FOk write SetOk;
    property NotaF: NotaFiscal read FNotaF write SetNotaF;
    property Produto: TDetCollectionItem read FProduto write SetProduto;
    property Servico: TDetCollectionItem read FServico write SetServico;
    property Volume: TVolCollectionItem read FVolume write SetVolume;
    property Duplicata: TDupCollectionItem read FDuplicata write SetDuplicata;
    property ObsComplementar: TobsContCollectionItem read FObsComplementar write SetObsComplementar;
    property ObsFisco: TobsFiscoCollectionItem read FObsFisco write SetObsFisco;
    property Referenciada: TNFrefCollectionItem read FReferenciada write SetReferenciada;
    property DI: TDICollectionItem read FDI write SetDI;
    property Adicao: TAdiCollectionItem read FAdicao write SetAdicao;
    property Rastro: TrastroCollectionItem read FRastro write SetRastro;
    property Medicamento: TMedCollectionItem read FMedicamento write SetMedicamento;
    property Arma: TArmaCollectionItem read FArma write SetArma;
    property Reboque: TreboqueCollectionItem read FReboque write SetReboque;
    property Lacre: TLacresCollectionItem read FLacre write SetLacre;
    property ProcReferenciado: TprocRefCollectionItem read FProcReferenciado write SetProcReferenciado;
    property gropecuario: Tagropecuario read Fgropecuario write Setgropecuario;
    property Defensivo: TdefensivoCollectionItem read FDefensivo write SetDefensivo;
    property nfoPgto: TpagCollectionItem read FnfoPgto write SetnfoPgto;

  end;

var
  ModelNFe: TModelNFe;

implementation

{$R *.lfm}

{ TModelNFe }

function TModelNFe.GerarNFe(pVONfe: TVONfe): boolean;
Var
  i : Integer;
begin
  FNotaF := ACBrNFe.NotasFiscais.Add;
  GerarXMLIde(pVoNFe);
  GerarXMLEmitente(pVoNfe);
  GerarXMLNFeAvulsa(pVoNfe);
  GerarXMLDestinatario (pVoNfe);
  GerarXMLRetirada(pVoNfe);
  GerarXMLEntrega(pVoNfe);
  GerarXMLProdutos(pVoNfe);









  if NotaF.NFe.Emit.CRT in [crtSimplesExcessoReceita, crtRegimeNormal] then
  begin
    NotaF.NFe.Total.ICMSTot.vBC := 100;
    NotaF.NFe.Total.ICMSTot.vICMS := 18;
  end
  else
  begin
    NotaF.NFe.Total.ICMSTot.vBC := 0;
    NotaF.NFe.Total.ICMSTot.vICMS := 0;
  end;

  NotaF.NFe.Total.ICMSTot.vBCST := 0;
  NotaF.NFe.Total.ICMSTot.vST := 0;
  NotaF.NFe.Total.ICMSTot.vProd := 100;
  NotaF.NFe.Total.ICMSTot.vFrete := 0;
  NotaF.NFe.Total.ICMSTot.vSeg := 0;
  NotaF.NFe.Total.ICMSTot.vDesc := 0;
  NotaF.NFe.Total.ICMSTot.vII := 0;
  NotaF.NFe.Total.ICMSTot.vIPI := 0;
  NotaF.NFe.Total.ICMSTot.vPIS := 0;
  NotaF.NFe.Total.ICMSTot.vCOFINS := 0;
  NotaF.NFe.Total.ICMSTot.vOutro := 0;
  NotaF.NFe.Total.ICMSTot.vNF := 100;

  // lei da transparencia de impostos
  NotaF.NFe.Total.ICMSTot.vTotTrib := 0;

  // partilha do icms e fundo de probreza
  NotaF.NFe.Total.ICMSTot.vFCPUFDest := 0.00;
  NotaF.NFe.Total.ICMSTot.vICMSUFDest := 0.00;
  NotaF.NFe.Total.ICMSTot.vICMSUFRemet := 0.00;

  NotaF.NFe.Total.retTrib.vRetPIS := 0;
  NotaF.NFe.Total.retTrib.vRetCOFINS := 0;
  NotaF.NFe.Total.retTrib.vRetCSLL := 0;
  NotaF.NFe.Total.retTrib.vBCIRRF := 0;
  NotaF.NFe.Total.retTrib.vIRRF := 0;
  NotaF.NFe.Total.retTrib.vBCRetPrev := 0;
  NotaF.NFe.Total.retTrib.vRetPrev := 0;

  NotaF.NFe.Transp.modFrete := mfContaEmitente;
  NotaF.NFe.Transp.Transporta.CNPJCPF := '';
  NotaF.NFe.Transp.Transporta.xNome := '';
  NotaF.NFe.Transp.Transporta.IE := '';
  NotaF.NFe.Transp.Transporta.xEnder := '';
  NotaF.NFe.Transp.Transporta.xMun := '';
  NotaF.NFe.Transp.Transporta.UF := '';

  NotaF.NFe.Transp.retTransp.vServ := 0;
  NotaF.NFe.Transp.retTransp.vBCRet := 0;
  NotaF.NFe.Transp.retTransp.pICMSRet := 0;
  NotaF.NFe.Transp.retTransp.vICMSRet := 0;
  NotaF.NFe.Transp.retTransp.CFOP := '';
  NotaF.NFe.Transp.retTransp.cMunFG := 0;

  Volume := NotaF.NFe.Transp.Vol.New;
  Volume.qVol := 1;
  Volume.esp := 'Especie';
  Volume.marca := 'Marca';
  Volume.nVol := 'Numero';
  Volume.pesoL := 100;
  Volume.pesoB := 110;


  NotaF.NFe.Cobr.Fat.nFat := '1001'; // 'Numero da Fatura'
  NotaF.NFe.Cobr.Fat.vOrig := 100;
  NotaF.NFe.Cobr.Fat.vDesc := 0;
  NotaF.NFe.Cobr.Fat.vLiq := 100;

  Duplicata := NotaF.NFe.Cobr.Dup.New;
  Duplicata.nDup := '001';
  Duplicata.dVenc := now + 10;
  Duplicata.vDup := 50;

  Duplicata := NotaF.NFe.Cobr.Dup.New;
  Duplicata.nDup := '002';
  Duplicata.dVenc := now + 20;
  Duplicata.vDup := 50;

  // O grupo infIntermed só deve ser gerado nos casos de operação não presencial
  // pela internet em site de terceiros (Intermediadores).
  //  NotaF.NFe.infIntermed.CNPJ := '';
  //  NotaF.NFe.infIntermed.idCadIntTran := '';

  NotaF.NFe.InfAdic.infCpl := '';
  NotaF.NFe.InfAdic.infAdFisco := '';

  ObsComplementar := NotaF.NFe.InfAdic.obsCont.New;
  ObsComplementar.xCampo := 'ObsCont';
  ObsComplementar.xTexto := 'Texto';

  ObsFisco := NotaF.NFe.InfAdic.obsFisco.New;
  ObsFisco.xCampo := 'ObsFisco';
  ObsFisco.xTexto := 'Texto';

  If VONfe.UFEmbarque  <> '' then
  begin
  NotaF.NFe.exporta.UFembarq := VONfe.UFEmbarque
  NotaF.NFe.exporta.xLocEmbarq := VONfe.LocalEmbarque
  End;

  If VoNfe.NumeroPedidoCliente <> '' then
  begin
  NotaF.NFe.compra.xNEmp := '';
  NotaF.NFe.compra.xPed := VoNfe.NumeroPedidoCliente;
  NotaF.NFe.compra.xCont := VoNfe.NumeroItemPedidoCliente;
  end;

  // YA. Informações de pagamento

  InfoPgto := NotaF.NFe.pag.New;
  InfoPgto.indPag := ipVista;
  InfoPgto.tPag := fpDinheiro;
  InfoPgto.vPag := 100;

  // Exemplo de pagamento integrado.

  InfoPgto := NotaF.NFe.pag.New;
  InfoPgto.indPag := ipVista;
  InfoPgto.tPag := fpCartaoCredito;

    {
      abaixo o campo incluido no layout a partir da NT 2020/006
    }
    {
      se tPag for fpOutro devemos incluir o campo xPag
    InfoPgto.xPag := 'Caderneta';
    }
  InfoPgto.vPag := 75;
  InfoPgto.tpIntegra := tiPagIntegrado;
  InfoPgto.CNPJ := '05481336000137';
  InfoPgto.tBand := bcVisa;
  InfoPgto.cAut := '1234567890123456';

  // YA09 Troco
  // Regra opcional: Informar se valor dos pagamentos maior que valor da nota.
  // Regra obrigatória: Se informado, Não pode diferir de "(+) vPag (id:YA03) (-) vNF (id:W16)"
  //  NotaF.NFe.pag.vTroco := 75;

    {
      abaixo o campo incluido no layout a partir da NT 2020/006
    }
  // CNPJ do Intermediador da Transação (agenciador, plataforma de delivery,
  // marketplace e similar) de serviços e de negócios.
  NotaF.NFe.infIntermed.CNPJ := '';
  // Nome do usuário ou identificação do perfil do vendedor no site do intermediador
  // (agenciador, plataforma de delivery, marketplace e similar) de serviços e de
  // negócios.
  NotaF.NFe.infIntermed.idCadIntTran := '';

  // Reforma Tributária
    {
    NotaF.NFe.IBSCBSSelTot.vBCIBSCBS := 100;
    NotaF.NFe.IBSCBSSelTot.vTotNF := 100;

    NotaF.NFe.IBSCBSSelTot.gSel.vBCSel := 100;
    NotaF.NFe.IBSCBSSelTot.gSel.vImpSel := 100;

    NotaF.NFe.IBSCBSSelTot.gIBS.vCresPres := 100;
    NotaF.NFe.IBSCBSSelTot.gIBS.vCredPresCondSus := 100;

    NotaF.NFe.IBSCBSSelTot.gIBS.gIBSUFTot.vDif := 100;
    NotaF.NFe.IBSCBSSelTot.gIBS.gIBSUFTot.vDevTrib := 100;
    NotaF.NFe.IBSCBSSelTot.gIBS.gIBSUFTot.vDeson := 100;
    NotaF.NFe.IBSCBSSelTot.gIBS.gIBSUFTot.vIBSUF := 100;

    NotaF.NFe.IBSCBSSelTot.gIBS.gIBSMunTot.vDif := 100;
    NotaF.NFe.IBSCBSSelTot.gIBS.gIBSMunTot.vDevTrib := 100;
    NotaF.NFe.IBSCBSSelTot.gIBS.gIBSMunTot.vDeson := 100;
    NotaF.NFe.IBSCBSSelTot.gIBS.gIBSMunTot.vIBSMun := 100;
    NotaF.NFe.IBSCBSSelTot.gIBS.gIBSMunTot.vIBSTot := 100;

    NotaF.NFe.IBSCBSSelTot.gCBS.vCresPres := 100;
    NotaF.NFe.IBSCBSSelTot.gCBS.vCredPresCondSus := 100;
    NotaF.NFe.IBSCBSSelTot.gCBS.vDif := 100;
    NotaF.NFe.IBSCBSSelTot.gCBS.vDevTrib := 100;
    NotaF.NFe.IBSCBSSelTot.gCBS.vDeson := 100;
    NotaF.NFe.IBSCBSSelTot.gCBS.vCBS := 100;

    NotaF.NFe.IBSCBSSelTot.gMono.vTotIBSMono := 100;
    NotaF.NFe.IBSCBSSelTot.gMono.vTotCBSMono := 100;
    }
  ACBrNFe.NotasFiscais.GerarNFe;

end;

procedure TModelNFe.SetAdicao(AValue: TAdiCollectionItem);
begin
  if FAdicao = AValue then Exit;
  FAdicao := AValue;
end;

procedure TModelNFe.SetArma(AValue: TArmaCollectionItem);
begin
  if FArma = AValue then Exit;
  FArma := AValue;
end;

procedure TModelNFe.SetDefensivo(AValue: TdefensivoCollectionItem);
begin
  if FDefensivo = AValue then Exit;
  FDefensivo := AValue;
end;

procedure TModelNFe.SetDI(AValue: TDICollectionItem);
begin
  if FDI = AValue then Exit;
  FDI := AValue;
end;

procedure TModelNFe.SetDuplicata(AValue: TDupCollectionItem);
begin
  if FDuplicata = AValue then Exit;
  FDuplicata := AValue;
end;

procedure TModelNFe.Setgropecuario(AValue: Tagropecuario);
begin
  if Fgropecuario = AValue then Exit;
  Fgropecuario := AValue;
end;

procedure TModelNFe.SetLacre(AValue: TLacresCollectionItem);
begin
  if FLacre = AValue then Exit;
  FLacre := AValue;
end;

procedure TModelNFe.SetMedicamento(AValue: TMedCollectionItem);
begin
  if FMedicamento = AValue then Exit;
  FMedicamento := AValue;
end;

procedure TModelNFe.SetnfoPgto(AValue: TpagCollectionItem);
begin
  if FnfoPgto = AValue then Exit;
  FnfoPgto := AValue;
end;

procedure TModelNFe.SetNotaF(AValue: NotaFiscal);
begin
  if FNotaF = AValue then Exit;
  FNotaF := AValue;
end;

procedure TModelNFe.SetObsComplementar(AValue: TobsContCollectionItem);
begin
  if FObsComplementar = AValue then Exit;
  FObsComplementar := AValue;
end;

procedure TModelNFe.SetObsFisco(AValue: TobsFiscoCollectionItem);
begin
  if FObsFisco = AValue then Exit;
  FObsFisco := AValue;
end;

procedure TModelNFe.SetOk(AValue: boolean);
begin
  if FOk = AValue then Exit;
  FOk := AValue;
end;

procedure TModelNFe.SetProcReferenciado(AValue: TprocRefCollectionItem);
begin
  if FProcReferenciado = AValue then Exit;
  FProcReferenciado := AValue;
end;

procedure TModelNFe.SetProduto(AValue: TDetCollectionItem);
begin
  if FProduto = AValue then Exit;
  FProduto := AValue;
end;

procedure TModelNFe.SetRastro(AValue: TrastroCollectionItem);
begin
  if FRastro = AValue then Exit;
  FRastro := AValue;
end;

procedure TModelNFe.SetReboque(AValue: TreboqueCollectionItem);
begin
  if FReboque = AValue then Exit;
  FReboque := AValue;
end;

procedure TModelNFe.SetReferenciada(AValue: TNFrefCollectionItem);
begin
  if FReferenciada = AValue then Exit;
  FReferenciada := AValue;
end;

procedure TModelNFe.SetServico(AValue: TDetCollectionItem);
begin
  if FServico = AValue then Exit;
  FServico := AValue;
end;

procedure TModelNFe.SetVolume(AValue: TVolCollectionItem);
begin
  if FVolume = AValue then Exit;
  FVolume := AValue;
end;

procedure TModelNFe.GerarXMLIde(pVoNFe: TVoNFe);
begin
  NotaF.NFe.Ide.natOp := pVoNFe.NaturezaOperacao;
  NotaF.NFe.Ide.indPag := pVoNFe.VistaPrazoOutros;
  NotaF.NFe.Ide.modelo := pVoNFe.ModeloFiscal;
  NotaF.NFe.Ide.serie := pVoNFe.SerieNF;
  NotaF.NFe.Ide.nNF :=pVoNFe.NumNFe;
  NotaF.NFe.Ide.cNF := pVoNFe.CodNumericoNFe;
  NotaF.NFe.Ide.dEmi := pVoNFe.DtEmissao;
  NotaF.NFe.Ide.dSaiEnt := pVoNFe.DtSaida;
  NotaF.NFe.Ide.hSaiEnt := pVoNFe.HrSaida;
  NotaF.NFe.Ide.tpNF := pVoNFe.TipoNFe;
  NotaF.NFe.Ide.tpEmis := pVoNFe.TipoEmissaoNFe;
  ;
  NotaF.NFe.Ide.tpAmb := pVoNFe.TipoAmbiente;
  NotaF.NFe.Ide.verProc := '6.1.1.1'; //Versão do seu sistema
  NotaF.NFe.Ide.cUF := UFtoCUF(pVoNFe.UfOrigem);
  NotaF.NFe.Ide.cMunFG := pVoNFe.CodIBGEOrigem;
  NotaF.NFe.Ide.finNFe := pVoNFe.FinalidadeNFe;
  NotaF.NFe.Ide.tpImp := pVoNFe.TipoDanfe;
  NotaF.NFe.Ide.indIntermed := pVoNFe.IndicadorIntermediador;
  If pVoNFe.JustificativaContingencia <> '' then
  begin
    NotaF.NFe.Ide.dhCont := pVoNFe.DtContingencia;
    NotaF.NFe.Ide.xJust  := pVoNFe.JustificativaContingencia;
  End;

  // Reforma Tributária
      {
      NotaF.NFe.Ide.cMunFGIBS := StrToInt(edtEmitCodCidade.Text);
      NotaF.NFe.Ide.indMultaJuros := timjNenhum;
      NotaF.NFe.Ide.gCompraGov.tpCompraGov := tcgEstados;
      NotaF.NFe.Ide.gCompraGov.pRedutor := 5;
      NotaF.NFe.Ide.tipoNotaCredito := ''; // Aguardando GT06. A definir.
      }



    If VONfe.NFeReferenciada.Count > 1 then
    begin
      For i := 0 To VONfe.NFeReferenciada.Count - 1 do
      begin
        Referenciada := NotaF.NFe.Ide.NFref.Add;
        If VoNfe.ChaveNFeReferenciada <> '' then
        begin
           Referenciada.refNFe       := TNFeReferenciada(VoNFe.NFeReferenciada.Items[i]).ChaveAcessoNFeReferenciada; //NFe Eletronica
        end
        Else if TNFeReferenciada(VoNFe.NFeReferenciada.Items[i]).Ine <> '' then
        begin
          // Produto Rural
          Referenciada.RefNFP.cUF     := TNFeReferenciada(VoNFe.NFeReferenciada.Items[i]).UF;
          Referenciada.RefNFP.AAMM    := TNFeReferenciada(VoNFe.NFeReferenciada.Items[i]).AnoMes;
          Referenciada.RefNFP.CNPJCPF := TNFeReferenciada(VoNFe.NFeReferenciada.Items[i]).CnpjCpf;
          Referenciada.RefNFP.IE      := TNFeReferenciada(VoNFe.NFeReferenciada.Items[i]).Ine;
          Referenciada.RefNFP.modelo  := TNFeReferenciada(VoNFe.NFeReferenciada.Items[i]).ModeloFiscal;
          Referenciada.RefNFP.serie   := TNFeReferenciada(VoNFe.NFeReferenciada.Items[i]).Serie
          Referenciada.RefNFP.nNF     := TNFeReferenciada(VoNFe.NFeReferenciada.Items[i]).NumNFReferenciada;
        end
        Else if TNFeReferenciada(VoNFe.NFeReferenciada.Items[i]).NumeroECF <> '' then
        begin
          // ECF
          Referenciada.RefECF.modelo  := TNFeReferenciada(VoNFe.NFeReferenciada.Items[i]).modelo;
          Referenciada.RefECF.nECF    := TNFeReferenciada(VoNFe.NFeReferenciada.Items[i]).NumeroECF;
          Referenciada.RefECF.nCOO    := TNFeReferenciada(VoNFe.NFeReferenciada.Items[i]).NCOO;
        end
        else begin
          // Modelo 1/1A
          Referenciada.RefNFP.cUF     := TNFeReferenciada(VoNFe.NFeReferenciada.Items[i]).UF;
          Referenciada.RefNFP.AAMM    := TNFeReferenciada(VoNFe.NFeReferenciada.Items[i]).AnoMes;
          Referenciada.RefNFP.CNPJCPF := TNFeReferenciada(VoNFe.NFeReferenciada.Items[i]).CnpjCpf;
          Referenciada.RefNFP.modelo  := TNFeReferenciada(VoNFe.NFeReferenciada.Items[i]).ModeloFiscal;
          Referenciada.RefNFP.serie   := TNFeReferenciada(VoNFe.NFeReferenciada.Items[i]).Serie
          Referenciada.RefNFP.nNF     := TNFeReferenciada(VoNFe.NFeReferenciada.Items[i]).NumNFReferenciada;
        end
      end;
    end;

end;

procedure TModelNFe.GerarXMLEmitente(pVoNfe: TVoNfe);
begin
  NotaF.NFe.Emit.CNPJCPF := pVoNFe.CnpjCpfEmitente;
  NotaF.NFe.Emit.IE := pVoNFe.IneEmitente;
  NotaF.NFe.Emit.xNome := pVoNFe.NomeEmitente;
  NotaF.NFe.Emit.xFant := pVoNFe.NomeFantasia;
  NotaF.NFe.Emit.EnderEmit.fone :=pVoNFe.FoneEmitente;
  NotaF.NFe.Emit.EnderEmit.CEP := pVoNFe.CepEmitente;
  NotaF.NFe.Emit.EnderEmit.xLgr := pVoNFe.EnderecoEmitente;
  NotaF.NFe.Emit.EnderEmit.nro := pVoNFe.NumeroEnderecoEmitente;
  NotaF.NFe.Emit.EnderEmit.xCpl := pVoNFe.ComplementoEnderecoEmitente;
  NotaF.NFe.Emit.EnderEmit.xBairro :=  pVoNFe.BairroEmitente;
  NotaF.NFe.Emit.EnderEmit.cMun :=  pVoNFe.CodIBGEEmitente;
  NotaF.NFe.Emit.EnderEmit.xMun :=  pVoNFe.NomeMunicipioEmitente;
  NotaF.NFe.Emit.EnderEmit.UF :=  pVoNFe.UFEmitente;
  NotaF.NFe.Emit.enderEmit.cPais :=  pVoNFe.CodPaisEmitente;
  NotaF.NFe.Emit.enderEmit.xPais :=  pVoNFe.NomePaisEmitente;

  If pVoNFe.IneSt <> '' then
    NotaF.NFe.Emit.IEST := pVoNFe.IneSt;
  If pVoNFe.InscMunicipal <> '' then
    NotaF.NFe.Emit.IM := pVoNFe.InscMunicipal;

  // Preencher no caso de existir serviços na nota
  If pVoNFe.VlrIss > 0 then
    NotaF.NFe.Emit.CNAE := pVoNFe.CNAE;

  // esta sendo somando 1 uma vez que o ItemIndex inicia do zero e devemos
  // passar os valores 1, 2 ou 3
  // (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)
  NotaF.NFe.Emit.CRT := pVoNFe.TipoTributacaoEmpresa;

end;

procedure TModelNFe.GerarXMLNFeAvulsa(pVONfe: TVoNfe);
begin
    //Para NFe Avulsa preencha os campos abaixo
  NotaF.NFe.Avulsa.CNPJ := '';
  NotaF.NFe.Avulsa.xOrgao := '';
  NotaF.NFe.Avulsa.matr := '';
  NotaF.NFe.Avulsa.xAgente := '';
  NotaF.NFe.Avulsa.fone := '';
  NotaF.NFe.Avulsa.UF := '';
  NotaF.NFe.Avulsa.nDAR := '';
  NotaF.NFe.Avulsa.dEmi := now;
  NotaF.NFe.Avulsa.vDAR := 0;
  NotaF.NFe.Avulsa.repEmi := '';
  NotaF.NFe.Avulsa.dPag := now;
end;

procedure TModelNFe.GerarXMLDestinatario(pVoNfe: TVoNfe);
begin
  NotaF.NFe.Dest.CNPJCPF := pVoNFe.CnpjCpfDestinatario;
  NotaF.NFe.Dest.IE := pVoNFe.IneDestinatario;
  NotaF.NFe.Dest.ISUF := pVoNFe.Suframa;
  NotaF.NFe.Dest.xNome := pVoNFe.NomeDestinatario;
  NotaF.NFe.Dest.EnderEmit.fone :=pVoNFe.FoneDestinatario;
  NotaF.NFe.Dest.EnderEmit.CEP := pVoNFe.CepDestinatario;
  NotaF.NFe.Dest.EnderEmit.xLgr := pVoNFe.EnderecoDestinatario;
  NotaF.NFe.Dest.EnderEmit.nro := pVoNFe.NumeroEnderecoDestinatario;
  NotaF.NFe.Dest.EnderEmit.xCpl := pVoNFe.ComplementoEnderecoDestinatario;
  NotaF.NFe.Dest.EnderEmit.xBairro :=  pVoNFe.BairroDestinatario;
  NotaF.NFe.Dest.EnderEmit.cMun :=  pVoNFe.CodIBGEDestinatario;
  NotaF.NFe.Dest.EnderEmit.xMun :=  pVoNFe.NomeMunicipioDestinatario;
  NotaF.NFe.Dest.EnderEmit.UF :=  pVoNFe.UFDestinatario;
  NotaF.NFe.Dest.enderEmit.cPais :=  pVoNFe.CodPaisDestinatario;
  NotaF.NFe.Dest.enderEmit.xPais :=  pVoNFe.NomePaisDestinatario;

end;

procedure TModelNFe.GerarXMLRetirada(pVoNfe: TVoNfe);
begin
  //Use os campos abaixo para informar o endereço de retirada quando for diferente do Remetente/Destinatário
  if pVoNFe.CnpjCpfRetirada <> '' then
  begin
    NotaF.NFe.Retirada.CNPJCPF := pVoNFe.CnpjCpfRetirada;
    NotaF.NFe.Retirada.xLgr := pVoNFe.EnderecoRetirada;
    NotaF.NFe.Retirada.nro := pVoNFe.NumeroEnderecoRetirada;
    NotaF.NFe.Retirada.xCpl := pVoNFe.ComplementoRetirada;
    NotaF.NFe.Retirada.xBairro := pVoNFe.BairroRetirada;;
    NotaF.NFe.Retirada.cMun := pVoNFe.CodIbgeRetirada;
    NotaF.NFe.Retirada.xMun := pVoNFe.MunicipioRetirada;;
    NotaF.NFe.Retirada.UF := pVoNFe.UfRetirada;
  end;
end;

procedure TModelNFe.GerarXMLEntrega(pVoNfe: TVoNfe);
begin
  //Use os campos abaixo para informar o endereço de entrega quando for diferente do Remetente/Destinatário
  if pVoNFe.CnpjCpfEntrega <> '' then
  begin
    NotaF.NFe.Entrega.CNPJCPF := pVoNFe.CnpjCpfEntrega;
    NotaF.NFe.Entrega.xLgr := pVoNFe.EnderecoEntrega;
    NotaF.NFe.Entrega.nro := pVoNFe.NumeroEnderecoEntrega;
    NotaF.NFe.Entrega.xCpl := pVoNFe.ComplementoEntrega;
    NotaF.NFe.Entrega.xBairro := pVoNFe.BairroEntrega;;
    NotaF.NFe.Entrega.cMun := pVoNFe.CodIbgeEntrega;
    NotaF.NFe.Entrega.xMun := pVoNFe.MunicipioEntrega;;
    NotaF.NFe.Entrega.UF := pVoNFe.UfEntrega;
  end;
end;

procedure TModelNFe.GerarXMLProdutos(pVoNfe: TVoNfe);
begin
  For  i := 0 To VoNfe.Produtos.Count - 1 do
  begin
  //Adicionando Produtos
  VoProdutoNFe := TProdutoNFe(VoNfe.Produtos.Items[i]);
  Produto := NotaF.NFe.Det.New;
  Produto.Prod.nItem := i;
  // Número sequencial, para cada item deve ser incrementado
  Produto.Prod.cProd := VoProdutoNFe.Codigo;
  Produto.Prod.cEAN := VoProdutoNFe.CodigoBarra;
  Produto.Prod.xProd := VoProdutoNFe.Descricao;
  Produto.Prod.NCM := VoProdutoNFe.NCM;
  Produto.Prod.EXTIPI := VoProdutoNFe.EXTPIPI;
  Produto.Prod.CFOP := VoProdutoNFe.CFOP;
  Produto.Prod.uCom := VoProdutoNFe.Unidade;
  Produto.Prod.qCom := VoProdutoNFe.Qtdade;
  Produto.Prod.vUnCom := VoProdutoNFe.VlrUnitario;
  Produto.Prod.vProd := VoProdutoNFe.VlrUnitario * VoProdutoNFe.Qtdade;

  Produto.Prod.cEANTrib := VoProdutoNFe.CodigoBarra;
  Produto.Prod.uTrib := VoProdutoNFe.Unidade;
  Produto.Prod.qTrib := VoProdutoNFe.Qtdade;
  Produto.Prod.vUnTrib := VoProdutoNFe.VlrUnitario;

  Produto.Prod.vOutro := VoProdutoNFe.VlrOutrasDespesas;
  Produto.Prod.vFrete := VoProdutoNFe.VlrFrete;
  Produto.Prod.vSeg := VoProdutoNFe.VlrSeguro;
  Produto.Prod.vDesc :=VoProdutoNFe.VlrDesconto;

  If VoProdutoNFe.Cest <> '' then
  Produto.Prod.CEST := VoProdutoNFe.Cest

  Produto.infAdProd := VoProdutoNFe.ObsProduto;

    {
      abaixo os campos incluidos no layout a partir da NT 2020/005
    }
  // Opcional - Preencher com o Código de Barras próprio ou de terceiros que seja diferente do padrão GTIN
  // por exemplo: código de barras de catálogo, partnumber, etc
  If VoProdutoNFe.CodigoBarraSemValidacao <> '' then
  Produto.Prod.cBarra := VoProdutoNFe.CodigoBarraSemValidacao;

  // Opcional - Preencher com o Código de Barras próprio ou de terceiros que seja diferente do padrão GTIN
  //  correspondente àquele da menor unidade comercializável identificado por Código de Barras
  // por exemplo: código de barras de catálogo, partnumber, etc
  If VoProdutoNFe.CodigoBarraSemValidacao <> '' then
  Produto.Prod.cBarraTrib := VoProdutoNFe.CodigoBarraSemValidacao;

    GerarXMLDeclaracaoImportacao(VoProdutoNFe); //*
    GerarXMLVeiculosNovos(VoProdutoNFe); //*
    GerarXMLRastreabilidade(VoProdutoNFe); //*
    GerarXMLMedicamentos(VoProdutoNFe); //*
    GerarXMLArmamento(VoProdutoNFe); //*
    GErarXMLAgropecuario(VoProdutoNFe); //*
    GerarXMLImposto(VoProdutoNFe);
    GErarXMLImpostosIcmsSimples(VoProdutoNFe);
    GErarXMLImpostosPisCofins(VoProdutoNFe);
    GErarXMLImpostosIpi(VoProdutoNFe);
    GErarXMLImpostosImportacao(VoProdutoNFe);




end;

end;

// Pronto
procedure TModelNFe.GerarXMLDeclaracaoImportacao(pVoProdutoNFe : TVoProdutosNFe);
begin
  // Declaração de Importação. Pode ser adicionada várias através do comando Prod.DI.Add
    (*
    DI := Produto.Prod.DI.Add;
    DI.nDi         := '';
    DI.dDi         := now;
    DI.xLocDesemb  := '';
    DI.UFDesemb    := '';
    DI.dDesemb     := now;
    {
      tvMaritima, tvFluvial, tvLacustre, tvAerea, tvPostal, tvFerroviaria, tvRodoviaria,

      abaixo os novos valores incluidos a partir da NT 2020/005

      tvConduto, tvMeiosProprios, tvEntradaSaidaFicta, tvCourier, tvEmMaos, tvPorReboque
    }
    DI.tpViaTransp := tvRodoviaria;
    DI.vAFRMM := 0;
    {
      tiContaPropria, tiContaOrdem, tiEncomenda
    }
    DI.tpIntermedio := tiContaPropria;
    DI.CNPJ := '';
    DI.UFTerceiro := '';
    DI.cExportador := '';

    Adicao := DI.adi.Add;
    Adicao.nAdicao     := 1;
    Adicao.nSeqAdi     := 1;
    Adicao.cFabricante := '';
    Adicao.vDescDI     := 0;
    Adicao.nDraw       := '';
    *)

end;

// Pronto
procedure TModelNFe.GerarXMLVeiculosNovos(pVoProdutoNFe : TVoProdutosNFe);
begin
  //Campos para venda de veículos novos

 (* Produto.Prod.veicProd.tpOP := toVendaConcessionaria;
  Produto.Prod.veicProd.chassi := '';
  Produto.Prod.veicProd.cCor := '';
  Produto.Prod.veicProd.xCor := '';
  Produto.Prod.veicProd.pot := '';
  Produto.Prod.veicProd.Cilin := '';
  Produto.Prod.veicProd.pesoL := '';
  Produto.Prod.veicProd.pesoB := '';
  Produto.Prod.veicProd.nSerie := '';
  Produto.Prod.veicProd.tpComb := '';
  Produto.Prod.veicProd.nMotor := '';
  Produto.Prod.veicProd.CMT := '';
  Produto.Prod.veicProd.dist := '';
  Produto.Prod.veicProd.anoMod := 0;
  Produto.Prod.veicProd.anoFab := 0;
  Produto.Prod.veicProd.tpPint := '';
  Produto.Prod.veicProd.tpVeic := 0;
  Produto.Prod.veicProd.espVeic := 0;
  Produto.Prod.veicProd.VIN := '';
  Produto.Prod.veicProd.condVeic := cvAcabado;
  Produto.Prod.veicProd.cMod := ''; *)

end;

// Pronto
procedure TModelNFe.GerarXMLRastreabilidade(pVoProdutoNFe : TVoProdutosNFe);
begin
  // Campos de Rastreabilidade do produto
    {
    O grupo <rastro> permiti a rastreabilidade de qualquer produto sujeito a
    regulações sanitárias, casos de recolhimento/recall, além de defensivos agrícolas,
    produtos veterinários, odontológicos, medicamentos, bebidas, águas envasadas,
    embalagens, etc., a partir da indicação de informações de número de lote,
    data de fabricação/produção, data de validade, etc.
    Obrigatório o preenchimento deste grupo no caso de medicamentos e
    produtos farmacêuticos.
    }

  // Ocorrências: 0 - 500
    (*
    Rastro := Produto.Prod.rastro.Add;

    Rastro.nLote  := '17H8F5';
    Rastro.qLote  := 1;
    Rastro.dFab   := StrToDate('01/08/2017');
    Rastro.dVal   := StrToDate('01/08/2019');
    Rastro.cAgreg := ''; // Código de Agregação (opcional) de 1 até 20 dígitos
    *)
end;

// Pronto
procedure TModelNFe.GerarXMLMedicamentos(pVoProdutoNFe : TVoProdutosNFe);
begin
  //Campos específicos para venda de medicamentos

  // Ocorrências: 1 - 500 ==> 1 - 1 (4.00)
    (*
    Medicamento := Produto.Prod.med.Add;

    Medicamento.cProdANVISA := '1256802470029';
    Medicamento.vPMC        := 100.00; // Preço máximo consumidor
    *)

end;

// Pronto
procedure TModelNFe.GerarXMLArmamento(pVoProdutoNFe : TVoProdutosNFe);
begin

    //Campos específicos para venda de armamento
      (*
      Arma := Produto.Prod.arma.Add;
      Arma.nSerie := 0;
      Arma.tpArma := taUsoPermitido;
      Arma.nCano  := 0;
      Arma.descr  := '';
      *)
end;

// Pronto
procedure TModelNFe.GErarXMLAgropecuario(pVoProdutoNFe : TVoProdutosNFe);
begin
    //Campos específicos para agropecuario / defensivo
  // Devemos gerar somente o grupo defensivo ou o grupo guiaTransito
  (*
    Defensivo := Agropecuario.defensivo.Add;
    Defensivo.nReceituario := '123';
    Defensivo.CPFRespTec := '12345678901';
  *)

  //Campos específicos para agropecuario / guiaTransito
  (*
    Agropecuario.guiaTransito.tpGuia := tpgGuiaFlorestal;
    Agropecuario.guiaTransito.UFGuia := 'SP';
    Agropecuario.guiaTransito.serieGuia := '1';
    Agropecuario.guiaTransito.nGuia := '1';
  *)

end;

procedure TModelNFe.GerarXMLImposto(pVoProdutoNFe : TVoProdutosNFe);
begin
    // Reforma Tributária
      {
      Produto.DFeReferenciado.chaveAcesso := '';
      Produto.DFeReferenciado.nItem := 1;
      }
     GErarXMLImpostosIcmsSimples(pVoProdutoNFe : TVoProdutosNFe);

      with ICMSUFDest do
      begin
        // partilha do ICMS e fundo de probreza
        vBCUFDest := 0.00;
        pFCPUFDest := 0.00;
        pICMSUFDest := 0.00;
        pICMSInter := 0.00;
        pICMSInterPart := 0.00;
        vFCPUFDest := 0.00;
        vICMSUFDest := 0.00;
        vICMSUFRemet := 0.00;
      end;

      GErarXMLImpostosIpi(pVoProdutoNFe);
      GErarXMLImpostosImportacao(pVoProdutoNfe);
      GErarXMLImpostosPisCofins(pVoProdutoNfe);

      // Reforma Tributária
        {
        IBSCBSSel.CST := 100;
        IBSCBSSel.cClassTrib := 100000;
        IBSCBSSel.indPerecimento := tipNenhum;

        IBSCBSSel.seletivo.CST := 100;
        IBSCBSSel.seletivo.cClassTrib := 100000;

        IBSCBSSel.seletivo.gImpSel.vBCImpSel := 100;
        IBSCBSSel.seletivo.gImpSel.pImpSel := 5;
        IBSCBSSel.seletivo.gImpSel.pImpSelEspec := 5;
        IBSCBSSel.seletivo.gImpSel.uTrib := 'UNIDAD';
        IBSCBSSel.seletivo.gImpSel.qTrib := 10;
        IBSCBSSel.seletivo.gImpSel.vImpSel := 100;

        IBSCBSSel.gIBSCBS.vBC := 100;

        IBSCBSSel.gIBSCBS.gIBSUF.pIBSUF := 5;
        IBSCBSSel.gIBSCBS.gIBSUF.vTribOP := 100;
        IBSCBSSel.gIBSCBS.gIBSUF.vIBSUF := 100;

        IBSCBSSel.gIBSCBS.gIBSUF.gDif.pDif := 5;
        IBSCBSSel.gIBSCBS.gIBSUF.gDif.pDif := 100;

        IBSCBSSel.gIBSCBS.gIBSUF.gDevTrib.vDevTrib := 100;

        IBSCBSSel.gIBSCBS.gIBSUF.gRed.pRedAliq := 5;
        IBSCBSSel.gIBSCBS.gIBSUF.gRed.pAliqEfet := 5;

        IBSCBSSel.gIBSCBS.gIBSUF.gDeson.CST := 100;
        IBSCBSSel.gIBSCBS.gIBSUF.gDeson.cClassTrib := 100000;
        IBSCBSSel.gIBSCBS.gIBSUF.gDeson.vBC := 100;
        IBSCBSSel.gIBSCBS.gIBSUF.gDeson.pAliq := 5;
        IBSCBSSel.gIBSCBS.gIBSUF.gDeson.vDeson := 100;

        IBSCBSSel.gIBSCBS.gIBSMun.pIBSMun := 5;
        IBSCBSSel.gIBSCBS.gIBSMun.vTribOP := 100;
        IBSCBSSel.gIBSCBS.gIBSMun.vIBSMun := 100;

        IBSCBSSel.gIBSCBS.gIBSMun.gDif.pDif := 5;
        IBSCBSSel.gIBSCBS.gIBSMun.gDif.pDif := 100;

        IBSCBSSel.gIBSCBS.gIBSMun.gDevTrib.vDevTrib := 100;

        IBSCBSSel.gIBSCBS.gIBSMun.gRed.pRedAliq := 5;
        IBSCBSSel.gIBSCBS.gIBSMun.gRed.pAliqEfet := 5;

        IBSCBSSel.gIBSCBS.gIBSMun.gDeson.CST := 100;
        IBSCBSSel.gIBSCBS.gIBSMun.gDeson.cClassTrib := 100000;
        IBSCBSSel.gIBSCBS.gIBSMun.gDeson.vBC := 100;
        IBSCBSSel.gIBSCBS.gIBSMun.gDeson.pAliq := 5;
        IBSCBSSel.gIBSCBS.gIBSMun.gDeson.vDeson := 100;

        IBSCBSSel.gIBSCBS.gIBSCredPres.cCredPres := 1;
        IBSCBSSel.gIBSCBS.gIBSCredPres.pCredPres := 5;
        IBSCBSSel.gIBSCBS.gIBSCredPres.vCredPres := 100;
        IBSCBSSel.gIBSCBS.gIBSCredPres.vCredPresCondSus := 100;

        IBSCBSSel.gIBSCBS.gCBS.pCBS := 5;
        IBSCBSSel.gIBSCBS.gCBS.vTribOp := 100;
        IBSCBSSel.gIBSCBS.gCBS.vCBS := 100;

        IBSCBSSel.gIBSCBS.gCBS.gCBSCredPres.cCredPres := 1;
        IBSCBSSel.gIBSCBS.gCBS.gCBSCredPres.pCredPres := 5;
        IBSCBSSel.gIBSCBS.gCBS.gCBSCredPres.vCredPres := 100;
        IBSCBSSel.gIBSCBS.gCBS.gCBSCredPres.vCredPresCondSus := 100;

        IBSCBSSel.gIBSCBS.gCBS.gDif.pDif := 5;
        IBSCBSSel.gIBSCBS.gCBS.gDif.pDif := 100;

        IBSCBSSel.gIBSCBS.gCBS.gDevTrib.vDevTrib := 100;

        IBSCBSSel.gIBSCBS.gCBS.gRed.pRedAliq := 5;
        IBSCBSSel.gIBSCBS.gCBS.gRed.pAliqEfet := 5;

        IBSCBSSel.gIBSCBS.gCBS.gDeson.CST := 100;
        IBSCBSSel.gIBSCBS.gCBS.gDeson.cClassTrib := 100000;
        IBSCBSSel.gIBSCBS.gCBS.gDeson.vBC := 100;
        IBSCBSSel.gIBSCBS.gCBS.gDeson.pAliq := 5;
        IBSCBSSel.gIBSCBS.gCBS.gDeson.vDeson := 100;

        IBSCBSSel.gIBSCBSMono.qBCMono := 1;
        IBSCBSSel.gIBSCBSMono.adRemIBS := 5;
        IBSCBSSel.gIBSCBSMono.adRemCBS := 5;
        IBSCBSSel.gIBSCBSMono.vIBSMono := 100;
        IBSCBSSel.gIBSCBSMono.vCBSMono := 100;
        IBSCBSSel.gIBSCBSMono.qBCMonoReten := 1;
        IBSCBSSel.gIBSCBSMono.adRemIBSREten := 5;
        IBSCBSSel.gIBSCBSMono.vIBSMonoReten := 100;
        IBSCBSSel.gIBSCBSMono.pCredPresIBS := 5;
        IBSCBSSel.gIBSCBSMono.vCRedPresIBS := 100;
        IBSCBSSel.gIBSCBSMono.pCredPresCBS := 5;
        IBSCBSSel.gIBSCBSMono.vCredPresCBS := 100;
        IBSCBSSel.gIBSCBSMono.pDifIBS := 5;
        IBSCBSSel.gIBSCBSMono.vIBSMonoDif := 100;
        IBSCBSSel.gIBSCBSMono.pDifCBS := 5;
        IBSCBSSel.gIBSCBSMono.vCBSMonoDif := 100;
        IBSCBSSel.gIBSCBSMono.vTotIBSMono := 100;
        IBSCBSSel.gIBSCBSMono.vTotCBSMono := 100;
        }
    end;

procedure TModelNFe.GErarXMLImpostosPisCofins(pVoNfe: TVoNfe);
begin

end;

procedure TModelNFe.GErarXMLImpostosIpi(pVoNfe: TVoNfe);
begin

end;

procedure TModelNFe.GErarXMLImpostosImportacao(pVoNfe: TVoNfe);
begin

end;


procedure TModelNFe.GErarXMLImpostosIcmsSimples(pVoProdutoNFe : TVoProdutosNFe);
begin
    // lei da transparencia nos impostos
    Produto.Imposto.vTotTrib := pVoProdutoNFe.VlrTotalImpostos;

      // caso o CRT seja:
      // 1=Simples Nacional
      // Os valores aceitos para CSOSN são:
      // csosn101, csosn102, csosn103, csosn201, csosn202, csosn203,
      // csosn300, csosn400, csosn500,csosn900

      // 2=Simples Nacional, excesso sublimite de receita bruta;
      // ou 3=Regime Normal.
      // Os valores aceitos para CST são:
      // cst00, cst10, cst20, cst30, cst40, cst41, cst45, cst50, cst51,
      // cst60, cst70, cst80, cst81, cst90, cstPart10, cstPart90,
      // cstRep41, cstVazio, cstICMSOutraUF, cstICMSSN, cstRep60

      // (consulte o contador do seu cliente para saber qual deve ser utilizado)
      // Pode variar de um produto para outro.

      Produto.Imposto.orig := pVoProdutoNFe.OrigemProduto;

      if NotaF.NFe.Emit.CRT in [crtSimplesExcessoReceita, crtRegimeNormal] then
      begin
        Produto.Imposto.ICMS.CST := pVoProdutoNFe.CstIcms;

        Produto.Imposto.ICMS.modBC := pVoProdutoNFe.DeterminacaoBaseIcms;
        Produto.Imposto.ICMS.vBC := pVoProdutoNFe.VlrBaseIcms;
        Produto.Imposto.ICMS.pICMS := pVoProdutoNFe.PerIcms;
        Produto.Imposto.ICMS.vICMS := pVoProdutoNFe.VlrIcms;
        Produto.Imposto.ICMS.modBCST := pVoProdutoNFe.DeterminacaoBaseIcmsSt;
        Produto.Imposto.ICMS.pMVAST := pVoProdutoNFe.PerMvaSt;
        Produto.Imposto.ICMS.pRedBCST := pVoProdutoNFe.PerReducaoBaseSt;
        Produto.Imposto.ICMS.vBCST := pVoProdutoNFe.VlrBaseIcmsSt;
        Produto.Imposto.ICMS.pICMSST := pVoProdutoNFe.PerIcmsSt;
        Produto.Imposto.ICMS.vICMSST := pVoProdutoNFe.VlrIcmsSt;
        Produto.Imposto.ICMS.pRedBC := pVoProdutoNFe.PerReducaoBaseIcms;
      end
      else
      begin
        Produto.Imposto.ICMS.CSOSN := pVoProdutoNFe.CstSimples;
        Produto.Imposto.ICMS.modBC :=  pVoProdutoNFe.DeterminacaoBaseIcms;
        Produto.Imposto.ICMS.pCredSN := pVoProdutoNFe.PerCreditoSimplesNacional;
        Produto.Imposto.ICMS.vCredICMSSN := pVoProdutoNFe.VlrCreditoSimplesNacional;
        Produto.Imposto.ICMS.vBC := 0;
        Produto.Imposto.ICMS.pICMS := 0;
        Produto.Imposto.ICMS.vICMS := 0;
        Produto.Imposto.ICMS.modBCST :=  pVoProdutoNFe.DeterminacaoBaseIcmsSt;
        Produto.Imposto.ICMS.pMVAST := 0;
        Produto.Imposto.ICMS.pRedBCST := 0;
        Produto.Imposto.ICMS.vBCST := 0;
        Produto.Imposto.ICMS.pICMSST := 0;
        Produto.Imposto.ICMS.vICMSST := 0;
      end;

      GerarXMLFundoPobreza(pVoProdutoNFe);

      // Tipo de Tributacao 60
      Produto.Imposto.ICMS.pRedBCEfet := 0;
      Produto.Imposto.ICMS.vBCEfet := 0;
      Produto.Imposto.ICMS.pICMSEfet := 0;
      Produto.Imposto.ICMS.vICMSEfet := 0;
      // Informar apenas nos motivos de desoneração documentados abaixo

      If pVoProdutoNFe.VlrIcmsStDesonerado > 0 then
      begin
      Produto.Imposto.ICMS.vICMSSTDeson := 0;
      Produto.Imposto.ICMS.motDesICMSST := mdiOutros;

      // Percentual do diferimento do ICMS relativo ao Fundo de Combate à Pobreza (FCP).
      // No caso de diferimento total, informar o percentual de diferimento "100"
      Produto.Imposto.ICMS.pFCPDif := 0;
      // Valor do ICMS relativo ao Fundo de Combate à Pobreza (FCP) diferido
      Produto.Imposto.ICMS.vFCPDif := 0;
      // Valor do ICMS relativo ao Fundo de Combate à Pobreza (FCP) realmente devido.
      Produto.Imposto.ICMS.vFCPEfet := 0;

      end;

end;

procedure TModelNFe.GErarXMLFundoPobreza(pVoProdutoNFe: TVoProdutoNfe);
begin
      Produto.Imposto.ICMS.vBCFCPST := 0;
      Produto.Imposto.ICMS.pFCPST := 0;
      Produto.Imposto.ICMS.vFCPST := 0;
      Produto.Imposto.ICMS.vBCSTRet := 0;
      Produto.Imposto.ICMS.pST := 0;
      Produto.Imposto.ICMS.vICMSSubstituto := 0;
      Produto.Imposto.ICMS.vICMSSTRet := 0;
      Produto.Imposto.ICMS.vBCFCPSTRet := 0;
      Produto.Imposto.ICMS.pFCPSTRet := 0;
      Produto.Imposto.ICMS.vFCPSTRet := 0;
end;

procedure TModelNFe.GErarXMLImpostosPisCofins(pVoProdutoNFe: TVoProdutosNFe);
begin

end;

procedure TModelNFe.GErarXMLImpostosIpi(pVoProdutoNFe: TVoProdutosNFe);
begin
  (*
  // IPI, se hpouver...
  with IPI do
  begin
    CST      := ipi99;
    clEnq    := '999';
    CNPJProd := '';
    cSelo    := '';
    qSelo    := 0;
    cEnq     := '';

    vBC    := 100;
    qUnid  := 0;
    vUnid  := 0;
    pIPI   := 5;
    vIPI   := 5;
  end;
  *)


end;

procedure TModelNFe.GErarXMLImpostosImportacao(pVoProdutoNFe: TVoProdutosNFe);
begin
  with II do
  begin
    II.vBc := 0;
    II.vDespAdu := 0;
    II.vII := 0;
    II.vIOF := 0;
  end;
end;

procedure TModelNFe.GErarXMLImpostosPisCofins(pVoNfe: TVoNfe);
begin
  GErarXML

end;

procedure TModelNFe.GErarXMLImpostosIpi(pVoNfe: TVoNfe);
begin

end;

procedure TModelNFe.GErarXMLImpostosImportacao(pVoNfe: TVoNfe);
begin

end;


end.
