unit utils_funcoes;

{$mode ObjFPC}{$H+}

interface

uses
  Windows, Classes, SysUtils, Graphics, Controls, ExtCtrls,
  DB, BufDataset, Process, LResources, md5;

type
  TInformacaoArquivoRec = record
    NomeArquivo: string;
    Tamanho: integer;
    DtCriacao: TDateTime;
    DtAlteracao: TDateTime;
    HashMD5: string;
  end;


  { TUtilFuncoes }
  TUtilFuncoes = class
  public
    class function Extract(pPosicao: integer; pStringOrigem: string;
      pDelimitador: char): string;
    class function SomenteNumeros(pValue: string): string;
    class function ObterIdProcesso: integer;
    class function PingHost(const AHost: string; ATimeoutPing: integer;
      ASocksTimeout: integer): boolean;
    class function StrZero(pNumero, pQtdZeros: integer): string;
    class function FormatarCnpjCpf(pValue: string): string;
    class function FormatarTelefone(pValue: string): string;
    class function OkView: integer;
    class function CloseView: integer;
    class procedure Centralizar(Parent, Child: TWinControl);
    class procedure CentralizarShape(Parent : TWinControl; Child: TShape);
    class procedure CentralizarImagem(Parent : TWinControl; Child: TImage);


    class function SortBufDataSet(DataSet: TBufDataSet;
      const FieldName: string): boolean;
    class function Unscapechars(pValue: string): string;
    class function ObterGuid: string;
    class procedure GerarLog(pMensagem, pNomeArquivo: string);
    class function ConverterFormatoData(pValor: string): string;
    class function FormatarData(pStrData: string): string;
    class function ObterCorZebra: TColor;
    class function StrToValor(pValor: string): currency;
    class procedure ExecutarProgramaExterno(const NomePrograma: string;
      const pPrimeiro, pSegundo: string);
    class procedure GravarTxt(pValue, pNomeArquivo: string);
    class function ifThenInteger(pExpressao: boolean;
      pVerdadeiro, pFalso: integer): integer;
    class function Extract_ResFileTo(AResName: string; ASaveFileTo: string): string;
    class function PesquisarArquivos(pPasta, pExtensao: string;
      var pStringList: TStringList): boolean;
    class function ObterAtributosArquivo(pArquivo: string): TInformacaoArquivoRec;
    class function ObterMD5Arquivo(pArquivo: string): string;
    class function ObterIpDuosig(pValue: string): string;
    class function ObterDatabaseDuosig(pValue: string): string;
    class function FilterNumbers(pValue: string): string;


  end;


const
  VK_F1 = 112;
  VK_F2 = 113;
  VK_F3 = 114;
  VK_F4 = 115;
  VK_F5 = 116;
  VK_F6 = 117;
  VK_F7 = 118;
  VK_F8 = 119;
  VK_F9 = 120;
  VK_ESCAPE = 27;

implementation


{ TUtilFuncoes }

class function TUtilFuncoes.Extract(pPosicao: integer; pStringOrigem: string;
  pDelimitador: char): string;
begin
end;

class function TUtilFuncoes.SomenteNumeros(pValue: string): string;
var
  i: integer;
  ok: boolean;
begin
  Result := '';
  for i := 1 to Length(pValue) do
  begin
    Ok := CharInSet(pValue[i], ['0'..'9']);
    if not Ok then
    begin
      if pValue[i] = ',' then
        ok := True;
    end;
    if Ok then
      Result := Result + pValue[i];
  end;
end;

class function TUtilFuncoes.ObterIdProcesso: integer;
var
  hdl: THandle;
  pid: DWORD;
begin
  pid := GetCurrentProcessId;
  Result := pid;
end;

class function TUtilFuncoes.PingHost(const AHost: string; ATimeoutPing: integer;
  ASocksTimeout: integer): boolean;
{var
  VPing: TPingSend;}
begin
{  Result := False;
  if (AHost = '') then
    Exit;
  VPing := TPingSend.Create;
  try
    VPing.Sock.CloseSocket;
    VPing.Sock.Purge;
    VPing.Sock.SetTimeout(ASocksTimeout);
    VPing.Sock.SetSendTimeout(ASocksTimeout);
    VPing.Sock.SetRecvTimeout(ASocksTimeout);
    VPing.Timeout := ATimeoutPing;
    try
      Result := VPing.Ping(AHost);
      if Result then
        Result := (VPing.ReplyError = IE_NoError);
    except
      Result := False;
    end;
    VPing.Sock.CloseSocket;
  finally
    VPing.Free;
  end;}
end;

class function TUtilFuncoes.StrZero(pNumero, pQtdZeros: integer): string;
begin
  Result := StringOfChar('0', pQtdZeros - Length(IntToStr(pNumero))) + IntToStr(pNumero);
end;

