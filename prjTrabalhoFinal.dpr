program prjTrabalhoFinal;

uses
  Vcl.Forms,
  unBiblioteca in 'unBiblioteca.pas',
  unPadraoDB in 'unPadraoDB.pas' {frmPadraoDB},
  unPadraoDBQuery in 'unPadraoDBQuery.pas' {frmPadraoDBQuery},
  unPadraoDBTable in 'unPadraoDBTable.pas' {frmPadraoDBTable},
  unPadraoSelecao in 'unPadraoSelecao.pas' {frmPadraoSelecao},
  unProjetoFinal in 'unProjetoFinal.pas' {frmPrincipal},
  unDM in 'unDM.pas' {DM: TDataModule},
  unAutores in 'unAutores.pas' {frmAutores},
  unEditoras in 'unEditoras.pas' {frmEditoras},
  unGeneros in 'unGeneros.pas' {frmGenero},
  unLivros in 'unLivros.pas' {frmLivros},
  unLogin in 'unLogin.pas' {frmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
