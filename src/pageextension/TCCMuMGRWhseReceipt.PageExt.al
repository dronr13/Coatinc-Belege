pageextension 60127 "TCCMuM GR Whse. Receipt" extends "MuM GR Whse. Receipt"
{
    actions
    {
        modify(Release){
            Visible = false;
        }
        modify(Notify){
            Caption = 'Release';
            // CaptionML = DEU = 'Freigegeben', ENU = 'Release';
        }
    }
}