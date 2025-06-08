({
	doClick : function(component, event, helper) {
		alert(component.isvalid());
        alert(component.getName());
        alert(component.get('v.whom'));
	}
})