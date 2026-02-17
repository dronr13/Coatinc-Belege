pageextension 60156 "TCC MuM PC Prod. Cam. Sub Ext" extends "MuM PC Prod. Campaign Subpage"
{
    layout
    {
        addafter("Prod. Order No.")   // of de echte repeaternaam uit Page Inspector
        {
            field(Barcode; Rec.Barcode)
            {
                ApplicationArea = All;
                Caption = 'Barcode';
                Editable = false;
            }
        }
    }
}