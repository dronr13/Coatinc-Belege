tableextension 60150 TCCResponsibilityCenter extends "Responsibility Center"
{
    fields
    {
        field(60100; IBAN; code[25])
        {
            Caption = 'IBAN';
            DataClassification = CustomerContent;
        }
        field(60110; BIC; code[15])
        {
            Caption = 'BIC';
            DataClassification = CustomerContent;
        }
        field(60120; "Bank"; code[50])
        {
            Caption = 'Bank name';
            DataClassification = CustomerContent;
        }
        field(60130; "Account"; Text[20])
        {
            Caption = 'Account nr';
            DataClassification = CustomerContent;
        }
        field(60140; "User ID for User Tasks"; Guid)
        {
            Caption = 'User ID for User Tasks';
            TableRelation = User."User Security ID" where("License Type" = const("Full User"));
        }
        field(60141; "User Name for User Tasks"; Code[50])
        {
            CalcFormula = lookup(User."User Name" where("User Security ID" = field("User ID for User Tasks")));
            Caption = 'User Name for User Tasks';
            Editable = false;
            FieldClass = FlowField;
        }
    }
}
