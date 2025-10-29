page 60101 "CO Coatinc Setup"
{
    ApplicationArea = All;
    Caption = 'Coatinc Setup';
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = Card;
    SourceTable = "CO Coatinc Setup";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Piece Factor Code"; Rec."Piece Factor Code") { }
                field("KG Unit Of Measure Code"; Rec."KG Unit Of Measure Code") { }
                field("KG Property Code"; Rec."KG Property Code") { }
            }
        }
    }
    trigger OnOpenPage()
    begin

        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}