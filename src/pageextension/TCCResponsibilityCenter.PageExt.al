pageextension 60150 TCCResponsibilityCenter extends "Responsibility Center Card"
{
    layout
    {
        addlast(General)
        {

            field("User Name for User Tasks"; Rec."User Name for User Tasks")
            {
                ApplicationArea = All;
                AssistEdit = true;
                trigger OnAssistEdit()
                var
                    Choice: Integer;
                    User: Record User;
                    AssistLbl: Label 'Select value,Empty';
                begin
                    Choice := StrMenu(AssistLbl, 1);
                    case Choice of
                        1:
                            begin
                                User.FilterGroup(2);
                                User.SetRange("License Type", User."License Type"::"Full User");
                                User.FilterGroup(0);
                                if PAGE.RunModal(Page::Users, User) = Action::LookupOK then
                                    Rec.Validate("User ID for User Tasks", user."User Security ID");
                            end;
                        2:
                            Clear(Rec."User ID for User Tasks");
                        else
                            exit;
                    end;
                    Rec.Modify(true);
                    CurrPage.Update(false);
                end;
            }
        }
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
