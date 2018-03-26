unit unEditoras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unPadraoDBTable, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids;

type
  TfrmEditoras = class(TfrmPadraoDBTable)
    TableCODEDITORA: TIntegerField;
    TableEDITORA: TStringField;
    Label1: TLabel;
    edtCodEditora: TDBEdit;
    dtsEditoras: TDataSource;
    Label2: TLabel;
    edtEditora: TDBEdit;
    dbgEditoras: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
     function DadosValidos: boolean; override;
  end;

var
  frmEditoras: TfrmEditoras;

implementation

{$R *.dfm}

uses unBiblioteca, unDM;

{ TfrmEditoras }

function TfrmEditoras.DadosValidos: boolean;
begin
    if (edtEditora.Text = '') then
  begin
    msgOK('Informe o nome da Editora');
    edtEditora.SetFocus;
    Result := False;
  end
end;

procedure TfrmEditoras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      inherited;
    frmEditoras := nil;
end;

end.
