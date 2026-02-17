tableextension 60153 "TCC MuM GR Whse. Rcpt. Header" extends "MuM GR Whse. Receipt Header"
{
    fields
    {
        field(60100; "Sell-to Language Code"; code[10])
        {
            Caption = '"Sell-to Language Code"';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer."Language Code" where("No." = field("Sell-to Customer No.")));
        }

    }
}
