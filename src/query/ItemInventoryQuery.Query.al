query 60160 ItemInventoryQuery
{
    QueryType = Normal;
    
    elements
    {
        dataitem(Item; Item)
        {
            column(No_; "No.")
            {
            
            }
            column(Description;Description)
            {

            }
            dataitem(WarehouseEntry;"Warehouse Entry")
            {

                DataItemLink = "Item No." = Item."No.";
                SqlJoinType = InnerJoin;

                
                column(Location_Code;"Location Code")
                {              

                }
                column(Bin_Code;"Bin Code")
                {

                }
                column(Item_No_;"Item No.")
                {

                }
                column(Quantity;Quantity)
                {
                    Method = sum;
                }
                
            }


        }
    }
    
    var
        myInt: Integer;
    
    trigger OnBeforeOpen()
    begin
        
    end;
}