pageextension 60150 TCCResponsibilityCenter extends "Responsibility Center Card"
{
    layout
    {
        addlast(Communication)
        {
            field(Bank; Rec.Bank)
            {
                ApplicationArea = All;
            }
            field(Account; Rec.Account)
            {
                ApplicationArea = All;
            }
            field(IBAN; Rec.IBAN)
            {
                ApplicationArea = All;
            }
            Field(BIC; Rec.BIC)
            {
                ApplicationArea = All;
            }
        }
    }
}
