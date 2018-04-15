public class VFController {
 
    // Constructor - this only really matters if the autoRun function doesn't work right
    private final account a;
    public VFController(ApexPages.StandardController stdController) {
        this.a = (Account)stdController.getRecord();
    }
     
    // Code we will invoke on page load.
    public PageReference autoRun() {
 
        String theId = ApexPages.currentPage().getParameters().get('SG_AccountId__c');
 
        if (theId == null) {
            // Display the Visualforce page's content if no Id is passed over
            return null;
        }
 
        for (Account a:[select SG_AccountId__c from Account where SG_AccountId__c =:theId]) {
            // Do all the dirty work we need the code to do
            PageReference pageRef = new PageReference('https://pp-gridlink.smartgridcis.com/sso.aspx?uid=' + theId + ';ts=AD');
            pageRef.setRedirect(true);
            return pageRef;
        }
 
        // Redirect the user back to the original page
        PageReference pageRef = new PageReference('/' + theId + ';ts=AD');
        pageRef.setRedirect(true);
        return pageRef;
 
    }
 
}