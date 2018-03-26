inherited frmEditoras: TfrmEditoras
  Caption = 'Editoras'
  ClientWidth = 427
  FormStyle = fsMDIChild
  Visible = True
  WindowState = wsMaximized
  ExplicitWidth = 443
  ExplicitHeight = 480
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDados: TPanel
    Width = 370
    ExplicitWidth = 370
    inherited grbManutencao: TGroupBox
      Width = 370
      ExplicitWidth = 370
      object Label1: TLabel
        Left = 6
        Top = 21
        Width = 85
        Height = 13
        Caption = 'C'#243'digo da Editora'
        FocusControl = edtCodEditora
      end
      object Label2: TLabel
        Left = 6
        Top = 61
        Width = 34
        Height = 13
        Caption = 'Editora'
        FocusControl = edtEditora
      end
      object edtCodEditora: TDBEdit
        Left = 6
        Top = 37
        Width = 132
        Height = 21
        Color = clGrayText
        DataField = 'CODEDITORA'
        DataSource = dtsEditoras
        ReadOnly = True
        TabOrder = 0
      end
      object edtEditora: TDBEdit
        Left = 6
        Top = 80
        Width = 198
        Height = 21
        DataField = 'EDITORA'
        DataSource = dtsEditoras
        TabOrder = 1
      end
    end
    inherited grbConsulta: TGroupBox
      Width = 370
      ExplicitWidth = 370
      inherited pnlNavega: TPanel
        Width = 366
        ExplicitWidth = 366
        inherited dbnNavega: TDBNavigator
          Hints.Strings = ()
        end
      end
      object dbgEditoras: TDBGrid
        Left = 2
        Top = 56
        Width = 366
        Height = 182
        Align = alClient
        DataSource = dtsEditoras
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
    IndexFieldNames = 'CODEDITORA'
    Connection = DM.Conexao
    UpdateOptions.UpdateTableName = 'EDITORAS'
    TableName = 'EDITORAS'
    Left = 376
    object TableCODEDITORA: TIntegerField
      DisplayLabel = 'C'#243'digo da Editora'
      FieldName = 'CODEDITORA'
      Origin = 'CODEDITORA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TableEDITORA: TStringField
      DisplayLabel = 'Editora'
      FieldName = 'EDITORA'
      Origin = 'EDITORA'
      Required = True
      Size = 100
    end
  end
  object dtsEditoras: TDataSource
    DataSet = Table
    Left = 320
    Top = 48
  end
end
