accessing
base_Class: aClass
	| oldClass |
	oldClass := base_Class.
	base_Class := aClass.
	OPUMLToOneLink
		on: self
		thisSelector: #base_Class
		otherSelector: #extension_Kind
		updateFrom: oldClass
		to: aClass