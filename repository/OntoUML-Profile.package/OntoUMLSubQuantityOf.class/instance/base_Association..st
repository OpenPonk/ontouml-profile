accessing
base_Association: anAssociation
	| oldAssociation |
	oldAssociation := base_Association.
	base_Association := anAssociation.
	OPUMLToOneLink
		on: self
		thisSelector: #base_Association
		otherSelector: #extension_SubQuantityOf
		updateFrom: oldAssociation
		to: anAssociation