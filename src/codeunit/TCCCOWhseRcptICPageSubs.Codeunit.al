
codeunit 60130 "TCC CO WhseRcptIC Page Subs"
{
    [EventSubscriber(ObjectType::Page, Page::"CO Whse. Rcpt. It Chg Lines SP", 'OnAfterActionEvent', 'ApproveCharges', false, false)]
    local procedure OnAfter_ApproveCharges(var Rec: Record "CO Whse. Receipt Item Charge")
    begin
        Clear(TCCManagement);
        TCCManagement.SetMuMGRWhseReceiptHeaderCOStatusRelease(Rec."Document No.");
    end;

    [EventSubscriber(ObjectType::Page, Page::"CO Whse. Rcpt. It Chg Lines SP", 'OnAfterActionEvent', 'RejectCharges', false, false)]
    local procedure OnAfter_RejectCharges(var Rec: Record "CO Whse. Receipt Item Charge")
    begin
        Clear(TCCManagement);
        TCCManagement.SetMuMGRWhseReceiptHeaderCOStatusRejected(Rec."Document No.");
    end;

    var
        TCCManagement: Codeunit "TCC Management";
}

