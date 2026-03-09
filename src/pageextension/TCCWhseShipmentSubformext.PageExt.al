pageextension 60158 "TCC Whse. Shipment Subform ext" extends "Whse. Shipment Subform"
{
    layout
    {
        addafter("Source No.")
        {
            field("Warehouse Activity No."; Rec."Warehouse Activity No.")
            {
                ApplicationArea = All;
                Caption = 'Warehouse Activity No.';
            }
        }
    }
}