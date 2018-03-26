unit unLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmLogin = class(TForm)
    imgLogin: TImage;
    edtLogin: TLabeledEdit;
    edtSenha: TLabeledEdit;
    btnAcessar: TButton;
    btnSair: TButton;
    qryLogin: TFDQuery;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
  private
    { Private declarations }
    Logado: boolean;

  public
    { Public declarations }
    Usuario: string;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses unBiblioteca, unDM;

procedure TfrmLogin.btnAcessarClick(Sender: TObject);
begin
  try
    Logado := False;
    qryLogin.ParamByName('LOGIN').AsString := edtLogin.Text;
    qryLogin.Open;

    if (qryLogin.IsEmpty) or (qryLogin.FieldByName('SENHA').AsString <> edtSenha.Text) then
    begin
      msgOK('Usuário ou senha inválidos');
      edtLogin.SetFocus;
    end
    else
    begin
      Logado := True;
      Usuario := qryLogin.FieldByName('USUARIO').AsString;
      Self.Close;
    end;
    qryLogin.Close;

  except
    on E: Exception do
      msgOK('Erro ao validar usuário: ' + E.Message);

  end;
end;

procedure TfrmLogin.btnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if Logado then
      Action := caFree
    else
      Application.Terminate;
end;

procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
//Mudar campo ao pressionar ENTER
  if (key = #13) then
  begin
 //   key = #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.
