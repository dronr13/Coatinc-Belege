Codeunit 60000 "CCT MuM Whs. Business Events"
{
    [EventSubscriber(ObjectType::Table, Database::"MuM GR Pro. W. Rcpt. Header", 'OnAfterInsertEvent', '', false, false)]
    local procedure MuMGRProWhseRcptHeader_OnAfterInsertEventRec(var Rec: Record "MuM GR Pro. W. Rcpt. Header"; RunTrigger: Boolean)
    begin
        if Rec.IsTemporary then
            exit;

        BusinessEventMuMGRProWhseRcptHeaderInsert(Rec.SystemId, Rec."No.");
    end;

    [ExternalBusinessEvent('MuMGRProWhseRcptHeader', 'MuM goods receipt processed', 'This business event is triggered when a MuM GR Pro. Whse. Rcpt. Header Record is inserted', Enum::EventCategory::"CCT MuM GR Pro. Whse. Rcpt. Events", '1.1')]
    local procedure BusinessEventMuMGRProWhseRcptHeaderInsert(MuMGRProWhseRcptHeaderId: Guid; MuMGRProWhseRcptHeaderNo: Code[20])
    begin
    end;


    [EventSubscriber(ObjectType::Table, Database::"MuM GR Whse. Receipt Header", 'OnAfterInsertEvent', '', false, false)]
    local procedure MuMGRWhseReceiptHeader_OnAfterInsertEventRec(var Rec: Record "MuM GR Whse. Receipt Header"; RunTrigger: Boolean)
    begin
        if Rec.IsTemporary then
            exit;

        BusinessEventMuMGRWhseReceiptHeaderInsert(Rec.SystemId, Rec."No.");
    end;

    [ExternalBusinessEvent('MuMGRWhseReceiptHeader', 'MuM goods receipt created', 'This business event is triggered when a MuM GR Whse. Receipt Header Record is inserted', Enum::EventCategory::"CCT MuM GR Whse. Receipt Events", '1.1')]
    local procedure BusinessEventMuMGRWhseReceiptHeaderInsert(MuMGRWhseReceiptHeaderId: Guid; MuMGRWhseReceiptHeaderNo: Code[20])
    begin
    end;
}
