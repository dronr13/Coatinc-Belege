tableextension 60156 "TCC MuM PC Prod. Campaign Line" extends "MuM PC Prod. Campaign Line"
{
    fields
    {
        field(60100; Barcode; code[20])
        {
            Caption = 'Barcode';
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header"."CO Whse. Receipt"
                                 where("No." = field("CO Sales Order No.")));
        }
        field(60110; "Debitor Name"; Text[100])
        {
            Caption = 'Debitor name';
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header"."Sell-to Customer Name"
                                 where("No." = field("CO Sales Order No.")));
        }
        field(60120; "Your reference"; Text[35])
        {
            Caption = 'Your reference';
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header"."Your Reference"
                                 where("No." = field("CO Sales Order No.")));
        }
    }
}
