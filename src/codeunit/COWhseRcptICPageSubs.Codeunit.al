

codeunit 60130 "CO WhseRcptIC Page Subs"
{
    [EventSubscriber(ObjectType::Page, Page::"CO Whse. Rcpt. It Chg Lines SP", 'OnAfterActionEvent', 'ApproveCharges', false, false)]
    local procedure OnAfter_ApproveCharges(var Rec: Record "CO Whse. Receipt Item Charge")
    var
        MuMGRWhseReceiptHeader: Record "MuM GR Whse. Receipt Header";
    begin
        // Optional: Kontext laden
        MuMGRWhseReceiptHeader.Get(Rec."Document No.");
        if MuMGRWhseReceiptHeader."CO Status Code" <> 'FREIGABE' then begin
            MuMGRWhseReceiptHeader.Validate("CO Status Code", 'FREIGABE'); //auf Einrichtung umstellen
            MuMGRWhseReceiptHeader.Modify(true);
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"CO Whse. Rcpt. It Chg Lines SP", 'OnAfterActionEvent', 'RejectCharges', false, false)]
    local procedure OnAfter_RejectCharges(var Rec: Record "CO Whse. Receipt Item Charge")
    var
        MuMGRWhseReceiptHeader: Record "MuM GR Whse. Receipt Header";
    begin
        MuMGRWhseReceiptHeader.Get(rec."Document No.");
        if MuMGRWhseReceiptHeader."CO Status Code" <> 'ZA-ABGELEHNT' then begin
            MuMGRWhseReceiptHeader.Validate("CO Status Code", 'ZA-ABGELEHNT'); //auf Einrichtung umstellen
            MuMGRWhseReceiptHeader.Modify(true);
        end;
    end;
}
