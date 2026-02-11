pageextension 60137 "TCC Extended Sales Header" extends "Sales Quote"
{
    layout
    {
        addafter("Document Date")
        {
            field("Created By Name"; Rec."Created By Name")
            {
                ApplicationArea = All;
                Importance = Additional;
            }
            field("Modified By Name"; Rec."Modified By Name")
            {
                ApplicationArea = All;
                Importance = Additional;
            }
        }
    }
}