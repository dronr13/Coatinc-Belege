report 60135 "TCC Warehouse Label"
{
    Caption = 'Warehouse Label';
    UsageCategory = None;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/report/WarehouseLabel.rdl';

    dataset
    {
        dataitem(PackageLabel; "TCC Package Label")
        {
            RequestFilterFields = "Campaign No.", "Package Group No.", "Collo No.";

            column(CampaignNo; "Campaign No.") { }

            column(LineNo; "Line No.") { }

            column(PackageCode; "Package Code") { }

            column(ColloNo; "Collo No.") { }

            column(Weight; Weight) { }

            column(CustomerNo; "Customer No.") { }

            column(CustomerName; "Customer Name") { }

            column(OrderReference; "Order Reference") { }

            column(GoodsReceiptNo; "Goods Receipt No.") { }

            column(ProdOrderNo; "Prod. Order No.") { }

            column(PackageGroupNo; "Package Group No.") { }

            column(CoFinishedWhseBinCode; "Co Finished Whse. Bin Code") { }

            column(RespCenterName; "Resp. Center Name") { }

            column(RespCenterAddress; "Resp. Center Address") { }

            column(RespCenterPostCodeCity; "Resp. Center PostCode/City") { }

            column(Item_Description; "Item Description") { }

            column(SalesOrderNo; "Sales Order No.") { }

            // eventueel nog debug / andere velden als hulp in layout
            column(DebugText; "Debug Text") { }
            column(QRCode; EncodedText)
            {
            }


            trigger OnAfterGetRecord()
            var
                QRString: Text;
                BarcodeFontProvider: Interface "Barcode Font Provider 2D";
                Symbology2D: Enum "Barcode Symbology 2D";
            begin
                QRString := "Collo No.";
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
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    // voorlopig leeg; filters komen via SetTableView / RunModal
                }
            }
        }
    }

    labels
    {
        CampaignNoLbl = 'Campaign No.', Comment = 'Caption for Campaign No.';
        LineNoLbl = 'Line No.', Comment = 'Caption for Line No.';
        PackageCodeLbl = 'Package Code', Comment = 'Caption for Package Code.';
        ColloNoLbl = 'Collo No.', Comment = 'Caption for Collo No.';
        WeightLbl = 'Weight', Comment = 'Caption for Weight.';

        CustomerNoLbl = 'Customer No.', Comment = 'Caption for Customer No.';
        CustomerNameLbl = 'Customer Name', Comment = 'Caption for Customer Name.';
        OrderReferenceLbl = 'Order Reference', Comment = 'Caption for Order Reference.';
        GoodsReceiptNoLbl = 'Goods Receipt No.', Comment = 'Caption for Goods Receipt No.';

        ProdOrderNoLbl = 'Prod. Order No.', Comment = 'Caption for Prod. Order No.';
        PackageGroupNoLbl = 'Package Group No.', Comment = 'Caption for Package Group No.';
        CoFinishedWhseBinCodeLbl = 'Co Finished Whse. Bin Code', Comment = 'Caption for Finished Warehouse Bin Code.';

        RespCenterNameLbl = 'Responsibility Center Name', Comment = 'Caption for Responsibility Center Name.';
        RespCenterAddressLbl = 'Responsibility Center Address', Comment = 'Caption for Responsibility Center Address.';
        RespCenterPostCodeCityLbl = 'Responsibility Center PostCode/City', Comment = 'Caption for Responsibility Center PostCode and City.';

        ItemDescriptionLbl = 'Item Description';
        SalesOrderNoLbl = 'Sales Order No.';

        DebugTextLbl = 'Debug Text', Comment = 'Caption for Debug Text.';
    }

    var
        EncodedText: Text;
        NumberOfLabels: Integer;
}
