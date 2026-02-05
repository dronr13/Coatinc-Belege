#if Publish
Codeunit 60128 "TCC Event Handler"
{
    [EventSubscriber(ObjectType::Table, Database::"CO Whse. Receipt Item Charge", 'OnAfterValidateEvent', 'Status', false, false)]
    local procedure Status_OnAfterValidate(var Rec: Record "CO Whse. Receipt Item Charge"; var xRec: Record "CO Whse. Receipt Item Charge"; CurrFieldNo: Integer)
    var
        MuMGRWhseReceiptHeader: Record "MuM GR Whse. Receipt Header";
    begin
        if Rec.IsTemporary then
            exit;

        if Rec.Status = xRec.Status then
            exit;

        case rec.Status of
            rec.Status::Approved:
                begin
                    MuMGRWhseReceiptHeader.Get(rec."Document No.");
                    if MuMGRWhseReceiptHeader."CO Status Code" <> 'FREIGABE' then begin
                        MuMGRWhseReceiptHeader.Validate("CO Status Code", 'FREIGABE'); //auf Einrichtung umstellen
                        MuMGRWhseReceiptHeader.Modify(true);
                    end;
                end;

            Rec.Status::Rejected:
                begin
                    MuMGRWhseReceiptHeader.Get(rec."Document No.");
                    if MuMGRWhseReceiptHeader."CO Status Code" <> 'ZA-ABGELEHNT' then begin
                        MuMGRWhseReceiptHeader.Validate("CO Status Code", 'ZA-ABGELEHNT'); //auf Einrichtung umstellen
                        MuMGRWhseReceiptHeader.Modify(true);
                    end;
                end;
        end;
    end;
}
#endif