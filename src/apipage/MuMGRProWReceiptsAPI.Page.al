page 60001 "MuM GR Pro. W. Receipts API"
{
    PageType = API;

    APIVersion = 'v1.0';
    APIPublisher = 'thecoatinccompanyholding';
    APIGroup = 'tcc';

    EntityCaption = 'MuM Processed Goods Receipt Whse. Receipt Header';
    EntitySetCaption = 'MuM Processed Goods Receipt Whse. Receipt Headers';
    EntityName = 'mumGrProWhseReceiptHeader';
    EntitySetName = 'mumGrProWhseReceiptHeaders';

    ODataKeyFields = SystemId;
    SourceTable = "MuM GR Pro. W. Rcpt. Header";

    Extensible = false;
    Editable = false;

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
                    // Typ: DateFormula
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
                field(correction; Rec.Correction)
                {
                    Caption = 'Correction';
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
                    // Typ: Option "Item Order", "Project Order"
                }
                field(sourceDocumentNo; Rec."Source Document No.")
                {
                    Caption = 'Source Document No.';
                }
                field(createdByUserId; Rec."Created by User ID")
                {
                    Caption = 'Created by User ID';
                    Editable = false;
                }
                field(createdAt; Rec."Created at")
                {
                    Caption = 'Created at';
                    Editable = false;
                }
                field(statusSetByUserId; Rec."Status set by User ID")
                {
                    Caption = 'Status set by User ID';
                }
                field(statusSetAt; Rec."Status set at")
                {
                    Caption = 'Status set at';
                }
                field(processedByUserId; Rec."Processed by User ID")
                {
                    Caption = 'Processed by User ID';
                    Editable = false;
                }
                field(processedAt; Rec."Processed at")
                {
                    Caption = 'Processed at';
                    Editable = false;
                }
                field(lastModifiedByUserId; Rec."Last Modified by User ID")
                {
                    Caption = 'Last Modified by User ID';
                    Editable = false;
                }
                field(lastModifiedAt; Rec."Last Modified at")
                {
                    Caption = 'Last Modified at';
                    Editable = false;
                }
                //field(coPickup; Rec."CO Pickup")
                //{
                //    Caption = 'CO Pickup';
                //}
                //field(coPickupFromDate; Rec."CO Pickup-from Date")
                //{
                //    Caption = 'CO Pickup-from Date';
                //}
                field(coPickupFromName; Rec."CO Pickup-from Name")
                {
                    Caption = 'CO Pickup-from Name';
                }
                field(coPickupFromName2; Rec."CO Pickup-from Name 2")
                {
                    Caption = 'CO Pickup-from Name 2';
                }
                field(coPickupFromAddress; Rec."CO Pickup-from Address")
                {
                    Caption = 'CO Pickup-from Address';
                }
                field(coPickupFromCity; Rec."CO Pickup-from City")
                {
                    Caption = 'CO Pickup-from City';
                }
                field(coPickupFromPostalCode; Rec."CO Pickup-from Postal Code")
                {
                    Caption = 'CO Pickup-from Postal Code';
                }
                field(coPickupToCtryRegCode; Rec."CO Pickup-to Ctry/Reg. Code")
                {
                    Caption = 'CO Pickup-to Ctry/Reg. Code';
                }
                //field(coResponsibilityCenter; Rec."CO Responsibility Center")
                //{
                //    Caption = 'CO Responsibility Center';
                //}
            }
        }
    }

    actions { }
}
