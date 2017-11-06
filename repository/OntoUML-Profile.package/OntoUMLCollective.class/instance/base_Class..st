accessing
base_Class: aClass
	| oldClass |
	oldClass := base_Class.
	base_Class := aClass.
	OPUMLToOneLink
		on: self
		thisSelector: #base_Class
		otherSelector: #extension_Collective
		updateFrom: oldClass
		to: aClass