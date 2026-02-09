tableextension 60151 TCCCOCoatincSetup extends "CO Coatinc Setup"
{
    fields
    {
        field(60100; "Doc. Status Approve Add. Costs"; code[20])
        {
            Caption = 'Document Status for Approve Additional Costs';
            DataClassification = CustomerContent;
            TableRelation = "MuM MB Document Status"."Status Code" where("Table ID" = const(5214423));
        }
        field(60110; "Doc. Status Reject Add. Costs"; code[20])
        {
            Caption = 'Document Status for Reject Additional Costs';
            DataClassification = CustomerContent;
            TableRelation = "MuM MB Document Status"."Status Code" where("Table ID" = const(5214423));
        }
        field(60120; "Doc. Status Customer Contacted"; code[20])
        {
            Caption = 'Document Status for Customer Contacted';
            DataClassification = CustomerContent;
            TableRelation = "MuM MB Document Status"."Status Code" where("Table ID" = const(5214423));
        }
    }
}
