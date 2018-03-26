inherited frmPadraoDBTable: TfrmPadraoDBTable
  Caption = 'frmPadraoDBTable'
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
  object Table: TFDTable
    CachedUpdates = True
    Left = 328
    Top = 48
  end
end
