unit unPadraoSelecao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmPadraoSelecao = class(TForm)
    pnlBotoes: TPanel;
    btnSelecionar: TBitBtn;
    btnCancelar: TBitBtn;
    dbgSelecao: TDBGrid;
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    cancelar: boolean;
  end;

var
  frmPadraoSelecao: TfrmPadraoSelecao;

implementation

{$R *.dfm}

procedure TfrmPadraoSelecao.btnCancelarClick(Sender: TObject);
begin
  cancelar := True;
  Self.Close;
end;

procedure TfrmPadraoSelecao.btnSelecionarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmPadraoSelecao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