class function TUtilFuncoes.FormatarCnpjCpf(pValue: string): string;
begin
  pValue := StringReplace(pValue, '/', '', [rfReplaceAll]);
  pValue := StringReplace(pValue, '-', '', [rfReplaceAll]);
  pValue := StringReplace(pValue, '.', '', [rfReplaceAll]);
  pValue := StringReplace(pValue, ',', '', [rfReplaceAll]);
  pValue := StringReplace(pValue, ';', '', [rfReplaceAll]);
  if Length(PValue) = 11 then
    Result := Copy(pValue, 1, 3) + '.' + Copy(pValue, 4, 3) + '.' +
      Copy(pValue, 7, 3) + '-' + Copy(pValue, 10, 2)
  else
    Result := Copy(pValue, 1, 2) + '.' + Copy(pValue, 3, 3) + '.' +
      Copy(pValue, 6, 3) + '/' + Copy(pValue, 9, 4) + '-' + Copy(pValue, 13, 4);
end;

class function TUtilFuncoes.FormatarTelefone(pValue: string): string;
var
  LDDD: string;
  LNumTelefone: string;
begin
  pValue := FilterNumbers(pValue);
  if Length(pValue) <= 9 then
    LDDD := '00'
  else
    LDDD := Copy(pValue, 1, 2);

end;

class function TUtilFuncoes.OkView: integer;
begin
  Result := 1;
end;

class function TUtilFuncoes.CloseView: integer;
begin
  Result := 0;
end;

class procedure TUtilFuncoes.Centralizar(Parent, Child: TWinControl);
begin
  Child.Left := (Parent.Width - Child.Width) div 2;
  Child.Top := (Parent.Height - Child.Height) div 2;
end;

class procedure TUtilFuncoes.CentralizarShape(Parent : TWinControl; Child: TShape);
begin
  Child.Left := (Parent.Width - Child.Width) div 2;
  Child.Top := (Parent.Height - Child.Height) div 2;
end;

class procedure TUtilFuncoes.CentralizarImagem(Parent: TWinControl; Child: TImage);
begin
  Child.Left := (Parent.Width - Child.Width) div 2;
  Child.Top := (Parent.Height - Child.Height) div 2;
end;

class function TUtilFuncoes.SortBufDataSet(DataSet: TBufDataSet;
  const FieldName: string): boolean;
var
  i: integer;
  IndexDefs: TIndexDefs;
  IndexName: string;
  IndexOptions: TIndexOptions;
  Field: TField;
