unit unPadraoDBTable;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unPadraoDB, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPadraoDBTable = class(TfrmPadraoDB)
    Table: TFDTable;
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function DadosValidos: boolean; virtual; abstract;
  end;

var
  frmPadraoDBTable: TfrmPadraoDBTable;

implementation

{$R *.dfm}

uses unBiblioteca;

procedure TfrmPadraoDBTable.btnAlterarClick(Sender: TObject);
begin
  inherited;
  Table.Edit;
end;

procedure TfrmPadraoDBTable.btnCancelarClick(Sender: TObject);
begin
  inherited;
  table.Cancel;
end;

procedure TfrmPadraoDBTable.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if (not table.IsEmpty) and (msgSN('Deseja excluir o registro?') = ID_YES) then
  begin
    table.Delete;
    if table.ApplyUpdates(0) = 0 then
    begin
      table.CommitUpdates;
      table.Refresh;
    end

    else
    begin
      table.CancelUpdates;
      msgOK('Não foi possível remover o registro.');
    end;
  end;
  Operacao := topCancelar;
end;

procedure TfrmPadraoDBTable.btnNovoClick(Sender: TObject);
begin
  inherited;
  Table.Insert;
end;

procedure TfrmPadraoDBTable.btnSalvarClick(Sender: TObject);
var
  numErros: integer;
begin
  inherited;
  if DadosValidos then
   begin
    table.Post;
    numErros := table.ApplyUpdates(0);
  if numErros <> 0 then
  begin
    table.CancelUpdates;
    msgOK('Não foi possível gravar o registro')
  end

  else
    begin
      table.CommitUpdates;
      table.Refresh;
      msgOK('O registro foi salvo com sucesso!');
      Operacao := topCancelar;
    end;
end;
   end;


procedure TfrmPadraoDBTable.FormCreate(Sender: TObject);
begin
  inherited;
  try
    table.Open;
    except
      on E: Exception do
        msgOK('Erro ao abrir a fonte de dados: ' + E.Message);
  end;
end;

end.
