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
            column(Logo; Picture)
            {
            }
        }
        dataitem(SalesHeader; "Sales Header")
        {
            DataItemTableView = sorting("Document Type", "No.") where("Document Type" = const(Quote));

            column(DocNo; "No.")
            {
            }
            column(ResponsibilityCenter; "Responsibility Center")
            {
            }
            column(SalespersonCode; "Salesperson Code")
            {
            }
            column(CustomerName; "Bill-to Name")
            {
            }
            column(CustomerAddress; "Bill-to Address")
            {
            }
            column(CustomerPostCode; "Bill-to Post Code")
            {
            }
            column(CustomerCity; "Bill-to City")
            {
            }
            column(No; "No.")
            {
            }
            Column(Ref; "Your Reference")
            {
            }
            column(QuoteDate; "Prepmt. Pmt. Discount Date")
            {
            }
            column(contact; "Bill-to Contact")
            {
            }
            dataitem(SalesLine; "Sales Line")
            {

                DataItemLink = "Document Type" = field("Document Type"),
                               "Document No." = field("No.");
                column(LineNo; "Line No.")
                {
                }
                column(Artikel; "Type")
                {
                }
                column(Description; Description)
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(UnitOfMeasure; "Unit of Measure")
                {
                }
                column(UnitPrice; "Unit Price")
                {
                }

            }

            dataitem(RespCenter; "Responsibility Center")
            {
                DataItemLink = Code = field("Responsibility Center");
                column(RCName; Name)
                {
                }
                column(RCAddress; "Address")
                {
                }
                column(RCPostCode; "Post Code")
                {
                }
                column(RCCity; City)
                {
                }
                column(RCPhoneNo; "Phone No.")
                {
                }
                column(RCFaxNo; "Fax No.")
                {
                }
                column(RCEmail; "E-Mail")
                {
                }
//                column(RCTaxNo; "CO Tax Identification No.")
//                {
//                }
                column(RCWebsite; "Home Page")
                {
                }
//                column(RCManager; RespCenter."CO Manager")
//                {
//                }

            }

            dataitem("Salesperson/Purchaser"; "Salesperson/Purchaser")
            {
                DataItemLink = "Code" = field("Salesperson Code");
                column(Name; Name)
                {
                }
                column(Email; "E-Mail")
                {
                }
                column(PhoneNo; "Phone No.")
                {
                }
            }
            trigger OnAfterGetRecord()
            begin
            end;

        }
        
    }
    var
        Einkäufer: Record "Salesperson/purchaser";
        Firma: Record "Responsibility Center";

        Salutation: text;

}