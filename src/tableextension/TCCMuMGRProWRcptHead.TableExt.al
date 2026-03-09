tableextension 60138 "TCC MuM GR Pro. W. Rcpt. Head." Extends "MuM GR Pro. W. Rcpt. Header"
{
  fields{
      Field(60100; "Sales Order"; Code[20])
      {
            Caption = 'Sales Order';
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header"."No."
                                 where("CO Whse. Receipt" = field("No.")));
      }
  }
}