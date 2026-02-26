report 60131 "TCC Weight Cart Exit"
{
    UsageCategory = Documents;
    ApplicationArea = All;
    RDLCLayout = './src/report/WeightCardExit.rdl';
    Caption = 'Weight Card Exit';

    dataset
    {
        dataitem(ShipmentHeader; "Warehouse Shipment Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";

            column(Logo; Company.Picture) { }
            column(Sender; Sender) { }
            column(CustomerContact; CustomerContact) { }
            column(DocNo; "No.") { }
            column(OrderNo; OrderNo) { }
            column(Datein; "Posting Date") { }
            column(LicensePlate; "CO Truck License Plate") { }
            column(CO_Weighing_Type_Values; "CO Weighing Type Values") { }
            column(CO_Initial_Weight; "CO Initial Weight") { }
            column(CO_Second_Weight; "CO Second Weight") { }
            column(CO_Weighed_Weight; "CO Weighed Weight") { }
            column(CO_comment; "CO Comment") { }
            column(DeliveryAddress; Empty) { }
            column(expectedDeliveryDate; Empty) { }
            column(Warrenty; "Warrenty") { }
            column(Ref; Empty) { }

            // Header text (base English + optional country-specific translation from Media)
            column(ReceiptHeaderTxt; ReceiptHeaderTxt) { }

            dataitem(WarehouseLine; "Warehouse shipment Line")
            {
                DataItemLink = "No." = field("No.");

                column(Ordernr; "Source No.") { }

                dataitem(customerdata; "Sales Header")
                {
                    DataItemLink = "No." = field("Source No.");
                    column(CustomerName; "bill-to Name") { }
                    column(CustomerAddress; "Ship-to Address") { }
                    column(CustomerPostcodeCity; "Ship-to Post Code" + ' ' + "Ship-to City") { }

                }
            }

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


            trigger OnAfterGetRecord()
            var
                ResponsibilityCenter: Record "Responsibility Center";
                RecieptLines: Record "Warehouse Shipment Line";
                SalesHeader: Record "Sales Header";
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
                // Shotcut values
                Empty := '';

                // Sender based on Responsibility Center
                if Firma.Get(ShipmentHeader."TCC Resp. Center") then
                    Sender := Firma.Name + ' ' + Firma.Address + ', ' + Firma."Post Code" + ' ' + Firma.City
                else
                    Sender := '';

                // Company logo
                if Company.Get() then
                    Company.CalcFields(Picture);

                // Footer data from Responsibility Center
                if ResponsibilityCenter.Get(ShipmentHeader."TCC Resp. Center") then begin
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
        GoodReceiptNoLbl = 'Good Receipt Number';
        YourRefLbl = 'Your Reference';
        DateInLbl = 'Date goods in';
        WeightCartNoLbl = 'Weight Card No';
        RegistrationPlateLbl = 'Registration plate';
        FirstWeightLbl = 'First Weight';
        SecondeWeightLbl = 'Second Weight';
        WeightedWeightLbl = 'Weighted Weight';
        WeightTypeLbl = 'Weight Type';
        CommentLbl = 'Comment';
        WeightMasterLbl = 'Weight Master';
        DateFirstWeightLbl = 'Date First Weight';
        DateSecondWeightLbl = 'Date Second Weight';
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
        DeliverySignageLbl = 'Singature Delivery';
        DateDeliveryLbl = 'Date Delivery';
        LocationSignageLbl = 'Signature Plant';
    }

    var
        Firma: Record "Responsibility Center";
        Company: Record "Company Information";
        OrderNo: Text;
        Sender: Text;
        Salutation: Text;
        CustomerName: Text;
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
        Empty: text;
        Warrenty: text;

        // Header text
        ReceiptHeaderTxt: Text;
        ReceiptFooterTxt: Text;
}
