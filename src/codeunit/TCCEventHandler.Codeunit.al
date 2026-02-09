Codeunit 60128 "TCC Event Handler"
{
    [EventSubscriber(ObjectType::Table, Database::"CO Whse. Receipt Item Charge", 'OnAfterValidateEvent', 'Status', false, false)]
    local procedure COWhseReceiptItemCharge_Status_OnAfterValidate(var Rec: Record "CO Whse. Receipt Item Charge"; var xRec: Record "CO Whse. Receipt Item Charge"; CurrFieldNo: Integer)
    var
        MuMGRWhseReceiptHeader: Record "MuM GR Whse. Receipt Header";
        TCCManagement: Codeunit "TCC Management";
    begin
        if Rec.IsTemporary then
            exit;

        if Rec.Status = xRec.Status then
            exit;

        case rec.Status of
            rec.Status::Approved:
                TCCManagement.SetMuMGRWhseReceiptHeaderCOStatusRelease(Rec."Document No.");

            Rec.Status::Rejected:
                TCCManagement.SetMuMGRWhseReceiptHeaderCOStatusRejected(Rec."Document No.");
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"MuM GR Whse. Receipt Header", 'OnAfterValidateEvent', 'CO Mail Sent', false, false)]
    local procedure MuMGRWhseReceiptHeader_COMailSent_OnAfterValidate(var Rec: Record "MuM GR Whse. Receipt Header"; var xRec: Record "MuM GR Whse. Receipt Header"; CurrFieldNo: Integer)
    var
        COCoatincSetup: Record "CO Coatinc Setup";
    begin
        if Rec.IsTemporary then
            exit;

        if Rec."CO Mail Sent" = xRec."CO Mail Sent" then
            exit;

        if not Rec."CO Mail Sent" then
            exit;

        COCoatincSetup.Get();
        COCoatincSetup.TestField("Doc. Status Customer Contacted");

        if Rec."CO Status Code" <> COCoatincSetup."Doc. Status Customer Contacted" then
            Rec.Validate("CO Status Code", COCoatincSetup."Doc. Status Customer Contacted");
    end;

}
