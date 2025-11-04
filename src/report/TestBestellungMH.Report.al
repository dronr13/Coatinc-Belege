report 60123 "CO Test Bestellung MH"
{
    UsageCategory = Documents;
    ApplicationArea = All;
    RDLCLayout = './src/report/TestBestellung.rdl';
    Caption = 'Bestellung';


    dataset
    {
        dataitem("PurchaseHeader"; "Purchase Header")
        {
            column(Bestell_Nr_Caption; FieldCaption("No."))
            {

            }

            column(Bestell_Nr; "No.")
            {

            }
            column(Einkäufer_name_Caption; ("EinkäuferName_Caption"))
            {

            }
            column(Einkäufer_name; Einkäufer.Name)
            {

            }
            column(Einkäufer_email_Caption; (EinkäuferEmail_Caption))
            {

            }
            column(Einkäufer_email; Einkäufer."E-Mail")
            {
            }
            column(Einkäufer_telefon_Caption; ("EinkäuferTelefon_Caption"))
            {

            }
            column(Einkäufer_telefon; Einkäufer."Phone No.")
            {

            }
            column(Einkäufer_funktion_Caption; ("EinkäuferFunction_Caption"))
            {

            }
            column(Einkäufer_function; Einkäufer."Job Title")
            {

            }
            column(Firma_name; Firma.Name)
            {
            }
            column(Firma_adres; Firma.Address)
            {

            }
            column(PLZ_Stadt; PLZ_Stadt)
            {

            }
            column(Bestellung_Nr; Bestellung_Nummer)
            {

            }
            column(GesamtBetrag; Zwischensumme)
            {

            }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document type" = field("document type"),
                                "Document No." = field("No.");
                column(Zeilennr; "Line No.")
                {

                }
                column(Artikelnr; "No.")
                {

                }
                column(Beschreibung; "Description")
                {

                }
                column(Einkaufspreis; "Unit Cost")
                {

                }
                column(Zielenbetrag; "Line Amount")
                {

                }
                column(Menge; "Quantity")
                {

                }
                trigger OnAfterGetRecord()
                begin
                    Zwischensumme += "Line Amount";
                end;







            }
            trigger OnAfterGetRecord()
            begin
                If "Einkäufer".get(PurchaseHeader."Purchaser Code") then begin
                    "EinkäuferEmail_Caption" := 'E-mail';
                    "EinkäuferFunction_Caption" := 'Funktion';
                    "EinkäuferTelefon_Caption" := 'Telefon';
                end;
                if "Firma".get('CBO') then
                    PLZ_Stadt := Firma."Post Code" + ' ' + "Firma".City;

                Bestellung_Nummer := 'Bestellung' + ' ' + PurchaseHeader."No.";
            end;

        }
    }


    var
        Einkäufer: Record "Salesperson/purchaser";
        Firma: Record "Responsibility Center";
        EinkäuferName_Caption: text;
        EinkäuferEmail_Caption: text;
        EinkäuferTelefon_Caption: text;
        EinkäuferFunction_Caption: text;
        PLZ_Stadt: text;
        Bestellung_Nummer: text;
        Zwischensumme: Decimal;
}