pageextension 60155 "TCC MuM ShpPln Page Ext" extends "MuM AS Shp Pln Ass a. Inv Cont"
{
    layout
    {
        addbefore("Warehouse Shipment created")
        {
            field("Warehouse Activity No."; WarehouseActivityNo)
            {
                ApplicationArea = All;
                Caption = 'Warehouse Activity No.';
            }
        }
    }

    var
        SalesHdr: Record "Sales Header";
        WarehouseActivityNo: Code[20];

    trigger OnAfterGetRecord()
    begin
        Clear(WarehouseActivityNo);

        // Aanname: Rec."Source No." bevat het verkoopordernummer
        //if SalesHdr.Get(Rec."Source No.") then
        //   WarehouseActivityNo := SalesHdr."CO Whse. Receipt";
        if SalesHdr.Get(Rec."Source Subtype", Rec."Source No.") then
            WarehouseActivityNo := SalesHdr."CO Whse. Receipt";
    end;

}