pageextension 60124 "CO Test LO" extends "Bins"
{
    actions
    {
        addlast(processing)
        {
            action("CO LO MH")
            {
                ApplicationArea = all;
                Caption = 'LO MH';
                Image = Print;
                ToolTip = 'LO wird gedruckt';
                trigger OnAction()
                var
                    Lagerplatz: Record "Bin";
                    PrintLabel: Codeunit "CO Print Label";
                begin
                    CurrPage.SetSelectionFilter(Lagerplatz);
                    if Lagerplatz.FindSet() then
                        repeat
                            PrintLabel.PrintlLabel(LagerPlatz);
                        until LagerPlatz.Next() = 0;
                end;
            }

        }
    }
}
