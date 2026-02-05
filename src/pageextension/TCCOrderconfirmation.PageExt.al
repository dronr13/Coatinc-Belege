
pageextension 60113 "TCC Orderconfirmation" extends "MuM GR Pro. Whse. Receipt"
{
    actions
    {
        addlast(processing)
        {
            action("TCC Print Order Confirmation")
            {
                ApplicationArea = All;
                Caption = 'Order Confirmation';
                Image = Print;

                trigger OnAction()
                var
                    ReceiptHeader: Record "MuM GR Whse. Receipt Header";
                begin
                    // Neem de selectie/actieve regels van de pagina over
                    CurrPage.SetSelectionFilter(ReceiptHeader);
                    // Eventueel: zorg dat er minimaal één record is
                    if ReceiptHeader.IsEmpty()then exit;
                    // Geef de gefilterde records mee aan het rapport
                    Report.RunModal(Report::"TCC Order confirmation", 
                        true, // Request page niet tonen
                        false, // Niet forceren naar printer (gebruik standaard)
                        ReceiptHeader);
                end;
            }
        }
    }
}
