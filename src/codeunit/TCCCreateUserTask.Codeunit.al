
codeunit 60127 "TCC Create User Task"
{
    TableNo = "MuM GR Whse. Receipt Header";

    trigger OnRun()
    var
    Begin
        if Rec.IsEmpty then
            exit;

        CreateUserTask(Rec."No.");
    End;

    local procedure CreateUserTask(MuMGRWhseReceiptHeaderNo: Code[20])
    var
        UserTask: Record "User Task";
        PartsListIsIncompleteLbl: label 'The parts list for goods receipt %1 is incomplete.', Comment = '%1 = MuM GR Whse. Receipt Header No.';
    begin
        UserTask.Init();
        UserTask.Title := StrSubstNo(PartsListIsIncompleteLbl, MuMGRWhseReceiptHeaderNo);
        UserTask.SetDescription(StrSubstNo(PartsListIsIncompleteLbl, MuMGRWhseReceiptHeaderNo)); //Text erweitern!
        UserTask.validate("Object Type", UserTask."Object Type"::Page);
        UserTask.Validate("Object ID", Page::"MuM GR Whse. Receipt");
        //UserTask.Validate("Assigned To" ); ??? wie
        UserTask.Insert();
    end;
}

