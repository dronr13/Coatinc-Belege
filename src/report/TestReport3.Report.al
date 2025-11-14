report 60121 "CO Test Report 3"
{
    ApplicationArea = All;
    Caption = 'Test Report 3';

    // RDLCLayout = './src/report/TestReport3.rdl';
    WordLayout = './src/report/TestReport3.docx';
    UsageCategory = Lists;
    dataset
    {
        dataitem(PurchaseHeader; "Purchase Header")
        {

            column(DocumentNo_Caption; Fieldcaption("No."))
            {
            }
            column(No; "No.")
            {
            }
            column(ByFromVendor_Caption; Fieldcaption("Buy-from Vendor No."))
            {
            }
            column(BuyfromVendorNo; "Buy-from Vendor No.")
            {
            }
            column(OrderDate_Caption; Fieldcaption("Order Date"))
            {
            }
            column(OrderDate; "Order Date")
            {
            }
            column(DocumentNo_ByFromPostalcode; Fieldcaption("Buy-from Post Code"))
            {
            }
            column(BuyfromPostCode; "Buy-from Post Code")
            {
            }
            column(DocumentNo_ByFromVendorName; Fieldcaption("Buy-from Vendor Name"))
            {
            }
            column(BuyfromVendorName; "Buy-from Vendor Name")
            {
            }
            column(BuyFromAddress_Caption; Fieldcaption("Buy-from Address"))
            {
            }
            column(BuyfromAddress; "Buy-from Address")
            {
            }
            column(ByFromAddress2_Caption; Fieldcaption("Buy-from Address 2"))
            {
            }
            column(BuyfromAddress2; "Buy-from Address 2")
            {
            }
            column(BuyFromCity_Caption; Fieldcaption("Buy-from City"))
            {
            }
            column(BuyfromCity; "Buy-from City")
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
