unit unGeneros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unPadraoDBTable, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TfrmGenero = class(TfrmPadraoDBTable)
    dtsGenero: TDataSource;
    TableCODGENERO: TIntegerField;
    TableGENERO: TStringField;
    Label1: TLabel;
    edtCodGenero: TDBEdit;
    Label2: TLabel;
    edtGenero: TDBEdit;
    dbgGenero: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
     protected
     function DadosValidos: boolean; override;
  end;

var
  frmGenero: TfrmGenero;

implementation

{$R *.dfm}

uses unBiblioteca, unDM;

{ TfrmGenero }

function TfrmGenero.DadosValidos: boolean;
begin
  if (edtGenero.Text = '') then
  begin
    msgOK('Informe o Gênero');
    edtGenero.SetFocus;
    Result := False;
  end
end;


procedure TfrmGenero.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        inherited;
    frmGenero := nil;
end;

end.
