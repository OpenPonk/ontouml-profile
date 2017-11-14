*OntoUML-Profile
extension_Object: anObject
	| oldObject |
	oldObject := self extension_Object.
	self tagAt: #extension_Object put: anObject.
	OPUMLToOneLink
		on: self
		thisSelector: #extension_Object
		otherSelector: #base_Class
		updateFrom: oldObject
		to: anObject