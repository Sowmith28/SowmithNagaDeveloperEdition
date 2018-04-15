({
	handleAppEvent : function(component, event, helper) {
		var Appmessage =event.getParams("message");
        component.set("v.eventMessage",Appmessage.message);
        console.log('Handle app event from hadler component'+Appmessage.message);
	}
})