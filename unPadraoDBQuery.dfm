inherited frmPadraoDBQuery: TfrmPadraoDBQuery
  Caption = 'frmPadraoDBQuery'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    inherited btnSalvar: TBitBtn
      OnClick = btnSalvarClick
    end
  end
  inherited pnlDados: TPanel
    inherited grbConsulta: TGroupBox
      inherited pnlNavega: TPanel
        inherited dbnNavega: TDBNavigator
          Hints.Strings = ()
        end
      end
    end
  end
  object qry: TFDQuery
    CachedUpdates = True
    Left = 361
    Top = 32
  end
end
