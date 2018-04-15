({
	fireAppEvent : function(component, event, helper) {
        var aEvent =$A.get("e.c:appEvent");
        aEvent.setParam("message","Fired From Notified");
        aEvent.fire();
	},
    handleAppEvent : function(component, event, helper) {
		console.log('Handle app event from notifier component');
	}
})