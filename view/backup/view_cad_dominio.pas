unit view_cad_dominio;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  DBCtrls, Buttons, model_case, DB;

type

  { TViewCadDominio }

  TViewCadDominio = class(TForm)
    BtnSalvar: TSpeedButton;
    BtnVoltar: TSpeedButton;
    DtSrcDominio: TDataSource;
    EdtTipoCampo: TDBComboBox;
    EdtNomeDominio: TDBEdit;
    EdtTamanho: TDBEdit;
    EdtEscala: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FModelCase: TModelCase;
    procedure SetModelCase(AValue: TModelCase);
  public
    property ModelCase: TModelCase read FModelCase write SetModelCase;
  end;

var
  ViewCadDominio: TViewCadDominio;

implementation

{$R *.lfm}

{ TViewCadDominio }

procedure TViewCadDominio.BtnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TViewCadDominio.FormShow(Sender: TObject);
begin
  if ModelCase.TBL0003.State in dsEditModes then
    ModelCase.TBL0003.Cancel;

  ModelCase.TBL0003.Append;
end;

procedure TViewCadDominio.SetModelCase(AValue: TModelCase);
begin
  if FModelCase = AValue then Exit;
  FModelCase := AValue;
end;

procedure TViewCadDominio.BtnSalvarClick(Sender: TObject);
begin
  ModelCase.GravarDominio;
  Close;
end;

end.
