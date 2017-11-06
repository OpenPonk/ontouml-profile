*OntoUML-Profile
extension_Kind: aKind
	| oldKind |
	oldKind := self extension_Kind.
	self tagAt: #extension_Kind put: aKind.
	OPUMLToOneLink
		on: self
		thisSelector: #extension_Kind
		otherSelector: #base_Class
		updateFrom: oldKind
		to: aKind