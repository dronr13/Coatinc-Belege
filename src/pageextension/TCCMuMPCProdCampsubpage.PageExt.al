pageextension 60131 "TCC MuM PC Prod. Camp. subpage" extends "MuM PC Prod. Campaign Subpage"
{
    actions
    {
        addlast(processing)
        {

            action("TCC Warehouse Label")
            {
                ApplicationArea = All;
                Caption = 'Warehouse Label';
                Image = Print;

                trigger OnAction()
                var
                    ProdOrderLines: Record "MuM PC Prod. Campaign Line";
                begin
                    // Neem de selectie/actieve regels van de pagina over
                    CurrPage.SetSelectionFilter(ProdOrderLines);
                    // Eventueel: zorg dat er minimaal één record is
                    if ProdOrderLines.IsEmpty() then exit;
                    // Geef de gefilterde records mee aan het rapport
                    Report.RunModal(Report::"TCC WarehouseLabel",
                    true, // Request page niet tonen
                    false, // Niet forceren naar printer (gebruik standaard)
                    ProdOrderLines);
                end;
            }
        }
    }
}