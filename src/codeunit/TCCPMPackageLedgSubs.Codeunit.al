codeunit 60173 "TCC PM Package Ledg Subs"
{
    Subtype = Normal;

    [EventSubscriber(ObjectType::Table, Database::"MuM PM Package Ledger Entry",
                     'OnAfterInsertEvent', '', false, false)]
    local procedure OnAfterInsertPackageLedgerEntry(var Rec: Record "MuM PM Package Ledger Entry"; RunTrigger: Boolean)
    var
        PackageLabelMgt: Codeunit "TCC Package Label Mgt.";
        LabelList: Page "TCC Package Label List";
        LabelRec: Record "TCC Package Label";
        LastLabel: Record "TCC Package Label";
    begin
        if Rec.IsTemporary() then
            exit;
        if not RunTrigger then
            exit;

        // Alleen content-regel
        if (Rec."Package Parent No." = '') or
           (Rec."Package Group No." = '') then
            exit;

        // 1) Label aanmaken voor deze regel
        PackageLabelMgt.CreateLabelFromPackageLedgerEntry(Rec);

        // 2) Label voor deze colli zoeken en verrijken
        LastLabel.Reset();
        LastLabel.SetRange("Campaign No.", Rec."Document No.");
        LastLabel.SetRange("Package Group No.", Rec."Package Group No.");
        LastLabel.SetRange("Collo No.", Rec."Package Parent No.");
        if LastLabel.FindLast() then
            PackageLabelMgt.EnrichLabelFromCampaignLine(LastLabel);

        // 3) Alle labels voor deze Campaign tonen
        LabelRec.Reset();
        LabelRec.SetRange("Campaign No.", Rec."Document No.");
        // eventueel SetRange("Package Group No.", Rec."Package Group No.");
        if LabelRec.IsEmpty() then
            exit;

        Commit(); // transactie afronden, daarna UI openen
        LabelList.SetTableView(LabelRec);
        if LastLabel."Campaign No." <> '' then
            LabelList.SetRecord(LastLabel);
        LabelList.Run();
    end;
}
