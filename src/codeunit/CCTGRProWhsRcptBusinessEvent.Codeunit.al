#if Publish
Codeunit 60005 "CCTGRProWhsRcpt Business Event"
{
    //OBSOLET - to delete !!!
    [EventSubscriber(ObjectType::Table, Database::"MuM GR Pro. W. Rcpt. Header", 'OnAfterInsertEvent', '', false, false)]
    local procedure OnAfterInsertEventRec(var Rec: Record "MuM GR Pro. W. Rcpt. Header"; RunTrigger: Boolean)
    begin
        if Rec.IsTemporary then exit;
        BusinessEventMuMGRProWhseRcptHeaderInsert(Rec.SystemId, Rec."No.");
    end;

    [ExternalBusinessEvent('MuMGRProWhseRcptHeader', 'Insert MuM GR Pro. Whse. Rcpt. Header', 'This business event is triggered when a MuM GR Pro. Whse. Rcpt. Header Record is inserted', Enum::EventCategory::"CCT MuM GR Pro. Whse. Rcpt. Events", '1.0')]
    local procedure BusinessEventMuMGRProWhseRcptHeaderInsert(MuMGRProWhseRcptHeaderId: Guid; MuMGRProWhseRcptHeaderNo: Code[20])
    begin
    end;
}
#endif