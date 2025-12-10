report 60126 "CO Sales Quotation"
{
    UsageCategory = Documents;
    ApplicationArea = All;
    RDLCLayout = './src/report/SalesQuotation.rdl';
    Caption = 'Quotation';

    dataset
    {
        dataitem("Company Information"; "Company Information")
        {
            column(Logo; Picture) { }
        }

        dataitem(SalesHeader; "Sales Header")
        {
            DataItemTableView = sorting("Document Type", "No.")
                                where("Document Type" = const(Quote));
            RequestFilterFields = "No.";

            column(Sender; Sender) { }
            column(DocNo; "No.") { }
            column(ResponsibilityCenter; "Responsibility Center") { }
            column(SalespersonCode; "Salesperson Code") { }
            column(CustomerName; "Bill-to Name") { }
            column(CustomerAddress; "Bill-to Address") { }
            column(CustomerPostCodeCity; "Bill-to Post Code" + ' ' + "Bill-to City") { }
            column(No; "No.") { }
            column(Ref; "Your Reference") { }
            column(QuoteDate; "Prepmt. Pmt. Discount Date") { }
            column(contact; "Bill-to Contact") { }
            column(Annotation; 'Sehr geehrter Herr/Frau ' + "Bill-to Contact" + ',') { }

            dataitem(SalesLine; "Sales Line")
            {
                DataItemLink = "Document Type" = field("Document Type"),
                               "Document No." = field("No.");
                column(LineNo; "Line No.") { }
                column(Artikel; "Type") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(UnitOfMeasure; "Unit of Measure") { }
                column(UnitPrice; "Unit Price") { }
            }

            dataitem(RespCenter; "Responsibility Center")
            {
                DataItemLink = Code = field("Responsibility Center");
                column(RCName; Name) { }
                column(RCAddress; "Address") { }
                column(RCPostCode; "Post Code") { }
                column(RCCity; City) { }
                column(RCPhoneNo; "Phone No.") { }
                column(RCFaxNo; "Fax No.") { }
                column(RCEmail; "E-Mail") { }
                column(RCTaxNo; "CO VAT-ID") { }
                column(RCWebsite; "Home Page") { }
                column(RCManager; "CO Manager") { }
                column(RCTradereg; "CO Trade Register") { }
            }

            dataitem("Salesperson/Purchaser"; "Salesperson/Purchaser")
            {
                DataItemLink = "Code" = field("Salesperson Code");
                column(BeraterName; Name) { }
                column(BeraterEmail; "E-Mail") { }
                column(BeraterPhoneNo; "Phone No.") { }
            }

            trigger OnAfterGetRecord()
            begin
                // Haal het Responsibility Center record expliciet op
                if Firma.Get("Responsibility Center") then
                    Sender :=
                        Firma.Name + ' ' +
                        Firma.Address + ', ' +
                        Firma."Post Code" + ' ' +
                        Firma.City
                else
                    Sender := '';
            end;
        }
    }

    var
        Firma: Record "Responsibility Center";
        Sender: Text;
        Salutation: Text;
}
