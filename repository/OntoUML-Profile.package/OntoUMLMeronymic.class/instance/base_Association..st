accessing
base_Association: anAssociation
	""
	|anOldBase_Association|
	anOldBase_Association := base_Association.
	base_Association := anAssociation.
	OPUMLToOneLink
		on: self identity
		thisSelector: #base_Association
		otherSelector: #extension_Meronymic
		from: anOldBase_Association
		to: base_Association