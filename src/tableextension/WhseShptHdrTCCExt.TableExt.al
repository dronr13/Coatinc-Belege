tableextension 60131 "WhseShptHdr TCC Ext" extends "Warehouse Shipment Header"
{
    fields
    {
        field(60100; "TCC Resp. Center"; Code[10])
        {
            Caption = 'TCC Resp. Center';
            DataClassification = CustomerContent;

            TableRelation = "Responsibility Center".Code;
        }
    }
}