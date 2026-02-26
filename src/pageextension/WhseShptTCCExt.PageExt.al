pageextension 60131 "WhseShpt TCC Ext" extends "Warehouse Shipment"
{

    layout
    {
        addafter("Location Code")
        {
            field("TCC Resp. Center"; Rec."TCC Resp. Center")
            {
                ApplicationArea = All;
            }
        }
    }
        actions
    {
        addlast(processing)
        {

            action("TCC Weight Cart")
            {
                ApplicationArea = All;
                Caption = 'Weight Cart Exit';
                Image = Print;

                trigger OnAction()
                var
                    ShipmentHeader: Record "Warehouse Shipment Header";
                begin
                    // Neem de selectie/actieve regels van de pagina over
                    CurrPage.SetSelectionFilter(ShipmentHeader);
                    // Eventueel: zorg dat er minimaal één record is
                    if ShipmentHeader.IsEmpty() then exit;
                    // Geef de gefilterde records mee aan het rapport
                    Report.RunModal(Report::"TCC Weight Cart Exit",
                    true, // Request page niet tonen
                    false, // Niet forceren naar printer (gebruik standaard)
                    ShipmentHeader);
                end;
            }
        }
    }
}