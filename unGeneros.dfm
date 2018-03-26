inherited frmGenero: TfrmGenero
  Caption = 'G'#234'neros'
  FormStyle = fsMDIChild
  Visible = True
  WindowState = wsMaximized
  ExplicitWidth = 441
  ExplicitHeight = 480
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDados: TPanel
    inherited grbManutencao: TGroupBox
      object Label1: TLabel
        Left = 7
        Top = 22
        Width = 86
        Height = 13
        Caption = 'C'#243'digo do G'#234'nero'
        FocusControl = edtCodGenero
      end
      object Label2: TLabel
        Left = 7
        Top = 62
        Width = 35
        Height = 13
        Caption = 'G'#234'nero'
        FocusControl = edtGenero
      end
      object edtCodGenero: TDBEdit
        Left = 7
        Top = 38
        Width = 134
        Height = 21
        Color = clGrayText
        DataField = 'CODGENERO'
        ReadOnly = True
        TabOrder = 0
      end
      object edtGenero: TDBEdit
        Left = 7
        Top = 78
        Width = 200
        Height = 21
        DataField = 'GENERO'
        DataSource = dtsGenero
        TabOrder = 1
      end
    end
    inherited grbConsulta: TGroupBox
      inherited pnlNavega: TPanel
        inherited dbnNavega: TDBNavigator
          Hints.Strings = ()
        end
      end
      object dbgGenero: TDBGrid
        Left = 2
        Top = 56
        Width = 364
        Height = 182
        Align = alClient
        DataSource = dtsGenero
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  inherited Table: TFDTable
    IndexFieldNames = 'CODGENERO'
    Connection = DM.Conexao
    UpdateOptions.UpdateTableName = 'GENEROS'
    TableName = 'GENEROS'
    Left = 376
    Top = 32
    object TableCODGENERO: TIntegerField
      DisplayLabel = 'C'#243'digo do G'#234'nero'
      FieldName = 'CODGENERO'
      Origin = 'CODGENERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TableGENERO: TStringField
      DisplayLabel = 'G'#234'nero'
      FieldName = 'GENERO'
      Origin = 'GENERO'
      Required = True
      Size = 100
    end
  end
  object dtsGenero: TDataSource
    DataSet = Table
    Left = 328
    Top = 32
  end
end
