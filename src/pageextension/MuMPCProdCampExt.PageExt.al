pageextension 60157 "MuM PC Prod. Camp. Ext" extends "MuM PC Production Campaign"
{
    layout
    {
        // als Barcode op de pagina een variabele is, hoef je hier niets te doen
    }

    var
        BarcodeTxt: Text[50];

/*     local procedure SyncBarcodeToLines()
    var
        CampaignLine: Record "MuM PC Prod. Campaign Line";
    begin
        // haal de huidige barcode van de pagina (pas dit aan naar jouw bron)
        BarcodeTxt := Rec.Barcode; // of: BarcodeTxt := GetBarcode();

        CampaignLine.SetRange("Campaign No.", Rec."Campaign No.");
        if CampaignLine.FindSet() then
            repeat
                if Rec."Center No." = 'TRAVERSIEREN' then
                    CampaignLine."Barcode" := BarcodeTxt
                else
                    CampaignLine."Barcode" := '';
                CampaignLine.Modify();
            until CampaignLine.Next() = 0;
    end; */
}

