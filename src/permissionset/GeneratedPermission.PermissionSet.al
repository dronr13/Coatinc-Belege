#if Publish
permissionset 60000 GeneratedPermission
{
    Assignable = true;
    Permissions = report "TCC Sales Quotation"=X,
        codeunit "CCTGRProWhsRcpt Business Event"=X,
        codeunit RequeredFieldsWa=X,
        page "MuM GR Pro. W. Receipts API"=X,
        page "MuM GR Whse. Receipts API"=X,
        report "TCC Goods receipt label"=X;
}
#endif