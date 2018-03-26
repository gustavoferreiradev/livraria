unit unBiblioteca;

interface
  procedure msgOK(texto: String);
  // Fun��o com par�metro com valor default e sobrecarga
  function msgSN(texto: String; cancelar: boolean = false): smallint; overload;
  // Fun��o com sobrecarga
  function msgSN(opcao: smallint): boolean; overload;

implementation

uses
  Forms, Windows;

const
  nomeProjeto = 'Modulariza��o';

procedure msgOK(texto: String);
begin
  Application.MessageBox(PWideChar(texto), nomeProjeto, MB_OK);
end;

function msgSN(texto: String; cancelar: boolean = false): smallint;
begin
  if cancelar then
    Result := Application.MessageBox(PWideChar(texto), nomeProjeto,
      MB_YESNOCANCEL)
  else
    Result := Application.MessageBox(PWideChar(texto), nomeProjeto,
      MB_YESNO);
end;

function msgSN(opcao: smallint): boolean;
var
  msg: String;
begin
  case opcao of
    0: msg := 'Deseja sair?';
    1: msg := 'Confirma a opera��o?';
  end;
  Result := Application.MessageBox(PWideChar(msg), nomeProjeto,
    MB_YESNO) = IDYES;
end;

end.
