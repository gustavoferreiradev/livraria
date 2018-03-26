unit unPadraoDBQuery;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unPadraoDB, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPadraoDBQuery = class(TfrmPadraoDB)
    qry: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  protected
   function DadosValidos: boolean; virtual; abstract;
     end;

var
  frmPadraoDBQuery: TfrmPadraoDBQuery;

implementation

{$R *.dfm}

uses unBiblioteca;

procedure TfrmPadraoDBQuery.btnAlterarClick(Sender: TObject);
begin
  inherited;
  qry.Edit;
end;

procedure TfrmPadraoDBQuery.btnCancelarClick(Sender: TObject);
begin
  inherited;
  qry.Cancel;
end;

procedure TfrmPadraoDBQuery.btnExcluirClick(Sender: TObject);
var
  numeroErros: Integer;
begin
  inherited;
  if (not qry.IsEmpty) and (msgSN('Deseja excluir o registro?') = IDYES) then
  begin
    qry.Delete;
    numeroErros := qry.ApplyUpdates(0);
    if (numeroErros = 0) then
    begin
      qry.CommitUpdates;
      qry.Refresh;
      end
    else
    begin
      qry.CancelUpdates;
      msgOK('Erro ao excluir o registro.');
    end;
  end;
  Operacao := topCancelar;
end;

procedure TfrmPadraoDBQuery.btnNovoClick(Sender: TObject);
begin
  inherited;
  qry.Append;
end;

procedure TfrmPadraoDBQuery.btnSalvarClick(Sender: TObject);
var
  numeroErros: integer;
begin
  inherited;
  if DadosValidos then
  begin
    qry.Post;
    numeroErros := qry.ApplyUpdates(0);
    if (numeroErros = 0) then
    begin
      qry.CommitUpdates;
      qry.Refresh;
      Operacao := topCancelar;
    end
    else
    begin
      qry.CancelUpdates;
      msgOK('Erro ao salvar o registro.');
    end;
  end;

end;

procedure TfrmPadraoDBQuery.FormCreate(Sender: TObject);
begin
  inherited;
  try
    qry.Open;
  except
    on E: Exception do
    msgOK('Erro ao abrir fonte de dados: ' + E.Message);
  end;
end;

end.
