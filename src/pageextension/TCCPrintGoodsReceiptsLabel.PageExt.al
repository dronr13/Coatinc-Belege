pageextension 60112 "TCC Print Goods Receipts Label" extends "MuM GR Whse. Receipt"
{
    actions
    {
        addlast(processing)
        {
            action("TCC Print Goods Receipts Label")
            {
                ApplicationArea = All;
                Caption = 'Goods Receipt Label';
                Image = Print;

                trigger OnAction()
                var
                    ReceiptHeader: Record "MuM GR Whse. Receipt Header";
                begin
                    // Neem de selectie/actieve regels van de pagina over
                    CurrPage.SetSelectionFilter(ReceiptHeader);
                    // Eventueel: zorg dat er minimaal één record is
                    if ReceiptHeader.IsEmpty() then exit;
                    // Geef de gefilterde records mee aan het rapport
                    Report.RunModal(Report::"TCC Goods receipt label", true, // Request page niet tonen
                    false, // Niet forceren naar printer (gebruik standaard)
                    ReceiptHeader);
                end;
            }
            action("TCC Print Goods Receipts Slip")
            {
                ApplicationArea = All;
                Caption = 'Goods Receipt Slip';
                Image = Print;

                trigger OnAction()
                var
                    ReceiptHeader: Record "MuM GR Whse. Receipt Header";
                begin
                    // Neem de selectie/actieve regels van de pagina over
                    CurrPage.SetSelectionFilter(ReceiptHeader);
                    // Eventueel: zorg dat er minimaal één record is
                    if ReceiptHeader.IsEmpty() then exit;
                    // Geef de gefilterde records mee aan het rapport
                    Report.RunModal(Report::"TCC Goods receipt slip", 
                    true, // Request page niet tonen
                    false, // Niet forceren naar printer (gebruik standaard)
                    ReceiptHeader);
                end;
            }
        }
    }
}
