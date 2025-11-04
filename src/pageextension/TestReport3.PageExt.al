pageextension 60121 "CO Test Report 3" extends "Purchase Order List"
{
    actions
    {
        addlast(processing)
        {
            action("CO Test MH")
            {
                ApplicationArea = all;
                Caption = 'Test MH';
                Image = Print;
                ToolTip = 'Hier werden bestellungen ausgegeben';
                trigger OnAction()
                var
                    PurchaseHeader: Record "Purchase Header";
                begin
                    // PurchaseHeader.reset();
                    // PurchaseHeader.SetRange("Document Type", PurchaseHeader."Document Type"::Order);

                    CurrPage.SetSelectionFilter(PurchaseHeader);
                    Report.Run(report::"CO Test Report 3", true, false, PurchaseHeader);
                end;
            }

            action("CO Bestellung MH")
            {
                ApplicationArea = all;
                Caption = 'Test Bestellung MH';
                Image = Document;
                ToolTip = 'Hier werden bestellungen ausgegeben';
                trigger OnAction()
                var
                    PurchaseHeader: Record "Purchase Header";
                begin
                    // PurchaseHeader.reset();
                    // PurchaseHeader.SetRange("Document Type", PurchaseHeader."Document Type"::Order);

                    CurrPage.SetSelectionFilter(PurchaseHeader);
                    Report.Run(report::"CO Test Bestellung MH", true, false, PurchaseHeader);
                end;

            }

        }
    }
}