pageextension 60138 "TCC Extended Sales Quotes" extends "Sales Quotes"
{
    layout
    {
        moveafter("No."; "Opportunity No.")

        addafter("No.")
        {
            field("Opportunity Status"; OpportunityStatusTxt)
            {
                ApplicationArea = All;
                Caption = 'Opportunity Status';
            }
        }
    }
    var
        Opp: Record Opportunity;
        OpportunityStatusTxt: Text[50];

    trigger OnAfterGetRecord()
    begin
        Clear(OpportunityStatusTxt);

        if Rec."Opportunity No." = '' then
            exit;

        if Opp.Get(Rec."Opportunity No.") then
            OpportunityStatusTxt := Format(Opp.Status); // Enum → tekst
    end;


}