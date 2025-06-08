public class LeadExtension
{
    Public List<Lead>lList{get;set;}
    
    public LeadExtension(ApexPages.StandardController s)
    {
        lList=[Select Name,Status From Lead order by Name ];
    }
}