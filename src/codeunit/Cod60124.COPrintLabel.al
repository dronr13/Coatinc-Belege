codeunit 60124 "CO Print Label"
{
    procedure PrintlLabel(SourceTable: Variant)
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(SourceTable);
        case RecRef.Number of
            Database::"MuM GR Whse. Receipt line":
                PrintLabelWarenAnnahmePrega(SourceTable);
            Database::"MuM GR Whse. Receipt Header":
                PrintLabelWarenAnnahme(SourceTable);
        end;
    end;

    local procedure PrintLabelWarenAnnahmePrega(SourceTable: Variant)
    var
        // PropretyReceiptLine: Record "MuM MP Record Property";
        ReceiptHeader: Record "MuM GR Whse. Receipt Header";
        Properties: Record "MuM MP Record Property";
        // ReceiptLine: Record "MuM GR Whse. Receipt Line";
        LabelBuffer: Record "CO label Buffer";
    begin
        ReceiptHeader := SourceTable;
        LabelBuffer.Init();
        LabelBuffer.PKID := CreateGuid();
        LabelBuffer."Caption 1" := 'Warenannahmenr.';
        LabelBuffer."Value 1" := ReceiptHeader."No.";
        LabelBuffer."Caption 2" := 'Kunde';
        LabelBuffer."Value 2" := ReceiptHeader."Sell-to Customer Name";
        LabelBuffer."Caption 3" := 'Arbeitsplan';
        // LabelBuffer."Value 3" := Properties."Bearbeitung(en)" where (TableID = Database::"MuM GR Whse. Receipt Header") and (No = ReceiptHeader."No.");
        LabelBuffer."Caption 4" := 'Externe Bestell-nr';
        LabelBuffer."Value 4" := ReceiptHeader."External Order No.";
        LabelBuffer."Caption 5" := 'Eingangsdatum';
        LabelBuffer."Value 5" := Format(ReceiptHeader."Receipt Date");
        LabelBuffer.Barcode := ReceiptHeader."No.";
        onbeforeinsertlabelbuffer(sourcetable, LabelBuffer);
        LabelBuffer.Insert();
        Commit();
        Report.Run(Report::"CO Label Waren Annahme", true, false, LabelBuffer);
        LabelBuffer.Delete();

    end;

    local procedure PrintLabelWarenAnnahme(var WarenAnnahme: Record "MuM GR Whse. Receipt Header")
    var
        Properties: Record "MuM MP Record Property";
        LabelBuffer: Record "CO label Buffer";
    begin
        LabelBuffer.Init();
        LabelBuffer.PKID := CreateGuid();
        LabelBuffer."Caption 1" := 'Warenan. Nr.';
        LabelBuffer."Value 1" := WarenAnnahme."No.";
        LabelBuffer."Caption 2" := 'Kunde:';
        LabelBuffer."Value 2" := WarenAnnahme."Sell-to Customer Name";
        LabelBuffer."Caption 3" := 'Eingansdatum:';
        LabelBuffer."Value 3" := Format(WarenAnnahme."Document Date");
        //    LabelBuffer."Caption 4" := 'Bearbeitungen:';
        //    LabelBuffer."Value 4" := Properties.Value where (TableID = Database::"MuM GR Whse. Receipt Header") and (No = WarenAnnahme."No.");
        LabelBuffer."Caption 5" := 'Referenz:';
        LabelBuffer."Value 5" := WarenAnnahme."External Order No.";
        LabelBuffer.Barcode := WarenAnnahme."No.";

        onbeforeinsertlabelbuffer(WarenAnnahme, LabelBuffer);
        LabelBuffer.Insert();
        Commit();

        Report.Run(Report::"CO Label Waren Annahme", true, false, LabelBuffer);
        LabelBuffer.Delete();
    end;



    [BusinessEvent(false)]
    local procedure onbeforeinsertlabelbuffer(sourcetable: Variant; var labelbuffer: record "CO Label Buffer")
    begin
    end;

}