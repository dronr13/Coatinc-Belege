report 60126 "TCC Sales Quotation"
{
    UsageCategory = Documents;
    ApplicationArea = All;
    RDLCLayout = './src/report/SalesQuotation.rdl';
    Caption = 'Quotation';

    dataset
    {


        dataitem(SalesHeader; "Sales Header")
        {
            DataItemTableView = sorting("Document Type", "No.")
                                where("Document Type" = const(Quote));
            RequestFilterFields = "No.";
            column(Logo; Company.Picture) { }
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

            column(SalesPersonName; PurchasePerson) { }
            column(SalesPersonPhone; PurchasePhone) { }
            column(SalesPersonEmail; PurchaseEmail) { }

                column(RCName; RCName) { }
                column(RCAddress; RCAddress) { }
                column(RCPostCode; RCPostCode) { }
                column(RCCity; RCCity) { }
                column(RCPhoneNo; RCPhoneNo) { }
                column(RCFaxNo; RCFaxno) { }
                column(RCEmail; RCEmail) { }
                column(RCTaxNo; RCTaxNo) { }
                column(RCWebsite; RCWebsite) { }
                column(RCManager; "RCManager") { }
                column(RCTradereg; "RCTradeReg") { }
                column(RCBank; "RCBank") { }
                column(RCBankAccount; "RCBankAccount") { }
                column(RCIBAN; "RCIBAN") { }
                column(RCBIN; "RCBIC") { }

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



            trigger OnAfterGetRecord()
            var
                SalesPerson: Record "Salesperson/Purchaser";
                ResponsebilityCenter: Record "Responsibility Center";

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

                if SalesPerson.get(SalesHeader."Salesperson Code") then begin
                    PurchasePerson := SalesPerson.Name;
                    PurchasePhone := SalesPerson."Phone No.";
                    PurchaseEmail := SalesPerson."E-Mail";
                end;

                if Company.Get() then
                    Company.CalcFields(Picture);
                

                if ResponsebilityCenter.Get(SalesHeader."Responsibility Center") then begin
                    RCName := ResponsebilityCenter.Name;
                    RCAddress := ResponsebilityCenter.Address;
                    RCPostCode :=  ResponsebilityCenter."Post Code";
                    RCCity := ResponsebilityCenter.City;
                    RCPhoneNo := ResponsebilityCenter."Phone No.";
                    RCFaxNo := ResponsebilityCenter."Fax No.";
                    RCEmail := ResponsebilityCenter."E-Mail";
                    RCTaxNo := ResponsebilityCenter."CO VAT-ID";
                    RCWebsite := ResponsebilityCenter."Home Page";
                    RCManager := ResponsebilityCenter."CO Manager";
                    RCTradereg := ResponsebilityCenter."CO Trade Register";
                    RCBank := ResponsebilityCenter.Bank;
                    RCBankAccount := ResponsebilityCenter.Account;
                    RCIBAN := ResponsebilityCenter.IBAN;
                    RCBIC := ResponsebilityCenter.BIC;
                end;

            end;
        }
    }

    var
        Firma: Record "Responsibility Center";
        Company: Record "Company Information";
        Sender: Text;
        Salutation: Text;

        PurchasePerson: text;
        PurchasePhone: text;
        PurchaseEmail: text;

        RCName: text;
        RCAddress: text;
        RCPostCode: text;
        RCCity: text;
        RCPhoneNo: text;
        RCFaxNo: text;
        RCEmail: text;
        RCTaxNo: text;
        RCWebsite: text;
        RCManager: text;
        RCTradereg: text;
        RCBank: text;
        RCBankAccount: Text;
        RCIBAN: text;
        RCBIC: text;



}
