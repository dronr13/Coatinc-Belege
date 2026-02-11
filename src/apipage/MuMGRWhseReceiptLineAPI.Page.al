page 60003 "MuM GR Whse. Receipt Line API"
{
    PageType = API;

    APIVersion = 'v1.0';
    APIPublisher = 'thecoatinccompanyholding';
    APIGroup = 'tcc';

    EntityCaption = 'MuM Goods Receipt Whse. Receipt Line';
    EntitySetCaption = 'MuM Goods Receipt Whse. Receipt Lines';
    EntityName = 'mumGrWhseReceiptLine';
    EntitySetName = 'mumGrWhseReceiptLines';

    ODataKeyFields = SystemId;
    SourceTable = "MuM GR Whse. Receipt Line";
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
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field(quantityBase; Rec."Quantity (Base)")
                {
                    Caption = 'Quantity (Base)';
                }
                field(qtyPerUom; Rec."Qty. per Unit of Measure")
                {
                    Caption = 'Qty. per Unit of Measure';
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                }
                field(requestedDeliveryDate; Rec."Requested Delivery Date")
                {
                    Caption = 'Requested Delivery Date';
                }
                field(itemReferenceNo; Rec."Item Reference No.")
                {
                    Caption = 'Item Reference No.';
                }
                field(itemReferenceType; Rec."Item Reference Type")
                {
                    Caption = 'Item Reference Type';
                }
                field(itemReferenceTypeNo; Rec."Item Reference Type No.")
                {
                    Caption = 'Item Reference Type No.';
                }
                field(routingNo; Rec."Routing No.")
                {
                    Caption = 'Routing No.';
                }
                field(allocation2; Rec."Allocation 2")
                {
                    Caption = 'Allocation';
                }
                field(lotSizeAllocation; Rec."Lot Size Allocation")
                {
                    Caption = 'Lot Size for Allocation';
                }
                field(roundingPrecAllocation; Rec."Rounding Prec. for Allocation")
                {
                    Caption = 'Lot Rounding Precision for Allocation';
                }
                field(sourceDocumentType; Rec."Source Document Type")
                {
                    Caption = 'Source Document Type';
                }
                field(sourceDocumentNo; Rec."Source Document No.")
                {
                    Caption = 'Source Document No.';
                }
                field(sourceDocumentLineNo; Rec."Source Document Line No.")
                {
                    Caption = 'Source Document Line No.';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(blockComponents; Rec."Block Components")
                {
                    Caption = 'Block Components';
                }
                field(salesOrderNo; Rec."Sales Order No.")
                {
                    Caption = 'Sales Order No.';
                }
                field(salesOrderLineNo; Rec."Sales Order Line No.")
                {
                    Caption = 'Sales Order Line No.';
                }
                field(createdByUserId; Rec."Created by User ID")
                {
                    Caption = 'Created by User ID';
                }
                field(createdAt; Rec."Created at")
                {
                    Caption = 'Created at';
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
}
