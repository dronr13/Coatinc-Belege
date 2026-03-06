page 60150 "TCC Package Label List"
{
    Caption = 'Package Labels';
    PageType = List;
    ApplicationArea = All;
    SourceTable = "TCC Package Label";

    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Campaign No."; Rec."Campaign No.")
                {
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Prod. Order No."; Rec."Prod. Order No.")
                {
                    ApplicationArea = All;
                }
                field("Package Code"; Rec."Package Code")
                {
                    ApplicationArea = All;
                    Visible = False;
                }
                field("Collo No."; Rec."Collo No.")
                {
                    ApplicationArea = All;
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = All;
                }
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = All;
                }
                field("Debug Text"; Rec."Debug Text")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Printed; Rec.Printed)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Printed DateTime"; Rec."Printed DateTime")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Printed By"; Rec."Printed By")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Package Group No."; Rec."Package Group No.")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Goods Receipt No."; Rec."Goods Receipt No.")
                {
                    ApplicationArea = All;
                }
                field("Order Reference"; Rec."Order Reference")
                {
                    ApplicationArea = All;
                }
                field("Co Finished Whse. Bin Code"; Rec."Co Finished Whse. Bin Code")
                {
                    ApplicationArea = All;
                }
                field("Resp. Center Name"; Rec."Resp. Center Name")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Resp. Center Address"; Rec."Resp. Center Address")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Resp. Center PostCode/City"; Rec."Resp. Center PostCode/City")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("TCC Print Labels")
            {
                Caption = 'Print Labels';
                ApplicationArea = All;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    SelLabels: Record "TCC Package Label";
                    LabelToUpdate: Record "TCC Package Label";
                begin
                    CurrPage.SetSelectionFilter(SelLabels);

                    if SelLabels.IsEmpty() then
                        Error(NoLabelsSelectedErr);

                    // Check op al geprinte labels
                    SelLabels.SetRange(Printed, true);
                    if not SelLabels.IsEmpty() then
                        Error(AlreadyPrintedErr);

                    CurrPage.SetSelectionFilter(SelLabels);

                    Report.RunModal(
                      Report::"TCC Warehouse Label",
                      true,
                      false,
                      SelLabels);

                    CurrPage.SetSelectionFilter(LabelToUpdate);
                    if LabelToUpdate.FindSet(true) then begin
                        repeat
                            LabelToUpdate.Printed := true;
                            LabelToUpdate."Printed DateTime" := CurrentDateTime();
                            LabelToUpdate."Printed By" := UserId();
                            LabelToUpdate.Modify();
                        until LabelToUpdate.Next() = 0;
                    end;

                    CurrPage.Update(false);
                end;
            }
        }
    }




    var
        CampaignNoFilter: Code[20];
        LineNoFilter: Integer;
        NoLabelsSelectedErr: Label 'No labels selected.', Comment = 'Error when user tries to print without selecting any labels.';
        AlreadyPrintedErr: Label 'At least one selected label has already been printed. Only unprinted labels can be printed.', Comment = 'Error when user selects labels that are already printed.';

    procedure SetContext(CampaignNo: Code[20]; LineNo: Integer)
    begin
        CampaignNoFilter := CampaignNo;
        LineNoFilter := LineNo;
    end;

    trigger OnOpenPage()
    begin
        if CampaignNoFilter <> '' then
            Rec.SetRange(Rec."Campaign No.", CampaignNoFilter);
        if LineNoFilter <> 0 then
            Rec.SetRange(Rec."Line No.", LineNoFilter);
    end;
}
