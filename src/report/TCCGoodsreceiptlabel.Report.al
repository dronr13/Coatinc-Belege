
report 60128 "TCC Goods receipt label"
{
    ApplicationArea = All;
    Caption = 'Goods receipt label';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './src/report/GoodsReceiptLabel.rdl';

    dataset
    {
        dataitem(IncomingGoods; "MuM GR Whse. Receipt Header")
        {
            column(No; "No.")
            {
            }
            column(Customer; "Sell-to Customer Name")
            {
            }
            column(CustomerNo; "Sell-to Customer No.")
            {
            }
            column(Reference; "External Order No.")
            {
            }
            column(DateIn; "Receipt Date")
            {
            }
            column(QRCode; EncodedText)
            {
            }
            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = SORTING(Number);

                column(CopyIndex; CopyLoop.Number)
                {
                }
                trigger OnPreDataItem()
                begin
                    // Zet het bereik van de kopieën op basis van de parameter
                    setrange(Number, 1, NumberOfLabels);
                end;
            }
            trigger OnAfterGetRecord()
            var
                QRString: Text;
                BarcodeFontProvider: Interface "Barcode Font Provider 2D";
                Symbology2D: Enum "Barcode Symbology 2D";
            begin
                QRString:="No.";
                BarcodeFontProvider:=Enum::"Barcode Font Provider 2D"::IDAutomation2D;
                Symbology2D:=Enum::"Barcode Symbology 2D"::"QR-Code";
                EncodedText:=BarcodeFontProvider.EncodeFont(QRString, Symbology2D);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Opties)
                {
                    field(Aantal; NumberOfLabels)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
        actions
        {
            area(processing)
            {
                action(Verwerken)
                {
                    Caption = 'Start';
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                    begin
                        if NumberOfLabels < 1 then Error('Minimal number is 1');
                    end;
                }
            }
        }
        trigger OnOpenPage()
        begin
            NumberOfLabels:=1;
        end;
    }
    labels
    {
    ReceiptNoLbl='Receipt No:';
    CustomerNoLbl='Customer no.:';
    CustomerNameLbl='Customer name:';
    ReferenceLbl='Reference:';
    DateInLbl='Date in:';
    }
    var EncodedText: Text;
    NumberOfLabels: Integer;
}
