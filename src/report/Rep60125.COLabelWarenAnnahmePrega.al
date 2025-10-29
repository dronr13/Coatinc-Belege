report 60125 "CO Label Waren Annahme Prega"
{
    ApplicationArea = All;
    Caption = 'Label Warenannahmen';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './src/report/LabelWarenAnnahmePrega.rdl';
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
            column(Value6; "Value 6")
            {
            }
            column(Value7; "Value 7")
            {
            }
            column(Value8; "Value 8")
            {
            }
            column(Value9; "Value 9")
            {
            }
            column(Value10; "Value 10")
            {
            }
            column(Value11; "Value 11")
            {
            }
            column(Value12; "Value 12")
            {
            }
            column(Value13; "Value 13")
            {
            }
            column(Value14; "Value 14")
            {
            }
            column(Value15; "Value 15")
            {
            }
            column(Value16; "Value 16")
            {
            }
            column(Value17; "Value 17")
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
            column(Caption6; "Caption 6")
            {
            }
            column(Caption7; "Caption 7")
            {
            }
            column(Caption8; "Caption 8")
            {
            }
            column(Caption9; "Caption 9")
            {
            }
            column(Caption10; "Caption 10")
            {
            }
            column(Caption11; "Caption 11")
            {
            }
            column(Caption21; "Caption 12")
            {
            }
            column(Caption13; "Caption 13")
            {
            }
            column(Caption14; "Caption 14")
            {
            }
            column(Caption15; "Caption 15")
            {
            }

            column(Caption16; "Caption 16")
            {
            }
            column(Caption17; "Caption 17")
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


