codeunit 60127 "TCC Create User Task"
{
    TableNo = "MuM GR Whse. Receipt Header";

    trigger OnRun()
    var
    Begin
        if Rec.IsEmpty then
            exit;

        CreateUserTask(Rec."No.", rec."CO Responsibility Center");
    End;

    local procedure CreateUserTask(MuMGRWhseReceiptHeaderNo: Code[20]; ResponsibilityCenterNo: Code[10])
    var
        UserTask: Record "User Task";
        PartsListIsIncompleteLbl: label 'The parts list for goods receipt %1 is incomplete.', Comment = '%1 = MuM GR Whse. Receipt Header No.';
    begin
        UserTask.Init();
        UserTask.Title := StrSubstNo(PartsListIsIncompleteLbl, MuMGRWhseReceiptHeaderNo);
        UserTask.Insert(true);
        UserTask.SetDescription(StrSubstNo(PartsListIsIncompleteLbl, MuMGRWhseReceiptHeaderNo));
        UserTask.validate("Object Type", UserTask."Object Type"::Page);
        UserTask.Validate("Object ID", Page::"MuM GR Whse. Receipt");
        UserTask.Validate("Assigned To", GetResponsibilityCenterUser(ResponsibilityCenterNo));
        UserTask.Modify(true);
        Commit();
 
        UserTask.SetRecFilter();
        Page.RunModal(Page::"User Task Card", UserTask);
    end;

    local procedure GetResponsibilityCenterUser(ResponsibilityCenterNo: Code[10]): Guid
    var
        ResponsibilityCenter: Record "Responsibility Center";
        EmptyGuid: Guid;
    begin
        if ResponsibilityCenter.get(ResponsibilityCenterNo) then
            exit(ResponsibilityCenter."User ID for User Tasks");

        exit(EmptyGuid);
    end;
}

