
page 60000 "MuM GR Whse. Receipts API"
{
    PageType = API;

    APIVersion = 'v1.0';
    APIPublisher = 'thecoatinccompanyholding';
    APIGroup = 'tcc';

    EntityCaption = 'MuM Goods Receipt Whse. Receipt Header';
    EntitySetCaption = 'MuM Goods Receipt Whse. Receipt Headers';
    EntityName = 'mumGrWhseReceiptHeader';
    EntitySetName = 'mumGrWhseReceiptHeaders';

    ODataKeyFields = SystemId;
    SourceTable = "MuM GR Whse. Receipt Header";

    Extensible = false;
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                }
                field(receiptDate; Rec."Receipt Date")
                {
                    Caption = 'Receipt Date';
                }
                field(requestedDeliveryDate; Rec."Requested Delivery Date")
                {
                    Caption = 'Requested Delivery Date';
                }
                field(sellToCustomerNo; Rec."Sell-to Customer No.")
                {
                    Caption = 'Sell-to Customer No.';
                }
                field(sellToCustomerName; Rec."Sell-to Customer Name")
                {
                    Caption = 'Sell-to Customer Name';
                }
                field(shipToCode; Rec."Ship-to Code")
                {
                    Caption = 'Ship-to Code';
                }
                field(shipToName; Rec."Ship-to Name")
                {
                    Caption = 'Ship-to Name';
                }
                field(shipToName2; Rec."Ship-to Name 2")
                {
                    Caption = 'Ship-to Name 2';
                }
                field(shipToAddress; Rec."Ship-to Address")
                {
                    Caption = 'Ship-to Address';
                }
                field(shipToAddress2; Rec."Ship-to Address 2")
                {
                    Caption = 'Ship-to Address 2';
                }
                field(shipToCity; Rec."Ship-to City")
                {
                    Caption = 'Ship-to City';
                }
                field(shipToContact; Rec."Ship-to Contact")
                {
                    Caption = 'Ship-to Contact';
                }
                field(shipToPostCode; Rec."Ship-to Post Code")
                {
                    Caption = 'Ship-to Post Code';
                }
                field(shipToCounty; Rec."Ship-to County")
                {
                    Caption = 'Ship-to County';
                }
                field(shipToCountryRegionCode; Rec."Ship-to Country/Region Code")
                {
                    Caption = 'Ship-to Country/Region Code';
                }
                field(shipToPhoneNo; Rec."Ship-to Phone No.")
                {
                    Caption = 'Ship-to Phone No.';
                }
                field(shipmentMethodCode; Rec."Shipment Method Code")
                {
                    Caption = 'Shipment Method Code';
                }
                field(shippingAgentCode; Rec."Shipping Agent Code")
                {
                    Caption = 'Shipping Agent Code';
                }
                field(shippingAgentServiceCode; Rec."Shipping Agent Service Code")
                {
                    Caption = 'Shipping Agent Service Code';
                }
                field(shippingTime; Rec."Shipping Time")
                {
                    Caption = 'Shipping Time';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(externalShipmentNo; Rec."External Shipment No.")
                {
                    Caption = 'External Shipment No.';
                }
                field(externalShipmentDate; Rec."External Shipment Date")
                {
                    Caption = 'External Shipment Date';
                }
                field(externalOrderNo; Rec."External Order No.")
                {
                    Caption = 'External Order No.';
                }
                field(receiptLocationCode; Rec."Receipt Location Code")
                {
                    Caption = 'Receipt Location Code';
                }
                field(receiptBinCode; Rec."Receipt Bin Code")
                {
                    Caption = 'Receipt Bin Code';
                }
                field(blockedLocationCode; Rec."Blocked Location Code")
                {
                    Caption = 'Blocked Location Code';
                }
                field(blockedBinCode; Rec."Blocked Bin Code")
                {
                    Caption = 'Blocked Bin Code';
                }
                field(postComponents; Rec."Post Components")
                {
                    Caption = 'Post Components';
                }
                field(createSalesOrder; Rec."Create Sales Order")
                {
                    Caption = 'Create Sales Order';
                }
                field(createProductionOrder; Rec."Create Production Order")
                {
                    Caption = 'Create Production Order';
                }
                field(createAssemblyOrder; Rec."Create Assembly Order")
                {
                    Caption = 'Create Assembly Order';
                }
                field(productionOrderType; Rec."Production Order Type")
                {
                    Caption = 'Production Order Type';
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                }
                field(createdByUserId; Rec."Created by User ID")
                {
                    Caption = 'Created by User ID';
                }
                field(createdAt; Rec."Created at")
                {
                    Caption = 'Created at';
                }
                field(statusSetByUserId; Rec."Status set by User ID")
                {
                    Caption = 'Status set by User ID';
                }
                field(statusSetAt; Rec."Status set at")
                {
                    Caption = 'Status set at';
                }
                field(lastModifiedByUserId; Rec."Last Modified by User ID")
                {
                    Caption = 'Last Modified by User ID';
                }
                field(lastModifiedAt; Rec."Last Modified at")
                {
                    Caption = 'Last Modified at';
                }
            }
        }
    }

    actions { }
}
