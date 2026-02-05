#if Publish
Codeunit 60000 "CCT MuM Whs. Business Events"
{
    [EventSubscriber(ObjectType::Table, Database::"MuM GR Pro. W. Rcpt. Header", 'OnAfterInsertEvent', '', false, false)]
    local procedure MuMGRProWhseRcptHeader_OnAfterInsertEventRec(var Rec: Record "MuM GR Pro. W. Rcpt. Header"; RunTrigger: Boolean)
    var
        Customer: Record Customer;
    begin
        if Rec.IsTemporary then
            exit;

        Customer.SetLoadFields("E-Mail", "Language Code");
        if Not Customer.get(Rec."Sell-to Customer No.") then
            Customer.Init;

        BusinessEventMuMGRProWhseRcptHeaderInsert(Rec.SystemId, Rec."No.", Rec."Sell-to Customer No.",
                    Rec."External Order No.", Customer."E-Mail", Customer."Language Code");
    end;

    [ExternalBusinessEvent('MuMGRProWhseRcptHeader', 'MuM goods receipt processed', 'This business event is triggered when a MuM GR Pro. Whse. Rcpt. Header Record is inserted', Enum::EventCategory::"CCT MuM GR Pro. Whse. Rcpt. Events", '1.2')]
    local procedure BusinessEventMuMGRProWhseRcptHeaderInsert(MuMGRProWhseRcptHeaderId: Guid; MuMGRProWhseRcptHeaderNo: Code[20]; MuMGRProWhseRcptHeaderSellToCustomerNo: Code[20];
            MuMGRProWhseRcptHeaderExternalOrderNo: Code[35]; CustomerEMail: Text[80]; CustomerLanguageCode: Code[10])
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
#endif
