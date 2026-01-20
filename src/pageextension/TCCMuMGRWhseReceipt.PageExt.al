pageextension 60127 "TCCMuM GR Whse. Receipt" extends "MuM GR Whse. Receipt"
{
/*     layout
    {
        addlast(General)
        {
            field(DruckType; "MuM ET Printing Type")
            {
                ApplicationArea = All;
            }
            field(DruckUntertype; "MuM ET Sub-Printing Type")
            {
                ApplicationArea = All;
            }
        }
    } */

    actions
    {
        modify(Release)
        {
            Visible = false;
        }
        modify(Notify)
        {
            Caption = 'Release';
        // CaptionML = DEU = 'Freigegeben', ENU = 'Release';
        }
    }
    
    
}
