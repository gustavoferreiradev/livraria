inherited frmAutores: TfrmAutores
  Caption = 'Autores'
  ClientHeight = 465
  ClientWidth = 443
  FormStyle = fsMDIChild
  Visible = True
  ExplicitWidth = 459
  ExplicitHeight = 504
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Height = 465
    ExplicitHeight = 465
  end
  inherited pnlDados: TPanel
    Width = 386
    Height = 465
    ExplicitWidth = 386
    ExplicitHeight = 465
    inherited grbManutencao: TGroupBox
      Width = 386
      ParentBackground = False
      ParentColor = False
      ExplicitWidth = 386
      object Label1: TLabel
        Left = 6
        Top = 25
        Width = 78
        Height = 13
        Caption = 'C'#243'digo do Autor'
        FocusControl = edtCodAutor
      end
      object Label2: TLabel
        Left = 6
        Top = 65
        Width = 27
        Height = 13
        Caption = 'Autor'
        FocusControl = edtAutor
      end
      object edtCodAutor: TDBEdit
        Left = 6
        Top = 41
        Width = 134
        Height = 21
        Color = clActiveBorder
        DataField = 'CODAUTOR'
        DataSource = dtsAutores
        ReadOnly = True
        TabOrder = 0
      end
      object edtAutor: TDBEdit
        Left = 6
        Top = 81
        Width = 200
        Height = 21
        DataField = 'AUTOR'
        DataSource = dtsAutores
        TabOrder = 1
      end
    end
    inherited grbConsulta: TGroupBox
      Width = 386
      Height = 264
      ExplicitWidth = 386
      ExplicitHeight = 264
      inherited pnlNavega: TPanel
        Width = 382
        ExplicitWidth = 382
        inherited dbnNavega: TDBNavigator
          Hints.Strings = ()
        end
      end
      object dbgAutores: TDBGrid
        Left = 2
        Top = 56
        Width = 382
        Height = 206
        Align = alClient
        DataSource = dtsAutores
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
    IndexFieldNames = 'CODAUTOR'
    Connection = DM.Conexao
    UpdateOptions.UpdateTableName = 'AUTORES'
    TableName = 'AUTORES'
    Left = 376
    Top = 32
    object TableCODAUTOR: TIntegerField
      FieldName = 'CODAUTOR'
      Origin = 'CODAUTOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TableAUTOR: TStringField
      FieldName = 'AUTOR'
      Origin = 'AUTOR'
      Required = True
      Size = 100
    end
  end
  object dtsAutores: TDataSource
    DataSet = Table
    Left = 320
    Top = 32
  end
end
