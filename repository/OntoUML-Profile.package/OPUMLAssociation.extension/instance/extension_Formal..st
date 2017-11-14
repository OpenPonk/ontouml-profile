*OntoUML-Profile
extension_Formal: aFormal
	| oldFormal |
	oldFormal := self extension_Formal.
	self tagAt: #extension_Formal put: aFormal.
	OPUMLToOneLink
		on: self
		thisSelector: #extension_Formal
		otherSelector: #base_Association
		updateFrom: oldFormal
		to: aFormal