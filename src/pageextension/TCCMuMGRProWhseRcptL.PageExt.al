
pageextension 60128 "TCC MuM GR Pro Whse. Rcpt. L." extends "MuM GR Pro. Whse. Rcpt. List"
{
   layout
    {
        addafter("Receipt Date")
        {
            field("Sales Order"; rec."CO Sales Order")
            {
                ApplicationArea = All;
            }
        }
    } 
}
