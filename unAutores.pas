unit unAutores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unPadraoDB, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  unPadraoDBTable;

type
  TfrmAutores = class(TfrmPadraoDBTable)
    dtsAutores: TDataSource;
    dbgAutores: TDBGrid;
    Label1: TLabel;
    edtCodAutor: TDBEdit;
    Label2: TLabel;
    edtAutor: TDBEdit;
    TableCODAUTOR: TIntegerField;
    TableAUTOR: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
     protected
     function DadosValidos: boolean; override;
  end;

var
  frmAutores: TfrmAutores;

implementation

{$R *.dfm}

uses unDM, unBiblioteca;

{ TfrmAutores }

function TfrmAutores.DadosValidos: boolean;
begin
  if (edtAutor.Text = '') then
  begin
    msgOK('Informe o nome da autor');
    edtAutor.SetFocus;
    Result := False;
  end
end;


procedure TfrmAutores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    inherited;
    frmAutores := nil;
end;

end.
