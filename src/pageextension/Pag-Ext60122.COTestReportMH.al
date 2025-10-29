pageextension 60122 "CO Test Report MH" extends "Sales Order List"
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
                    SalesHeader: Record "Sales Header";
                begin
                    // Whole screen in the report
                    // SalesHeader.reset();
                    // SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);

                    //Only selected records in the report.
                    CurrPage.SetSelectionFilter(SalesHeader);

                    //Print the report on the screen (no default printer for document)
                    Report.Run(report::"CO Test Report MH", true, false, SalesHeader);
                end;
            }
        }
    }
}
