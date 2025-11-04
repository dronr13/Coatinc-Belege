table 60100 "CO Coatinc Setup"
{
    Caption = 'Coatinc Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            ToolTip = ' ', Locked = true;
        }
        field(10; "Piece Factor Code"; Code[50])
        {
            Caption = 'Piece Factor Code';
            TableRelation = "MuM MP Property".Code;
            ToolTip = ' ', Locked = true;
        }
        field(20; "KG Property Code"; Code[50])
        {
            Caption = 'KG Property Code';
            TableRelation = "MuM MP Property".Code;
            ToolTip = ' ', Locked = true;
        }
        field(30; "KG Unit Of Measure Code"; Code[10])
        {
            Caption = 'KG Unit Of Measure Code';
            TableRelation = "Unit of Measure".Code;
            ToolTip = ' ', Locked = true;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}