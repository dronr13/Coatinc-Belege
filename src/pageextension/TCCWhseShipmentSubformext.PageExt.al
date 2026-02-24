pageextension 60158 "TCC Whse. Shipment Subform ext" extends "Whse. Shipment Subform"
{
    layout
    {
        addafter("Source No.")
        {
            field("Warehouse Activity No."; WarehouseActivityNoTxt)
            {
                Caption = 'Warehouse Activity No.';
                ApplicationArea = All;
                
            }
        }
    }

    var
        WarehouseActivityNoTxt: Code[20];

}