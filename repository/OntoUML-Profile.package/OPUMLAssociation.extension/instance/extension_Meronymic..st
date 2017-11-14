*OntoUML-Profile
extension_Meronymic: aMeronymic
	| oldMeronymic |
	oldMeronymic := self extension_Meronymic.
	self tagAt: #extension_Meronymic put: aMeronymic.
	OPUMLToOneLink
		on: self
		thisSelector: #extension_Meronymic
		otherSelector: #base_Association
		updateFrom: oldMeronymic
		to: aMeronymic