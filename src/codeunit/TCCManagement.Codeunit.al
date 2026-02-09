Codeunit 60005 "TCC Management"
{
    procedure SetMuMGRWhseReceiptHeaderCOStatusRelease(DocumentNo: Code[20])
    begin
        COCoatincSetup.Get();
        COCoatincSetup.TestField("Doc. Status Approve Add. Costs");

        MuMGRWhseReceiptHeader.Get(DocumentNo);
        if MuMGRWhseReceiptHeader."CO Status Code" <> COCoatincSetup."Doc. Status Approve Add. Costs" then begin
            MuMGRWhseReceiptHeader.Validate("CO Status Code", COCoatincSetup."Doc. Status Approve Add. Costs");
            MuMGRWhseReceiptHeader.Modify(true);
        end;
    end;

    procedure SetMuMGRWhseReceiptHeaderCOStatusRejected(DocumentNo: Code[20])
    begin
        COCoatincSetup.Get();
        COCoatincSetup.TestField("Doc. Status Reject Add. Costs");

        MuMGRWhseReceiptHeader.Get(DocumentNo);
        if MuMGRWhseReceiptHeader."CO Status Code" <> COCoatincSetup."Doc. Status Reject Add. Costs" then begin
            MuMGRWhseReceiptHeader.Validate("CO Status Code", COCoatincSetup."Doc. Status Reject Add. Costs");
            MuMGRWhseReceiptHeader.Modify(true);
        end;
    end;

    var
        MuMGRWhseReceiptHeader: Record "MuM GR Whse. Receipt Header";
        COCoatincSetup: Record "CO Coatinc Setup";
}
