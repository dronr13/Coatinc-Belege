pageextension 60181 "TCC Sales Quotes Ext" extends "Sales Quotes"
{
    layout
    {
        addafter("Bill-to Name")
        {
            field("Salesperson Name"; Rec."Salesperson Name")
            {
                ApplicationArea = All;
            }
        }
    }
}