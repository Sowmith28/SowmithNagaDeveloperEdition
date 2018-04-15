({
	helpeMethod : function(component) {
		var accAction = component.get("c.getAccount");
        accAction.setCallback(this,function(response){
        console.log(response.getState());
        if(component.isValid() && response.getState() === "SUCCESS"){
        	component.set("v.accList",response.getReturnValue()); 

        }else{
            console.log('Request Failed !!!'); 
        }                   
       });
       
      $A.enqueueAction(accAction);
	}
})