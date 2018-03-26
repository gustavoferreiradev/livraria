unit unDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.IBBase, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.UI, frxClass, frxDBSet;

type
  TDM = class(TDataModule)
    Conexao: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qryLivros: TFDQuery;
    frxAutores: TfrxReport;
    tblAutores: TFDTable;
    tblEditoras: TFDTable;
    tblGeneros: TFDTable;
    frxEditoras: TfrxReport;
    frxGeneros: TfrxReport;
    frxLivros: TfrxReport;
    frxDBAutores: TfrxDBDataset;
    frxDBEditoras: TfrxDBDataset;
    frxDBGeneros: TfrxDBDataset;
    frxDBLivros: TfrxDBDataset;
    tblAutoresCODAUTOR: TIntegerField;
    tblAutoresAUTOR: TStringField;
    tblEditorasCODEDITORA: TIntegerField;
    tblEditorasEDITORA: TStringField;
    tblGenerosCODGENERO: TIntegerField;
    tblGenerosGENERO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