begin
  Result := False;
  Field := DataSet.Fields.FindField(FieldName);
  //If invalid field name, exit.
  if Field = nil then Exit;
  //if invalid field type, exit.
  if (Field is TBlobField) or (Field is TVariantField) or (Field is TBinaryField) then
    Exit;

  IndexDefs := DataSet.IndexDefs;
  IndexName := DataSet.IndexName;  //Ensure IndexDefs is up-to-date

  IndexDefs.Updated := False;
  {<<<<---This line is critical as IndexDefs.Update will do nothing on the next sort if it's already true}
  IndexDefs.Update;
  //If an ascending index is already in use,
  //switch to a descending index
  if IndexName = FieldName + '__IdxA' then
  begin
    IndexName := FieldName + '__IdxD';
    IndexOptions := [ixDescending];
  end
  else
  begin
    IndexName := FieldName + '__IdxA';
    IndexOptions := [];
  end;
  //Look for existing index
  for i := 0 to Pred(IndexDefs.Count) do
  begin
    if IndexDefs[i].Name = IndexName then
    begin
      Result := True;
      Break;
    end; //if
  end; // for
  //If existing index not found, create one
  if not Result then
  begin
    if IndexName = FieldName + '__IdxD' then
      DataSet.AddIndex(IndexName, FieldName, IndexOptions, FieldName)
    else
      DataSet.AddIndex(IndexName, FieldName, IndexOptions);
    Result := True;
  end; // if not
  DataSet.IndexName := IndexName;
end;

class function TUtilFuncoes.Unscapechars(pValue: string): string;
begin
  Result := StringReplace(pValue, '\u0026', '&', [rfReplaceAll]);
end;

class function TUtilFuncoes.ObterGuid: string;
var
  Guid: TGuid;
begin
  CreateGUID(Guid);
  Result := Guid.ToString(True);
end;

class procedure TUtilFuncoes.GerarLog(pMensagem, pNomeArquivo: string);
var
  st: TStringList;
begin
  st := TStringList.Create;
  try
    st.Text := pMensagem;
    st.SaveToFile(pNomeArquivo);

  finally
    St.Free;
  end;
end;

class function TUtilFuncoes.ConverterFormatoData(pValor: string): string;
var
  Ano, Mes, Dia: string;
begin
  Result := '';
  if pValor <> '' then
  begin
    Ano := Copy(pValor, 1, 4);
    Mes := Copy(pValor, 6, 2);
    Dia := Copy(pValor, 9, 2);
    Result := Dia + '/' + Mes + '/' + Ano;
  end;
end;

class function TUtilFuncoes.FormatarData(pStrData: string): string;
begin
  pStrData := StringReplace(pStrData, '/', '', [rfReplaceAll]);
  if Length(pStrData) = 6 then
  begin
    Result := Copy(pStrData, 1, 2) + '/' + Copy(pStrData, 3, 2) +
      '/' + Copy(pStrData, 5, 2);
  end
  else if Length(pStrData) = 8 then
  begin
    Result := Copy(pStrData, 1, 2) + '/' + Copy(pStrData, 3, 2) +
      '/' + Copy(pStrData, 5, 4);
  end
  else
    Result := '';
end;

class function TUtilFuncoes.ObterCorZebra: TColor;
begin
  Result := $00FDFDF2;
end;

class function TUtilFuncoes.StrToValor(pValor: string): currency;
begin
  pValor := StringReplace(pValor, '.', '', [rfReplaceAll]);
  pValor := StringReplace(pValor, 'R', '', [rfReplaceAll]);
  pValor := StringReplace(pValor, '$', '', [rfReplaceAll]);
  Result := StrToFloatDef(pValor, 0);
end;

class procedure TUtilFuncoes.ExecutarProgramaExterno(const NomePrograma: string;
  const pPrimeiro, pSegundo: string);
var
  Processo: TProcess;
begin
  Processo := TProcess.Create(nil);
  try
    Processo.Executable := NomePrograma;
    Processo.Parameters.Add(pPrimeiro);
    Processo.Parameters.Add(pSegundo);

    Processo.Options := [];
    Processo.Execute;
  finally
    Processo.Free;
  end;
end;

class procedure TUtilFuncoes.GravarTxt(pValue, pNomeArquivo: string);
var
  LSt: TStringList;
begin
  LST := TStringList.Create;
  try
    LSt.Text := pValue;
    Lst.SaveToFile(pNomeArquivo);
  finally
    LSt.Free;
  end;
end;

class function TUtilFuncoes.ifThenInteger(pExpressao: boolean;
  pVerdadeiro, pFalso: integer): integer;
begin
  if pExpressao then
    Result := pVerdadeiro
  else
    Result := pFalso;
end;

class function TUtilFuncoes.Extract_ResFileTo(AResName: string;
  ASaveFileTo: string): string;
var
  res: TLResource;
  st: TLazarusResourceStream;
begin
  Result := emptyStr;
  st := nil;
  if Result = emptyStr then
  begin
    if not DirectoryExists(ExtractFilePath(ASaveFileTo)) then
    begin
      // Cria o diretório de extração caso ele não exista
      if not ForceDirectories(ExtractFilePath(ASaveFileTo)) then
      begin
        Result := 'Diretorio não existe: ' + ExtractFilePath(ASaveFileTo);
      end;
    end;
  end;
  if Result = emptyStr then
  begin
    res := LazarusResources.Find(AResName);
    if res = nil then
    begin
      Result := 'RC com nome "' + AResName + '" não foi encontrada.';
    end
    else
    begin
      try
        st := TLazarusResourceStream.Create(AResName, nil);
        // salvando no disco
        st.SaveToFile(ASaveFileTo);
      finally
        st.Free;
      end;
    end;
  end;
end;

class function TUtilFuncoes.PesquisarArquivos(pPasta, pExtensao: string;
  var pStringList: TStringList): boolean;
var
  SearchRec: TSearchRec;
  Res: integer;
begin
  // Procura por arquivos com a extensão especificada na pasta atual
  Res := FindFirst(pPasta + PathDelim + pExtensao, faAnyFile, SearchRec);
  try
    while Res = 0 do
    begin
      // Adiciona o caminho completo do arquivo encontrado à lista
      if (SearchRec.Attr and faDirectory) = 0 then
        pStringList.Add(pPasta + PathDelim + SearchRec.Name);

      Res := FindNext(SearchRec);
    end;
  finally
    FindClose(SearchRec);
  end;

  // Procura por subpastas na pasta atual
  Res := FindFirst(pPasta + PathDelim + '*', faDirectory, SearchRec);
  try
    while Res = 0 do
    begin
      if ((SearchRec.Attr and faDirectory) <> 0) and (SearchRec.Name <> '.') and
        (SearchRec.Name <> '..') then
      begin
        // Chamada recursiva para a subpasta encontrada
        PesquisarArquivos(pPasta + PathDelim + SearchRec.Name, pExtensao, pStringList);
      end;
      Res := FindNext(SearchRec);
    end;
  finally
    FindClose(SearchRec);
  end;
  Result := True;
end;

class function TUtilFuncoes.ObterAtributosArquivo(pArquivo: string):
TInformacaoArquivoRec;
var
  SearchRec: TSearchRec;
begin

  if FindFirst(pArquivo, faAnyFile, SearchRec) = 0 then
  try
    Result.Tamanho := SearchRec.Size;
    Result.DtAlteracao := FileDateToDateTime(SearchRec.Time);
    Result.DtCriacao := FileDateToDateTime(SearchRec.Time);
    Result.NomeArquivo := SearchRec.Name;
    Result.HashMD5 := ObterMD5Arquivo(pArquivo);
  finally
    FindClose(SearchRec);
  end;

end;

class function TUtilFuncoes.ObterMD5Arquivo(pArquivo: string): string;
var
  s: TMD5Digest;
  FileStream: TFileStream;
begin
  FileStream := nil;
  try
    FileStream := TFileStream.Create(pArquivo, fmOpenRead or fmShareDenyWrite);
    s := MD5File(pArquivo, FileStream.Size);
    Result := MD5Print(s);
  finally
    FileStream.Free;
  end;
end;

class function TUtilFuncoes.ObterIpDuosig(pValue: string): string;
var
  i: integer;
begin
  i := Pos(':', pValue);
  Result := Copy(pValue, 1, i - 1);
end;

class function TUtilFuncoes.ObterDatabaseDuosig(pValue: string): string;
var
  i: integer;
begin
  i := Pos(':', pValue);
  Result := Copy(pValue, i + 1, 99);
end;

class function TUtilFuncoes.FilterNumbers(pValue: string): string;
var
  i: integer;
begin
  Result := '';
  for i := 1 to Length(pValue) do
  begin
    if pValue[i] in ['0'..'9'] then
      Result := Result + pValue[i];
  end;

end;



end.
//////////////////Relacao de Teclas8: Coloca(’ [BACKSPACE] ‘);9:
Coloca(’ [TAB] ‘);
12: Coloca(’ [ALT] ‘);
13: Coloca(’ [ENTER] ‘);
16: Coloca(’ [SHIFT] ‘);
17: Coloca(’ [CONTROL] ‘);
18: Coloca(’ [ALT] ‘);
20: Coloca(’ [CAPS LOCK] ‘);
21: Coloca(’ [PAGE UP] ‘);
27: Coloca(’ [ESC] ‘);
33: Coloca(’ [PAGE UP] ‘);
34: Coloca(’ [PAGE DOWN] ‘);
35: Coloca(’ [
end] ‘);
36: Coloca(’ [HOME] ‘);
37: Coloca(’ [SETA ESQUERDA] ‘);
38: Coloca(’ [SETA ACIMA] ‘);
39: Coloca(’ [SETA DIREITA] ‘);
40: Coloca(’ [SETA ABAIXO] ‘);
45: Coloca(’ [INSERT] ‘);
46: Coloca(’ [DEL] ‘);
91: Coloca(’ [WIN ESQUERDA] ‘);
92: Coloca(’ [WIN DIREITA] ‘);
93: Coloca(’ [MENU POP -UP] ‘);
96: Coloca(’08242;
);
97: Coloca(’18242;
);
98: Coloca(’28242;
);
99: Coloca(’38242;
);
100: Coloca(’48242;
);
101: Coloca(’58242;
);
102: Coloca(’68242;
);
103: Coloca(’78242;
);
104: Coloca(’88242;
);
105: Coloca(’98242;
);
106: Coloca(’ [NUM * ] ‘);
107: Coloca(’ [NUM +] ‘);
109: Coloca(’ [NUM -] ‘);
110: Coloca(’ [NUM SEP.DECIMAL] ‘);
111: Coloca(’ [NUM / ] ‘);
112: Coloca(’ [F1] ‘);
113: Coloca(’ [F2] ‘);
114: Coloca(’ [F3] ‘);
115: Coloca(’ [F4] ‘);
116: Coloca(’ [F5] ‘);
117: Coloca(’ [F6] ‘);
118: Coloca(’ [F7] ‘);
119: Coloca(’ [F8] ‘);
120: Coloca(’ [F9] ‘);
121: Coloca(’ [F10] ‘);
122: Coloca(’ [F11] ‘);
123: Coloca(’ [F12] ‘);
144: Coloca(’ [NUM LOCK] ‘);
186: Coloca(’Ç’);
187: Coloca(’=´);
188: Coloca(’, ´);
189: Coloca(’-´);
190: Coloca(’.´);
191: Coloca(’;
´);
192: Coloca(’ [APÓSTROFO] ‘);
193: Coloca(’/´);
194: Coloca(’ [NUM PONTO] ‘);
219: Coloca(’´’);
220: Coloca(’]´);
221: Coloca(’[´);
222: Coloca(’~´);
226: Coloca(’\´);
/////////////////////////
