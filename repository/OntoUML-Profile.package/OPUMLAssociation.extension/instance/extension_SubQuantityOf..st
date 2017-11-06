*OntoUML-Profile
extension_SubQuantityOf: aSubQuantityOf
	| oldSubQuantityOf |
	oldSubQuantityOf := self extension_SubQuantityOf.
	self tagAt: #extension_SubQuantityOf put: aSubQuantityOf.
	OPUMLToOneLink
		on: self
		thisSelector: #extension_SubQuantityOf
		otherSelector: #base_Association
		updateFrom: oldSubQuantityOf
		to: aSubQuantityOf