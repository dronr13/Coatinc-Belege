report 60124 "CO Label Waren Annahme"
{
    ApplicationArea = All;
    Caption = 'Label Warenannahmen';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './src/report/LabelWarenAnnahme.rdl';
    dataset
    {
        dataitem(COLabelBuffer2; "CO Label Buffer")
        {
            column(Value1; "Value 1")
            {
            }
            column(Value2; "Value 2")
            {
            }
            column(Value3; "Value 3")
            {
            }
            column(Value4; "Value 4")
            {
            }
            column(Value5; "Value 5")
            {
            }
            column(QRCode; EncodedText)
            {
            }
            column(Caption1; "Caption 1")
            {
            }
            column(Caption2; "Caption 2")
            {
            }
            column(Caption3; "Caption 3")
            {
            }
            column(Caption4; "Caption 4")
            {
            }
            column(Caption5; "Caption 5")
            {
            }
            column(PKID; PKID)
            {
            }

            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = SORTING(Number);
                column(CopyIndex; CopyLoop.Number) { }

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
                QRString := Barcode;
                BarcodeFontProvider := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
                Symbology2D := Enum::"Barcode Symbology 2D"::"QR-Code";
                EncodedText := BarcodeFontProvider.EncodeFont(QRString, Symbology2D);
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
                        if NumberOfLabels < 1 then
                            Error('Geef minimaal 1 exemplaar op.');
                    end;
                }
            }
        }
        trigger OnOpenPage()
        begin
            NumberOfLabels := 1;
        end;
    }


    var
        EncodedText: Text;
        NumberOfLabels: Integer;



}


