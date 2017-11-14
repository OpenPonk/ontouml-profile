accessing
base_Class: aClass
	""
	|anOldBase_Class|
	anOldBase_Class := base_Class.
	base_Class := aClass.
	OPUMLToOneLink
		on: self identity
		thisSelector: #base_Class
		otherSelector: #extension_Moment
		from: anOldBase_Class
		to: base_Class