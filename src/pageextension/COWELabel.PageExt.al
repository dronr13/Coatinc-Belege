pageextension 60112 "CO WE Label" extends "MuM GR Whse. Receipt"
{
    actions
    {
        addlast(processing)
        {
            action("CO WE Label")
            {
                ApplicationArea = all;
                Caption = 'WE Label';
                Image = Print;
                ToolTip = 'We label wird gedruckt';
                trigger OnAction()
                var
                    ReceiptHeader: Record "MuM GR Whse. Receipt Header";
                    PrintLabel: Codeunit "CO Print Label";
                begin
                    CurrPage.SetSelectionFilter(Receiptheader);
                    PrintLabel.PrintlLabel(Rec);
                end;
            }
            action("CO WE Label Prega")
            {
                ApplicationArea = all;
                Caption = 'WE Label Prega';
                Image = Print;
                ToolTip = 'We label wird gedruckt';
                trigger OnAction()
                var
                    ReceiptHeader: Record "MuM GR Whse. Receipt Header";
                    PrintLabel: Codeunit "CO Print Label";
                begin
                    CurrPage.SetSelectionFilter(Receiptheader);
                    PrintLabel.PrintlLabel(Rec);
                end;
            }

        }
    }
}
