({
	handleBubbleEvent : function(component, event, helper) {
		console.log('Inside Parent Handle Bubble Event'+event.getParam("AccountName"));
        if(event.getParam("AccountName") == 'xyz'){
            event.stopPropagation();
        }
	}
})