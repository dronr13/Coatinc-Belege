pageextension 60127 "TTCCMuM GR Whse. Receipt" extends "MuM GR Whse. Receipt"
{
    actions
    {
        modify(Release){
            Visible = false;
        }
        modify(Notify){
            Caption = 'Freigeben';
            // CaptionML = DEU = 'Freigegeben', ENU = 'Release';
        }
    }
}