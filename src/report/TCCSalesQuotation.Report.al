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
            DataItemTableView = sorting("Document Type", "No.") where("Document Type" = const(Quote));
            RequestFilterFields = "No.";

            column(Logo; Company.Picture) { }
            column(Sender; Sender) { }
            column(DocNo; "No.") { }
            column(ResponsibilityCenter; "Responsibility Center") { }
            column(SalespersonCode; "Salesperson Code") { }
            column(CustomerName; "Bill-to Name") { }
            column(CustomerAddress; "Bill-to Address") { }
            column(CustomerPostCodeCity; "Bill-to Post Code" + ' ' + "Bill-to City") { }
            column(QuotationNo; "No.") { }
            column(Ref; "Your Reference") { }
            column(QuoteDate; "Prepmt. Pmt. Discount Date") { }
            column(Contact; "Bill-to Contact") { }
            column(Annotation; Annotation) { }
            column(SalesPersonName; PurchasePerson) { }
            column(SalesPersonPhone; PurchasePhone) { }
            column(SalesPersonEmail; PurchaseEmail) { }
            column(RCName; RCName) { }
            column(RCAddress; RCAddress) { }
            column(RCPostCode; RCPostCode) { }
            column(RCCity; RCCity) { }
            column(RCPhoneNo; RCPhoneNo) { }
            column(RCFaxNo; RCFaxNo) { }
            column(RCEmail; RCEmail) { }
            column(RCTaxNo; RCTaxNo) { }
            column(RCWebsite; RCWebsite) { }
            column(RCManager; RCManager) { }
            column(RCTradereg; RCTradereg) { }
            column(RCBank; RCBank) { }
            column(RCBankAccount; RCBankAccount) { }
            column(RCIBAN; RCIBAN) { }
            column(RCBIC; RCBIC) { }
            column(SalesQuoteText; SalesQuoteText) { }
            column(SalesQuoteTextFooter; SalesQuoteTextFooter) { }

            dataitem(SalesLine; "Sales Line")
            {
                DataItemLink = "Document Type" = field("Document Type"),
                               "Document No." = field("No.");

                column(LineNo; "Line No.") { }
                column(ArtikelCode; "No.") { }
                column(ArtikelType; "Type") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(UnitOfMeasure; "Unit of Measure") { }
                column(UnitPrice; "Unit Price") { }
                column(SalesQuoteLineText; SalesQuoteLineText) { }
            }

            trigger OnAfterGetRecord()
            var
                SalesPerson: Record "Salesperson/Purchaser";
                ResponsibilityCenterRec: Record "Responsibility Center";
                MuMETExtendedTextMgt: Codeunit "MuM ET Extended Text Mgt.";
                DocumentTextHeader: Record "MuM ET Document Text Header";
                PrintType: Enum "MuM ET Printing Type";
                SubPrintType: Enum "MuM ET Sub-Printing Type";
            begin
                // Sender based on Responsibility Center
                if Firma.Get("Responsibility Center") then
                    Sender := Firma.Name + ' ' + Firma.Address + ', ' + Firma."Post Code" + ' ' + Firma.City
                else
                    Sender := '';

                // Salesperson info
                if SalesPerson.Get(SalesHeader."Salesperson Code") then begin
                    PurchasePerson := SalesPerson.Name;
                    PurchasePhone := SalesPerson."Phone No.";
                    PurchaseEmail := SalesPerson."E-Mail";
                end;

                // Company logo
                if Company.Get() then
                    Company.CalcFields(Picture);

                // Responsibility center details
                if ResponsibilityCenterRec.Get(SalesHeader."Responsibility Center") then begin
                    RCName := ResponsibilityCenterRec.Name;
                    RCAddress := ResponsibilityCenterRec.Address;
                    RCPostCode := ResponsibilityCenterRec."Post Code";
                    RCCity := ResponsibilityCenterRec.City;
                    RCPhoneNo := ResponsibilityCenterRec."Phone No.";
                    RCFaxNo := ResponsibilityCenterRec."Fax No.";
                    RCEmail := ResponsibilityCenterRec."E-Mail";
                    RCTaxNo := ResponsibilityCenterRec."CO VAT-ID";
                    RCWebsite := ResponsibilityCenterRec."Home Page";
                    RCManager := ResponsibilityCenterRec."CO Manager";
                    RCTradereg := ResponsibilityCenterRec."CO Trade Register";
                    RCBank := ResponsibilityCenterRec.Bank;
                    RCBankAccount := ResponsibilityCenterRec.Account;
                    RCIBAN := ResponsibilityCenterRec.IBAN;
                    RCBIC := ResponsibilityCenterRec.BIC;
                end;

                // Annotation text
                Annotation := 'Sehr geehrter Herr/Frau ' + "Bill-to Contact" + ',';

                // Header extended text
                if DocumentTextHeader.Get(
                     Database::"Sales Header",
                     "MuM ET Document Type"::Quote,
                     DocumentTextHeader."Document Type"::Quote,
                     SalesHeader."No.")
                then
                    SalesQuoteText :=
                      MuMETExtendedTextMgt.GetDocumentMediaAsText(
                        DocumentTextHeader,
                        PrintType::Report,
                        SubPrintType::Header);

                // Footer extended text
                if DocumentTextHeader.Get(
                     Database::"Sales Header",
                     "MuM ET Document Type"::Quote,
                     DocumentTextHeader."Document Type"::Quote,
                     SalesHeader."No.")
                then
                    SalesQuoteTextFooter :=
                      MuMETExtendedTextMgt.GetDocumentMediaAsText(
                        DocumentTextHeader,
                        PrintType::Report,
                        SubPrintType::Footer);

                // Line extended text
                SalesQuoteLineText :=
                  MuMETExtendedTextMgt.GetDocumentMediaAsText(
                    SalesLine,
                    Enum::"MuM ET Printing Type"::Report,
                    Enum::"MuM ET Sub-Printing Type"::"After Position");
            end;
        }
    }

    labels
    {
        QuotationNoLbl = 'Quotation Number';
        YourRefLbl = 'Your Reference';
        QuoteDateLbl = 'Quotation Date';
        SalesPersonNameLbl = 'Salesperson';
        SalesPersonPhoneLbl = 'Phone';
        SalesPersonEmailLbl = 'E-Mail';
        RCBankLbl = 'Bank Name';
        RCBankAccountLbl = 'Bank account';
        RCIBANLbl = 'IBAN';
        RCBICLbl = 'BIC';
        ArtikelCodeLbl = 'Item No.';
        ArtikelTypeLbl = 'Type';
        DescriptionLbl = 'Description';
        QuantityLbl = 'Quantity';
        UnitOfMeasureLbl = 'Unit of Measure';
        UnitPriceLbl = 'Unit Price';
        PageLbl = 'Page';
        AnnotationLbl = 'Dear sir/madam ';
    }

    var
        Firma: Record "Responsibility Center";
        Company: Record "Company Information";
        Sender: Text;
        Annotation: Text;
        PurchasePerson: Text;
        PurchasePhone: Text;
        PurchaseEmail: Text;
        RCName: Text;
        RCAddress: Text;
        RCPostCode: Text;
        RCCity: Text;
        RCPhoneNo: Text;
        RCFaxNo: Text;
        RCEmail: Text;
        RCTaxNo: Text;
        RCWebsite: Text;
        RCManager: Text;
        RCTradereg: Text;
        RCBank: Text;
        RCBankAccount: Text;
        RCIBAN: Text;
        RCBIC: Text;
        SalesQuoteText: Text;
        SalesQuoteTextFooter: Text;
        SalesQuoteLineText: Text;
}
