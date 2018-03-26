inherited frmLivros: TfrmLivros
  Caption = 'Livros'
  ClientHeight = 729
  ClientWidth = 802
  FormStyle = fsMDIChild
  Visible = True
  WindowState = wsMaximized
  ExplicitLeft = -31
  ExplicitWidth = 818
  ExplicitHeight = 768
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Height = 729
    ExplicitHeight = 729
  end
  inherited pnlDados: TPanel
    Width = 745
    Height = 729
    ExplicitWidth = 745
    ExplicitHeight = 729
    inherited grbManutencao: TGroupBox
      Width = 745
      Height = 449
      ExplicitLeft = -168
      ExplicitTop = 11
      ExplicitWidth = 745
      ExplicitHeight = 449
      object Label1: TLabel
        Left = 6
        Top = 21
        Width = 74
        Height = 13
        Caption = 'C'#243'digo do Livro'
        FocusControl = edtCodLivro
      end
      object Label2: TLabel
        Left = 6
        Top = 61
        Width = 23
        Height = 13
        Caption = 'ISBN'
        FocusControl = edtISBN
      end
      object Label3: TLabel
        Left = 6
        Top = 101
        Width = 26
        Height = 13
        Caption = 'T'#237'tulo'
        FocusControl = edtTitulo
      end
      object Label4: TLabel
        Left = 6
        Top = 283
        Width = 19
        Height = 13
        Caption = 'Ano'
        FocusControl = edtAno
      end
      object Label5: TLabel
        Left = 6
        Top = 336
        Width = 37
        Height = 13
        Caption = 'P'#225'ginas'
        FocusControl = edtPaginas
      end
      object lblAutor: TLabel
        Left = 6
        Top = 144
        Width = 27
        Height = 13
        Caption = 'Autor'
      end
      object lblEditora: TLabel
        Left = 6
        Top = 190
        Width = 34
        Height = 13
        Caption = 'Editora'
      end
      object lblGenero: TLabel
        Left = 6
        Top = 237
        Width = 35
        Height = 13
        Caption = 'G'#234'nero'
      end
      object edtCodLivro: TDBEdit
        Left = 6
        Top = 37
        Width = 134
        Height = 21
        Color = clGrayText
        DataField = 'CODLIVRO'
        ReadOnly = True
        TabOrder = 0
      end
      object edtISBN: TDBEdit
        Left = 6
        Top = 77
        Width = 199
        Height = 21
        DataField = 'ISBN'
        DataSource = dtsLivros
        TabOrder = 1
      end
      object edtTitulo: TDBEdit
        Left = 6
        Top = 117
        Width = 531
        Height = 21
        DataField = 'TITULO'
        DataSource = dtsLivros
        TabOrder = 2
      end
      object edtAno: TDBEdit
        Left = 6
        Top = 302
        Width = 134
        Height = 21
        DataField = 'ANO'
        DataSource = dtsLivros
        TabOrder = 3
      end
      object edtPaginas: TDBEdit
        Left = 3
        Top = 355
        Width = 134
        Height = 21
        DataField = 'PAGINAS'
        DataSource = dtsLivros
        TabOrder = 4
      end
    end
    inherited grbConsulta: TGroupBox
      Top = 449
      Width = 745
      Height = 280
      ExplicitTop = 449
      ExplicitWidth = 745
      ExplicitHeight = 280
      inherited pnlNavega: TPanel
        Width = 741
        ExplicitWidth = 741
        inherited dbnNavega: TDBNavigator
          Hints.Strings = ()
        end
      end
      object DBGrid1: TDBGrid
        Left = 2
        Top = 56
        Width = 741
        Height = 222
        Align = alClient
        DataSource = dtsLivros
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object cmbAutores: TDBLookupComboBox [2]
    Left = 63
    Top = 163
    Width = 202
    Height = 21
    DataField = 'CODAUTOR'
    DataSource = dtsLivros
    KeyField = 'CODAUTOR'
    ListField = 'AUTOR'
    ListSource = dtsAutores
    TabOrder = 2
  end
  object cmbEditora: TDBLookupComboBox [3]
    Left = 63
    Top = 209
    Width = 202
    Height = 21
    DataField = 'CODEDITORA'
    DataSource = dtsLivros
    KeyField = 'CODEDITORA'
    ListField = 'EDITORA'
    ListSource = dtsEditoras
    TabOrder = 3
  end
  object cmbGenero: TDBLookupComboBox [4]
    Left = 63
    Top = 256
    Width = 145
    Height = 21
    DataField = 'CODGENERO'
    DataSource = dtsLivros
    KeyField = 'CODGENERO'
    ListField = 'GENERO'
    ListSource = dtsGeneros
    TabOrder = 4
  end
  inherited Table: TFDTable
    IndexFieldNames = 'CODLIVRO'
    Connection = DM.conexao
    UpdateOptions.UpdateTableName = 'LIVROS'
    TableName = 'LIVROS'
    Left = 704
    Top = 24
    object TableCODLIVRO: TIntegerField
      DisplayLabel = 'C'#243'digo do Livro'
      FieldName = 'CODLIVRO'
      Origin = 'CODLIVRO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object TableISBN: TLargeintField
      FieldName = 'ISBN'
      Origin = 'ISBN'
      Required = True
    end
    object TableTITULO: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Origin = 'TITULO'
      Required = True
      Size = 100
    end
    object TablePAGINAS: TSmallintField
      DisplayLabel = 'P'#225'ginas'
      FieldName = 'PAGINAS'
      Origin = 'PAGINAS'
      Required = True
    end
    object TableANO: TSmallintField
      DisplayLabel = 'Ano'
      FieldName = 'ANO'
      Origin = 'ANO'
      Required = True
    end
    object TableCODAUTOR: TIntegerField
      FieldName = 'CODAUTOR'
      Origin = 'CODAUTOR'
    end
    object TableAutor: TStringField
      FieldKind = fkLookup
      FieldName = 'Autor'
      LookupDataSet = tblAutores
      LookupKeyFields = 'CODAUTOR'
      LookupResultField = 'AUTOR'
      KeyFields = 'CODAUTOR'
      Lookup = True
    end
    object TableCODEDITORA: TIntegerField
      FieldName = 'CODEDITORA'
      Origin = 'CODEDITORA'
    end
    object TableEditora: TStringField
      FieldKind = fkLookup
      FieldName = 'Editora'
      LookupDataSet = tblEditoras
      LookupKeyFields = 'CODEDITORA'
      LookupResultField = 'EDITORA'
      KeyFields = 'CODEDITORA'
      Lookup = True
    end
    object TableCODGENERO: TIntegerField
      FieldName = 'CODGENERO'
      Origin = 'CODGENERO'
    end
    object TableGenero: TStringField
      FieldKind = fkLookup
      FieldName = 'Genero'
      LookupDataSet = tblGeneros
      LookupKeyFields = 'CODGENERO'
      LookupResultField = 'GENERO'
      KeyFields = 'CODGENERO'
      Lookup = True
    end
  end
  object dtsLivros: TDataSource
    DataSet = Table
    Left = 640
    Top = 24
  end
  object dtsAutores: TDataSource
    DataSet = tblAutores
    Left = 640
    Top = 80
  end
  object tblAutores: TFDTable
    IndexFieldNames = 'CODAUTOR'
    Connection = DM.conexao
    UpdateOptions.UpdateTableName = 'AUTORES'
    TableName = 'AUTORES'
    Left = 704
    Top = 80
    object tblAutoresCODAUTOR: TIntegerField
      FieldName = 'CODAUTOR'
      Origin = 'CODAUTOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tblAutoresAUTOR: TStringField
      FieldName = 'AUTOR'
      Origin = 'AUTOR'
      Required = True
      Size = 100
    end
  end
  object dtsEditoras: TDataSource
    DataSet = tblEditoras
    Left = 640
    Top = 136
  end
  object tblEditoras: TFDTable
    IndexFieldNames = 'CODEDITORA'
    Connection = DM.conexao
    UpdateOptions.UpdateTableName = 'EDITORAS'
    TableName = 'EDITORAS'
    Left = 704
    Top = 136
  end
  object dtsGeneros: TDataSource
    DataSet = tblGeneros
    Left = 640
    Top = 192
  end
  object tblGeneros: TFDTable
    IndexFieldNames = 'CODGENERO'
    Connection = DM.conexao
    UpdateOptions.UpdateTableName = 'GENEROS'
    TableName = 'GENEROS'
    Left = 704
    Top = 192
  end
end
