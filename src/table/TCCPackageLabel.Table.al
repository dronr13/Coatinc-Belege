table 60150 "TCC Package Label"
{
    Caption = 'Package Label';
    DataClassification = ToBeClassified;

    fields
    {
        field(60100; "Campaign No."; Code[20])
        {
            Caption = 'Campaign No.';
            DataClassification = CustomerContent;
        }
        field(60110; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(60120; "Package Code"; Code[20])
        {
            Caption = 'Package Code';
            DataClassification = CustomerContent;
        }
        field(60130; "Collo No."; Code[20])
        {
            Caption = 'Collo No.';
            DataClassification = CustomerContent;
        }
        field(60140; "Weight"; Decimal)
        {
            Caption = 'Weight';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(60150; "Debug Text"; Text[250])
        {
            Caption = 'Debug Text';
            DataClassification = CustomerContent;
        }
        field(60160; Printed; Boolean)
        {
            Caption = 'Printed';
            DataClassification = SystemMetadata;
        }
        field(60170; "Printed DateTime"; DateTime)
        {
            Caption = 'Printed Date/Time';
            DataClassification = SystemMetadata;
        }
        field(60180; "Printed By"; Code[50])
        {
            Caption = 'Printed By';
            DataClassification = SystemMetadata;
        }
        field(60190; "Prod. Order No."; Code[20])
        {
            Caption = 'Prod. Order No.';
            DataClassification = CustomerContent;
        }
        field(60200; "Package Group No."; Code[20])
        {
            Caption = 'Package Group No.';
            DataClassification = CustomerContent;
        }
        field(60210; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
        }
        field(60220; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = CustomerContent;
        }
        field(60230; "Goods Receipt No."; Code[20])
        {
            Caption = 'Goods Receipt No.';
            DataClassification = CustomerContent;
        }
        field(60240; "Order Reference"; Text[50])
        {
            Caption = 'Order Reference';
            DataClassification = CustomerContent;
        }
        field(60250; "Co Finished Whse. Bin Code"; Code[20])
        {
            Caption = 'Co Finished Whse. Bin Code';
            DataClassification = CustomerContent;
        }
        field(60260; "Item Description"; Text[100])
        {
            Caption = 'Item Description';
            DataClassification = CustomerContent;
        }
        field(60270; "Resp. Center Name"; Text[100])
        {
            Caption = 'Resp. Center Name';
            DataClassification = CustomerContent;
        }
        field(60280; "Resp. Center Address"; Text[100])
        {
            Caption = 'Resp. Center Address';
            DataClassification = CustomerContent;
        }
        field(60290; "Resp. Center PostCode/City"; Text[100])
        {
            Caption = 'Resp. Center PostCode/City';
            DataClassification = CustomerContent;
        }
        field(60300; "Sales Order No."; Code[20])
        {
            Caption = 'Sales Order No.';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Campaign No.", "Line No.", "Package Code")
        {
            Clustered = true;
        }

        key(ProdOrderIdx; "Prod. Order No.", "Campaign No.", "Line No.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Campaign No.", "Line No.", "Package Code", "Collo No.", "Weight", Printed)
        {
        }
    }


}
