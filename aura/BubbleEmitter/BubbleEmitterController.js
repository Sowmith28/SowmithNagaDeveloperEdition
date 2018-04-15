({
bubbleEmitter : function(component, event, helper) {
 
        var bEvent = component.getEvent("bubbleEvtReg");
        bEvent.setParam("AccountName",'xyz');
        bEvent.fire();
        
},
    
    handleBubbleEvent : function(component, event, helper){
        console.log('Inside Bubble Emitter Handler Event' +event.getParam("AccountName"));
    }
})