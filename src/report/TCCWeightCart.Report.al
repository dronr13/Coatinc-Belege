report 60130 "TCC Weight Cart"
{
    UsageCategory = Documents;
    ApplicationArea = All;
    RDLCLayout = './src/report/WeightCard.rdl';
    Caption = 'Weight Card';

    dataset
    {
        dataitem(ReceiptHeader; "MuM GR Whse. Receipt Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";

            column(Logo; Company.Picture) { }
            column(Sender; Sender) { }
            column(CustomerName; "Sell-to Customer Name") { }
            column(CustomerContact; CustomerContact) { }
            column(CustomerAddress; CustomerAddress) { }
            column(CustomerPostcodeCity; CustomerPostcodeCity) { }
            column(DocNo; "No.") { }
            column(OrderNo; OrderNo) { }
            column(Datein; "Receipt Date") { }
            column(LicensePlate; "CO Truck License Plate") { }
            column(DeliveryAddress; "Ship-to Address") { }
            column(expectedDeliveryDate; "Requested Delivery Date") { }
            column(Warrenty; "CO Name GRH Property 7") { }
            column(Ref; "External Order No.") { }

            // Header text (base English + optional country-specific translation from Media)
            column(ReceiptHeaderTxt; ReceiptHeaderTxt) { }

            // Footer info
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

            dataitem(ReceiptLine; "MuM GR Whse. Receipt Line")
            {
                DataItemLink = "Document No." = field("No.");

                column(LineNo; "Line No.") { }
                column("Artikel"; "Item No.") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(Pieces; "CO Name GRL Property 1") { }
                column(Lenght; "CO Name GRL Property 2") { }
                column(Widht; "CO Name GRL Property 3") { }
                column(Height; "CO Name GRL Property 4") { }
                column(Operations; "Routing No.") { }
            }

            trigger OnAfterGetRecord()
            var
                ResponsibilityCenter: Record "Responsibility Center";
                SalesLines: Record "Sales Line";
                Properties: Record "MuM MP Record Property";
                CustomerDetails: Record Customer;

                TemplateText: Record "MuM ET Template";
                TranslationText: Record "MuM ET Translation Text";
                TenantMedia: Record "Tenant Media";

                CustCountryCode3: Code[3];
                StdTextCode: Code[20];
                HasTranslations: Boolean;

                InStr: InStream;
                LineTxt: Text;
            begin
                // Sender based on Responsibility Center
                if Firma.Get(ReceiptHeader."CO Responsibility Center") then
                    Sender := Firma.Name + ' ' + Firma.Address + ', ' + Firma."Post Code" + ' ' + Firma.City
                else
                    Sender := '';

                // Get OrderNo from Sales Line
                SalesLines.Reset();
                SalesLines.SetRange("MuM GR Whse. Rcpt. No.", ReceiptHeader."No.");
                if SalesLines.FindFirst() then
                    OrderNo := SalesLines."MuM GR Whse. Rcpt. No.";

                // Get customer details and 3-letter country code (e.g. NLD, DEU)
                if CustomerDetails.Get(ReceiptHeader."Sell-to Customer No.") then begin
                    CustomerContact := CustomerDetails.Contact;
                    CustomerAddress := CustomerDetails.Address;
                    CustomerPostcodeCity := CustomerDetails."Post Code" + ' ' + CustomerDetails.City;
                    CustCountryCode3 := CustomerDetails."Country/Region Code";
                end else
                    CustCountryCode3 := '';

                // Company logo
                if Company.Get() then
                    Company.CalcFields(Picture);

                // Footer data from Responsibility Center
                if ResponsibilityCenter.Get(ReceiptHeader."CO Responsibility Center") then begin
                    RCName := ResponsibilityCenter.Name;
                    RCAddress := ResponsibilityCenter.Address;
                    RCPostCode := ResponsibilityCenter."Post Code";
                    RCCity := ResponsibilityCenter.City;
                    RCPhoneNo := ResponsibilityCenter."Phone No.";
                    RCFaxNo := ResponsibilityCenter."Fax No.";
                    RCEmail := ResponsibilityCenter."E-Mail";
                    RCTaxNo := ResponsibilityCenter."CO VAT-ID";
                    RCWebsite := ResponsibilityCenter."Home Page";
                    RCManager := ResponsibilityCenter."CO Manager";
                    RCTradereg := ResponsibilityCenter."CO Trade Register";
                    RCBank := ResponsibilityCenter.Bank;
                    RCBankAccount := ResponsibilityCenter.Account;
                    RCIBAN := ResponsibilityCenter.IBAN;
                    RCBIC := ResponsibilityCenter.BIC;
                end;
            end;
        }
    }

    requestpage
    {
    }

    labels
    {
        ConfirmationNoLbl = 'Confirmation Number';
        YourRefLbl = 'Your Reference';
        DateInLbl = 'Date goods in';
        WeightCartNoLbl = 'Weight Card No';
        RegistrationPlatebl = 'Registration plate';
        DeliveryAddressLbl = 'Delivery Address';
        EstimatedDeliceryDateLbl = 'Estimated Delivery Date';
        OperationsLbl = 'Operations';
        ColorLbl = 'Color';
        WarentyOrder = 'Warrenty order';
        ArticleLbl = 'Article';
        DiscriptionLbl = 'Discription';
        PiecesLbl = 'Pieces';
        LengthLbl = 'L';
        WidthLbl = 'W';
        HeightLbl = 'H';
        PageLbl = 'Page';
        AnnotationLbl = 'Dear sir/madam ';
        DeliverySignage = 'Singature Delivery';
        DateDelivery = 'Date Delivery';
        LocationSignage = 'Signature Plant';
    }

    var
        Firma: Record "Responsibility Center";
        Company: Record "Company Information";
        OrderNo: Text;
        Sender: Text;
        Salutation: Text;
        CustomerContact: Text;
        CustomerAddress: Text;
        CustomerPostcodeCity: Text;
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
        Annotation: Text;

        // Header text
        ReceiptHeaderTxt: Text;
        ReceiptFooterTxt: Text;
}
