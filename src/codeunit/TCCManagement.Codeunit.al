Codeunit 60005 "TCC Management"
{
    procedure SetMuMGRWhseReceiptHeaderCOStatusRelease(DocumentNo: Code[20])
    begin
        MuMGRWhseReceiptHeader.Get(DocumentNo);
        if MuMGRWhseReceiptHeader."CO Status Code" <> 'FREIGABE' then begin
            MuMGRWhseReceiptHeader.Validate("CO Status Code", 'FREIGABE'); //auf Einrichtung umstellen
            MuMGRWhseReceiptHeader.Modify(true);
        end;
    end;

    procedure SetMuMGRWhseReceiptHeaderCOStatusRejected(DocumentNo: Code[20])
    begin
        MuMGRWhseReceiptHeader.Get(DocumentNo);
        if MuMGRWhseReceiptHeader."CO Status Code" <> 'FREIGABE' then begin
            if MuMGRWhseReceiptHeader."CO Status Code" <> 'ZA-ABGELEHNT' then begin
                MuMGRWhseReceiptHeader.Validate("CO Status Code", 'ZA-ABGELEHNT'); //auf Einrichtung umstellen
                MuMGRWhseReceiptHeader.Modify(true);
            end;
        end;
    end;

    var
        MuMGRWhseReceiptHeader: Record "MuM GR Whse. Receipt Header";
}
