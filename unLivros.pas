unit unLivros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unPadraoDBTable, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids;

type
  TfrmLivros = class(TfrmPadraoDBTable)
    dtsLivros: TDataSource;
    dtsAutores: TDataSource;
    tblAutores: TFDTable;
    dtsEditoras: TDataSource;
    tblEditoras: TFDTable;
    dtsGeneros: TDataSource;
    tblGeneros: TFDTable;
    TableCODLIVRO: TIntegerField;
    TableISBN: TLargeintField;
    TableTITULO: TStringField;
    TableANO: TSmallintField;
    TablePAGINAS: TSmallintField;
    Label1: TLabel;
    edtCodLivro: TDBEdit;
    Label2: TLabel;
    edtISBN: TDBEdit;
    Label3: TLabel;
    edtTitulo: TDBEdit;
    Label4: TLabel;
    edtAno: TDBEdit;
    Label5: TLabel;
    edtPaginas: TDBEdit;
    cmbAutores: TDBLookupComboBox;
    lblAutor: TLabel;
    lblEditora: TLabel;
    cmbEditora: TDBLookupComboBox;
    cmbGenero: TDBLookupComboBox;
    lblGenero: TLabel;
    tblAutoresCODAUTOR: TIntegerField;
    tblAutoresAUTOR: TStringField;
    DBGrid1: TDBGrid;
    TableCODAUTOR: TIntegerField;
    TableCODEDITORA: TIntegerField;
    TableCODGENERO: TIntegerField;
    TableEditora: TStringField;
    TableAutor: TStringField;
    TableGenero: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
         protected
     function DadosValidos: boolean; override;
  end;

var
  frmLivros: TfrmLivros;

implementation

{$R *.dfm}

uses unAutores, unBiblioteca, unDM, unEditoras, unGeneros;

{ TfrmLivros }

function TfrmLivros.DadosValidos: boolean;
begin
    if (edtTitulo.Text = '') then
  begin
    msgOK('Informe o nome da autor');
    edtTitulo.SetFocus;
    Result := False;
  end
end;

procedure TfrmLivros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    inherited;
    frmLivros := nil;
end;

end.
