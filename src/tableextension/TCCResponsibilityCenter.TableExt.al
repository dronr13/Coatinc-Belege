
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
    }
}
