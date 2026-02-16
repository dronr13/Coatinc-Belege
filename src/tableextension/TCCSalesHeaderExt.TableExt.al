tableextension 60136 "TCC Sales Header Ext" extends "Sales Header"
{
    fields
    {
        field(60100; "Created By Name"; Text[100])
        {
            Caption = 'Created By';
            DataClassification = CustomerContent;
        }

        field(60101; "Modified By Name"; Text[100])
        {
            Caption = 'Modified By';
            DataClassification = CustomerContent;
        }
    }

    trigger OnInsert()
    begin
        "Created By Name" := GetUserNameFromSecurityId(SystemCreatedBy);
        "Modified By Name" := GetUserNameFromSecurityId(SystemModifiedBy);
    end;

    trigger OnModify()
    begin
        "Modified By Name" := GetUserNameFromSecurityId(SystemModifiedBy);
        // "Created By Name" := GetUserNameFromSecurityId(SystemCreatedBy);
    end;

    local procedure GetUserNameFromSecurityId(UserSecurityID: Guid): Text[100]
    var
        User: Record User;
    begin
        if User.Get(UserSecurityID) then
            exit(User."User Name"); // of User."Full Name"
        exit('');
    end;
}
