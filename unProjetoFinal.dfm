object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Livraria - Projeto Final'
  ClientHeight = 709
  ClientWidth = 1350
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = Menu
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Menu: TMainMenu
    Left = 40
    Top = 16
    object MCadastrar: TMenuItem
      Caption = '&Cadastrar'
      object MMIAutores: TMenuItem
        Caption = '&Autores'
        OnClick = MMIAutoresClick
      end
      object MMIEditoras: TMenuItem
        Caption = '&Editoras'
        OnClick = MMIEditorasClick
      end
      object MMIGeneros: TMenuItem
        Caption = '&G'#234'neros'
        OnClick = MMIGenerosClick
      end
      object MMILivros: TMenuItem
        Caption = '&Livros'
        OnClick = MMILivrosClick
      end
    end
    object MRelatorio: TMenuItem
      Caption = '&Relat'#243'rios'
      object MMIRelAutores: TMenuItem
        Caption = 'Autores'
        OnClick = MMIRelAutoresClick
      end
      object MMIRelEditoras: TMenuItem
        Caption = 'Editoras'
        OnClick = MMIRelEditorasClick
      end
      object MMIRelGeneros: TMenuItem
        Caption = 'G'#234'neros'
        OnClick = MMIRelGenerosClick
      end
      object MMIRelLivros: TMenuItem
        Caption = 'Livros'
        OnClick = MMIRelLivrosClick
      end
    end
  end
end
