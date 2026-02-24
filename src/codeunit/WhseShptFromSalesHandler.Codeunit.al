codeunit 60158 "WhseShptFromSalesHandler"
{
    Subtype = Normal;

    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Table, Database::"Warehouse Shipment Line", 'OnAfterInsertEvent', '', false, false)]
    local procedure WhseShptLineOnAfterInsert(var Rec: Record "Warehouse Shipment Line"; RunTrigger: Boolean)
    var
        SalesHeader: Record "Sales Header";
    begin
        // Alleen voor Sales als bron
        if Rec."Source Type" <> DATABASE::"Sales Line" then
            exit;

        // We gaan ervan uit dat het om een Sales Order gaat
        if not SalesHeader.Get(SalesHeader."Document Type"::Order, Rec."Source No.") then
            exit;

        // Waarde overnemen van Sales Header naar Warehouse Shipment Line
        Rec."Warehouse Activity No." := SalesHeader."CO Whse. Receipt";

        // Modify uitvoeren met trigger, zodat mogelijke extra logica/triggers meelopen
        Rec.Modify(true);
    end;
}
