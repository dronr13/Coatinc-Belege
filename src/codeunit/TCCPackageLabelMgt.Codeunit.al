codeunit 60155 "TCC Package Label Mgt."
{
    Subtype = Normal;

    procedure CreateLabelFromPackageLedgerEntry(PackageLedgEntry: Record "MuM PM Package Ledger Entry")
    var
        PackageLabel: Record "TCC Package Label";
    begin
        if (PackageLedgEntry."Package Parent No." = '') or
           (PackageLedgEntry."Package Group No." = '') then
            exit;

        if PackageLedgEntry."Contained Qty." = 0 then
            exit;

        PackageLabel.Init();

        PackageLabel."Campaign No." := PackageLedgEntry."Document No.";
        PackageLabel."Prod. Order No." := PackageLedgEntry."Document No.";
        PackageLabel."Package Group No." := PackageLedgEntry."Package Group No.";
        PackageLabel."Line No." := GetNextLineNo(PackageLabel);
        PackageLabel."Package Code" := '';
        PackageLabel."Collo No." := PackageLedgEntry."Package Parent No.";
        PackageLabel.Weight := PackageLedgEntry."Contained Qty.";
        PackageLabel."Debug Text" :=
          StrSubstNo('PckLedg Entry No. %1, Group %2',
                     PackageLedgEntry."Entry No.", PackageLedgEntry."Package Group No.");

        PackageLabel.Insert();
    end;

    procedure EnrichLabelFromCampaignLine(var PackageLabel: Record "TCC Package Label")
    var
        CampaignLine: Record "MuM PC Prod. Campaign Line";
        SalesHeader: Record "Sales Header";
        GRWhseRcptHdr: Record "MuM GR Whse. Receipt Header";
        RespCenter: Record "Responsibility Center";
    begin
        if PackageLabel."Prod. Order No." = '' then
            exit;

        CampaignLine.Reset();
        CampaignLine.SetRange("Prod. Order No.", PackageLabel."Prod. Order No.");
        if not CampaignLine.FindFirst() then
            exit;

        if CampaignLine."CO Sales Order No." = '' then
            exit;

        SalesHeader.Reset();
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SetRange("No.", CampaignLine."CO Sales Order No.");
        if not SalesHeader.FindFirst() then
            exit;
        PackageLabel."Sales Order No." := SalesHeader."No.";
        PackageLabel."Customer No." := SalesHeader."Bill-to Customer No.";
        PackageLabel."Customer Name" := SalesHeader."Bill-to Name";
        PackageLabel."Goods Receipt No." := SalesHeader."Co Whse. Receipt";
        PackageLabel."Item Description" := CampaignLine."Item Description";

        PackageLabel."Order Reference" := SalesHeader."Your Reference";

        if PackageLabel."Goods Receipt No." <> '' then begin
            GRWhseRcptHdr.Reset();
            GRWhseRcptHdr.SetRange("No.", PackageLabel."Goods Receipt No.");
            if GRWhseRcptHdr.FindFirst() then
                PackageLabel."Co Finished Whse. Bin Code" := GRWhseRcptHdr."Co Finished Whse. Bin Code";
        end;

        if SalesHeader."Responsibility Center" <> '' then begin
            RespCenter.Reset();
            RespCenter.SetRange(Code, SalesHeader."Responsibility Center");
            if RespCenter.FindFirst() then begin
                PackageLabel."Resp. Center Name" := RespCenter.Name;
                PackageLabel."Resp. Center Address" := RespCenter.Address;
                PackageLabel."Resp. Center PostCode/City" :=
                  StrSubstNo('%1 %2', RespCenter."Post Code", RespCenter.City);
            end;
        end;

        PackageLabel.Modify();
    end;

    local procedure GetNextLineNo(var PackageLabel: Record "TCC Package Label"): Integer
    var
        LastLabel: Record "TCC Package Label";
        LastLineNo: Integer;
    begin
        LastLabel.Reset();
        // alleen op Campaign No. filteren, zodat alle wegingen onder die campagne
        // één doorlopende reeks Line No.'s krijgen
        LastLabel.SetRange("Campaign No.", PackageLabel."Campaign No.");

        if LastLabel.FindLast() then
            LastLineNo := LastLabel."Line No.";

        exit(LastLineNo + 10000);
    end;
}
