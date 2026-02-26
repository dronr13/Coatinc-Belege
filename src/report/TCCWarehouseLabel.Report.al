report 60135 "TCC WarehouseLabel"
{
    Caption = 'Warehouse Label';
    UsageCategory = Documents;
    ApplicationArea = All;
    RDLCLayout = './src/reports/warehouselabel.rdl';

    dataset
    {
        dataitem(ProdLines; "MuM PC Prod. Campaign Line")
        {
            DataItemTableView = sorting("Campaign No.", "Line No.");
            RequestFilterFields = "Campaign No.";

            column(Ordernr; "CO Sales Order No.") { }
            column(ProdOrderNr; "Prod. Order No.") { }
            column(Artikel; "Item No.") { }
            column(Description; "Item Description") { }

            dataitem(ProdOrder; "MuM PC Production Camp. Header")
            {
                DataItemLink = "Campaign no." = field("Campaign No.");
                column(CampaignNr; "Campaign No.") { }
            }
            dataitem(SalesHeader; "Sales Header")
            {
                DataItemLink = "No." = field("CO Sales Order No.");
                Column(Customer; "Bill-to Name") { }
                column(CustomerNr; "Bill-to Customer No.") { }
                column(Reference; "Your Reference") { }
            }
            dataitem(Packages; "MuM PM Physical Packages")
            {
                DataItemLink = "Document No." = field("Campaign No.");
                DataItemTableView = Sorting ("Document No.")
                                    where ("Line Type" = const(Item));

                column(Collonr; "Package Code") { }
                column(Level; Level) { }
                column(Weight; "Quantity") { }
            }

        }

    }
}


