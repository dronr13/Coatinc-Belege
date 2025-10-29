report 60122 "CO Test Report MH"
{
    ApplicationArea = All;
    Caption = 'Test Report MH';
    RDLCLayout = './src/report/TestReportMH.rdl';
    UsageCategory = Lists;
    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            column(DocumentNo_Caption; Fieldcaption("No."))
            {
            }
            column(No; "No.")
            {
            }
            column(BillToName_Caption; Fieldcaption("Bill-to Name"))
            {
            }
            column(BilltoName; "Bill-to Name")
            {
            }
            column(BillToAddress_Caption; Fieldcaption("Bill-to Address"))
            {
            }
            column(BilltoAddress; "Bill-to Address")
            {
            }
            column(BillToPostCode_Caption; Fieldcaption("Bill-to Post Code"))
            {
            }
            column(BilltoPostCode; "Bill-to Post Code")
            {
            }
            column(BilltoCity_Caption; Fieldcaption("Bill-to City"))
            {
            }
            column(BilltoCity; "Bill-to City")
            {
            }
            column(Amount_Caption; Fieldcaption("Amount"))
            {
            }
            column(Amount; Amount)
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
