unit unProjetoFinal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    Menu: TMainMenu;
    MCadastrar: TMenuItem;
    MMIAutores: TMenuItem;
    MRelatorio: TMenuItem;
    MMIEditoras: TMenuItem;
    MMIGeneros: TMenuItem;
    MMILivros: TMenuItem;
    MMIRelAutores: TMenuItem;
    MMIRelEditoras: TMenuItem;
    MMIRelGeneros: TMenuItem;
    MMIRelLivros: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MMIAutoresClick(Sender: TObject);
    procedure MMIEditorasClick(Sender: TObject);
    procedure MMIGenerosClick(Sender: TObject);
    procedure MMILivrosClick(Sender: TObject);
    procedure MMIRelAutoresClick(Sender: TObject);
    procedure MMIRelEditorasClick(Sender: TObject);
    procedure MMIRelGenerosClick(Sender: TObject);
    procedure MMIRelLivrosClick(Sender: TObject);
  private
    { Private declarations }
    procedure MostrarFormJaCriado(Form: TForm);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses unAutores, unBiblioteca, unDM, unEditoras, unGeneros, unLivros, unLogin;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (msgSN('Deseja finalizar a aplicação?') = IDNO) then
  Action := caNone
  else
  begin
    DM.Conexao.Connected := False;
    Application.Terminate;
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
   try
    DM.Conexao.Connected := True;
    msgOK ('Banco conectado');
    Application.ShowMainForm := False;
      frmLogin := TfrmLogin.Create(nil);
      frmLogin.ShowModal;
    //StatusBar1.Panels[0] := frmLogin.Usuario;
     FreeAndNil(frmLogin);
    Application.ShowMainForm := True;
    //StatusBar1.Panels [1].Text := FormatDateTime('dddd, dd "de" mmmm "de" yyyy', Date);
  except
    on E: Exception do
    begin
      msgOK('Erro ao conector no banco: ' + E.Message);
      Application.Terminate;
    end;
  end;
end;

procedure TfrmPrincipal.MMIAutoresClick(Sender: TObject);
begin
if (not Assigned(frmAutores)) then
  frmAutores := TfrmAutores.Create(nil)
  else
    MostrarFormJaCriado(frmAutores);
end;

procedure TfrmPrincipal.MMIEditorasClick(Sender: TObject);
begin
  if (not Assigned(frmEditoras)) then
  frmEditoras := TfrmEditoras.Create(nil)
  else
    MostrarFormJaCriado(frmEditoras);
end;

procedure TfrmPrincipal.MMIGenerosClick(Sender: TObject);
begin
  if (not Assigned(frmGenero)) then
  frmGenero := TfrmGenero.Create(nil)
  else
    MostrarFormJaCriado(frmGenero);
end;

procedure TfrmPrincipal.MMILivrosClick(Sender: TObject);
begin
  if (not Assigned(frmLivros)) then
  frmLivros := TfrmLivros.Create(nil)
  else
    MostrarFormJaCriado(frmLivros);
end;



procedure TfrmPrincipal.MMIRelAutoresClick(Sender: TObject);
begin
    DM.tblAutores.Open;
    DM.frxAutores.LoadFromFile('Relatorios/Autores.fr3');
    DM.frxAutores.ShowReport;
   // DM.frxAutores.Close;
end;

procedure TfrmPrincipal.MMIRelEditorasClick(Sender: TObject);
begin
    DM.tblEditoras.Open;
    DM.frxEditoras.LoadFromFile('Relatorios/Editoras.fr3');
    DM.frxEditoras.ShowReport;
   // DM.frxEditoras.Close;
end;

procedure TfrmPrincipal.MMIRelGenerosClick(Sender: TObject);
begin
    DM.tblGeneros.Open;
    DM.frxGeneros.LoadFromFile('Relatorios/Generos.fr3');
    DM.frxGeneros.ShowReport;
   // DM.frxGeneros.Close;
end;

procedure TfrmPrincipal.MMIRelLivrosClick(Sender: TObject);
begin
    DM.qryLivros.Open;
    DM.frxLivros.LoadFromFile('Relatorios/Livros.fr3');
    DM.frxLivros.ShowReport;
  //  DM.frxLivros.Close;
end;

procedure TfrmPrincipal.MostrarFormJaCriado(Form: TForm);
begin
  Form.BringToFront;
  if (Form.WindowState = wsMinimized) then
  Form.WindowState := wsNormal;
end;

end.
