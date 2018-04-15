public with sharing class ChangeCaseOwnerControllerExt {
    
    public String caseId;
    private ApexPages.StandardController ctrl;
    public boolean Iserror{get;set;}       
    
    
    public ChangeCaseOwnerControllerExt(ApexPages.StandardController sc) {
        this.caseId = ApexPages.currentPage().getParameters().get('id');
        this.ctrl = sc;
        Iserror = false;
    }
    
    public PageReference  changeCaseOwner() {
        PageReference casePage = new PageReference('/apex/Case');
        casePage.getParameters().put('id', caseId);
        Case caseForChange;
        Case newCase = (Case)ctrl.getRecord();
        List<Case> cases = [SELECT Id, OwnerId FROM Case WHERE Id = :caseId];
        if (!cases.isEmpty() && newCase != null && string.isNotBlank(newCase.OwnerId)) {
            caseForChange = cases[0];
            caseForChange.OwnerId = newCase.OwnerId;
            caseForChange.Status = 'Label.LS_Case_Status';
           update caseForChange;
           
                }else{
            Iserror = true;
            apexpages.addmessage(new apexpages.message(ApexPages.severity.ERROR, 'Please enter a value'));
            system.debug('error' + Iserror );
            return null;
        }
        return null;
    }
    
    
    public pageReference cancelAction(){
        Iserror = false;       
        return null;
    }
    
    
}