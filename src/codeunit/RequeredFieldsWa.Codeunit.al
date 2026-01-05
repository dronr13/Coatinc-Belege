codeunit 60126 RequeredFieldsWa
{
    TableNo = "MuM GR Whse. Receipt Header";

    trigger OnRun()
    var
    Begin
        // if (not rec."CO Photo Available") then
        //     Error('Bitte mache photo!');
        if (rec."Location Code" = '') then
            Error('Die lagerplaze ist lehr!');
        
    End;   
}