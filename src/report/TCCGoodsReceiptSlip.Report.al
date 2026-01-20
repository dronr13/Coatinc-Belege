report 60129 "TCC Goods Receipt Slip"
{
    UsageCategory = Documents;
    ApplicationArea = All;
    RDLCLayout = './src/report/GoodsReceiptSlip.rdl';
    Caption = 'Goods Receipt Slip';

    dataset
    {
        dataitem(ReceiptHeader; "MuM GR Whse. Receipt Header")
        {
            DataItemTableView = sorting("No.");
            //                    where("Document Type" = const(Quote));
            RequestFilterFields = "No.";

            column(Logo; Company.Picture)
            {
            }
            column(Sender; Sender)
            {
            }
            column(DocNo; "No.")
            {
            }
            column(OrderNo; OrderNo)
            {
            }
            column(Datein; "Receipt Date")
            {
            }
            // column(WeightCart; WeightcartNo) {} // Future use
            column(LicensePlate; "CO Truck License Plate")
            {
            }
            column(DeliveryAddress; "Ship-to Address")
            {
            }
            column(expectedDeliveryDate; "Requested Delivery Date")
            {
            }
            column(Warrenty; "CO Name GRH Property 6")
            {
            }
            column(Ref; "External Order No.")
            {
            }
            // column(ReceiptHeader; ReceiptHeadertxt)
            // {
            // }
            // column(ReceiptFooter; ReceiptFootertxt)
            // {
            // }
            // 

            // Footer info
            column(RCName; RCName)
            {
            }
            column(RCAddress; RCAddress)
            {
            }
            column(RCPostCode; RCPostCode)
            {
            }
            column(RCCity; RCCity)
            {
            }
            column(RCPhoneNo; RCPhoneNo)
            {
            }
            column(RCFaxNo; RCFaxno)
            {
            }
            column(RCEmail; RCEmail)
            {
            }
            column(RCTaxNo; RCTaxNo)
            {
            }
            column(RCWebsite; RCWebsite)
            {
            }
            column(RCManager; "RCManager")
            {
            }
            column(RCTradereg; "RCTradeReg")
            {
            }
            column(RCBank; "RCBank")
            {
            }
            column(RCBankAccount; "RCBankAccount")
            {
            }
            column(RCIBAN; "RCIBAN")
            {
            }
            column(RCBIC; "RCBIC")
            {
            }
            dataitem(ReceiptLine; "MuM GR Whse. Receipt Line")
            {
                DataItemLink = "Document No." = field("No.");

                column(LineNo; "Line No.")
                {
                }
                column("Artikel"; "Item No.")
                {
                }
                // column(Artikel; "Type") { }
                column(Description; Description)
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(Pieces; "CO Name GRL Property 1")
                {
                }
                column(Lenght; "CO Name GRL Property 2")
                {
                }
                column(Widht; "CO Name GRL Property 3")
                {
                }
                column(Height; "CO Name GRL Property 4")
                {
                }
                column(Operations; "Routing No.")
                {
                }

            }
            trigger OnAfterGetRecord()
            var
                // SalesPerson: Record "Salesperson/Purchaser";
                ResponsebilityCenter: Record "Responsibility Center";
                SalesLines: Record "Sales Line";
                Properties: Record "MuM MP Record Property";

            begin
                // Haal het Responsibility Center record expliciet op
                if Firma.Get(ReceiptHeader."CO Responsibility Center") then
                    Sender := Firma.Name + ' ' + Firma.Address + ', ' + Firma."Post Code" + ' ' + Firma.City
                else
                    Sender := '';

                SalesLines.Reset();
                SalesLines.SetRange("MuM GR Whse. Rcpt. No.", ReceiptHeader."No.");
                if SalesLines.FindFirst() then OrderNo := SalesLines."MuM GR Whse. Rcpt. No.";

                //Properties.Reset();
                //Propperties.SetRange("MuM GR Whse. Rcpt. No.", ReceiptHeader."No.");
                //if SalesLines.FindFirst() then OrderNo := SalesLines."MuM GR Whse. Rcpt. No.";
                // if SalesPerson.get(SalesHeader."Salesperson Code") then begin
                //     PurchasePerson := SalesPerson.Name;
                //     PurchasePhone := SalesPerson."Phone No.";
                //     PurchaseEmail := SalesPerson."E-Mail";
                // end;

                if Company.Get() then Company.CalcFields(Picture);

                if ResponsebilityCenter.Get(ReceiptHeader."CO Responsibility Center") then begin
                    RCName := ResponsebilityCenter.Name;
                    RCAddress := ResponsebilityCenter.Address;
                    RCPostCode := ResponsebilityCenter."Post Code";
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
        PiecesLbl = 'Pieces';
        LengthLbl = 'L';
        WidthLbl = 'W';
        HeightLbl = 'H';
        PageLbl = 'Page';
        AnnotationLbl = 'Dear sir/madam ';
    }
    var
        Firma: Record "Responsibility Center";
        Company: Record "Company Information";
        OrderNo: Text;
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
        Annotation: text;
        // ReceiptHeadertxt: text;
        // ReceiptFootertxt: text;
        
}
