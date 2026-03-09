
pageextension 60129 "TCC MuM GR Pro Whse. Receipt" extends "MuM GR Pro. Whse. Receipt"
{
   layout
    {
        addlast("General")
        {
            field("Sales Order"; rec."CO Sales Order")
            {
                ApplicationArea = All;
            }
        }
    } 
}
