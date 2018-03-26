unit unPadraoDB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.DBCtrls;

type
  TOperacoes = (topIncluir, topAlterar, topExcluir, topCancelar);

  TfrmPadraoDB = class(TForm)
    pnlBotoes: TPanel;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    btnSalvar: TBitBtn;
    btnFechar: TBitBtn;
    pnlDados: TPanel;
    grbManutencao: TGroupBox;
    grbConsulta: TGroupBox;
    pnlNavega: TPanel;
    dbnNavega: TDBNavigator;
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    FOperacao: TOperacoes;
    procedure SetOperacao(const Value: TOperacoes);
    { Private declarations }
  public
    { Public declarations }
    property Operacao: TOperacoes read FOperacao write SetOperacao;
  end;

var
  frmPadraoDB: TfrmPadraoDB;

implementation

{$R *.dfm}

{ TfrmPadraoDB }

procedure TfrmPadraoDB.btnAlterarClick(Sender: TObject);
begin
  Operacao := topAlterar;
end;

procedure TfrmPadraoDB.btnCancelarClick(Sender: TObject);
begin
  Operacao := topCancelar;
end;

procedure TfrmPadraoDB.btnExcluirClick(Sender: TObject);
begin
  Operacao := topExcluir;
end;

procedure TfrmPadraoDB.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmPadraoDB.btnNovoClick(Sender: TObject);
begin
  Operacao := topIncluir;
end;

procedure TfrmPadraoDB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPadraoDB.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (Application.MessageBox('Você deseja fechar?', 'Atenção',
    MB_YESNO + MB_ICONQUESTION) = IDYES) then
    CanClose := True
  else
    CanClose := False;
//  CanClose := (Application.MessageBox('Você deseja fechar?',
//    'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES);
end;

procedure TfrmPadraoDB.FormCreate(Sender: TObject);
begin
  Operacao := topCancelar;
end;

procedure TfrmPadraoDB.SetOperacao(const Value: TOperacoes);
var
  index: integer;
begin
  FOperacao := Value;
  // Habilita/Desabilita componentes conforme a operação
  btnNovo.Enabled := (FOperacao in [topCancelar, topExcluir]);
  btnAlterar.Enabled := btnNovo.Enabled;
  btnExcluir.Enabled := (FOperacao = topCancelar);
  btnCancelar.Enabled := (Foperacao in [topIncluir, topAlterar]);
  btnSalvar.Enabled := btnCancelar.Enabled;
  grbManutencao.Enabled := btnSalvar.Enabled;
  grbConsulta.Enabled := not grbManutencao.Enabled;

  // Ajusta o Caption do formulário
  index := Pos(' - [', Self.Caption);
  if index > 0 then
    Self.Caption := Copy(Self.Caption, 1, index - 1);
  case FOperacao of
    topIncluir: Self.Caption := Self.Caption + ' - [Inclusão]';
    topAlterar: Self.Caption := Self.Caption + ' - [Alteração]';
    topExcluir: Self.Caption := Self.Caption + ' - [Exclusão]';
  end;
end;

end.
