({
    save : function(component, event, helper) {
        var accAction =component.get("c.saveAccount");
        
        accAction.setParams({
            'acc':component.get('v.accRec')
        });
        
        accAction.setCallback(this, function(response){
                 var state= response.getState();
        if(component.isValid() && state==="SUCCESS"){
            console.log('Account created successfully');
            var toastEvent =$A.get("e.force:showToast");
            toastEvent.setParams({
                "title":"Success!",
                "message":"The record has been created successfully."
            });
            toastEvent.fire();
            console.log('Account created successfully');
        }
        else{
            var errMsg = response.getError();
             console.log('Request Failure'+errMsg[0].message);
            var toastEvent =$A.get("e.force:showToast");
            toastEvent.setParams({
                "title":"Failure!",
                "message":errMsg[0].message
            });
            toastEvent.fire();
        }
              });
        //$A.enqueueAction(accAction);
        
        var aName = component.find("accName");
        if($A.util.isEmpty(aName.get("v.value"))){
           aName.set("v.errors",[{message:"Account Name is missing"}]);
    }else{
    $A.enqueueAction(accAction);
        
}
    }
})