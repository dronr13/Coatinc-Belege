
tableextension 60137 "TCC Contact Ext" extends Contact
{
    fields
    {
        field(60100; "Customer No."; code[20])
        {
            Caption = '"Customer No."';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer."No."
                                 where(Name = field("Company Name")));
        }
    }
}