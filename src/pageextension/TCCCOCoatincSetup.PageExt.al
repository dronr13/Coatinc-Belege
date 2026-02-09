pageextension 60151 TCCCOCoatincSetup extends "CO Coatinc Setup"
{
    layout
    {
        addafter(Logistics)
        {
            group(WarehouseReceipt)
            {
                Caption = 'Warehouse Receipt';
                field("Doc. Status Approve Add. Costs"; Rec."Doc. Status Approve Add. Costs")
                {
                    ApplicationArea = All;
                }
                field("Doc. Status Reject Add. Costs"; Rec."Doc. Status Reject Add. Costs")
                {
                    ApplicationArea = All;
                }
                field("Doc. Status Customer Contacted"; Rec."Doc. Status Customer Contacted")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
