
pageextension 60200 "TCC Sales Order CO Whse" extends "Sales Order"
{
    layout
    {
        // Voeg het veld onderaan de General‑FastTab toe
        addlast(General)
        {
            field("CO Whse. Receip"; Rec."CO Whse. Receipt")
            {
                ApplicationArea = All;
                Caption = 'CO Whse. Receipt';
                ToolTip = 'Warehouse receipt reference for this sales order.';
            }
        }
    }
}
