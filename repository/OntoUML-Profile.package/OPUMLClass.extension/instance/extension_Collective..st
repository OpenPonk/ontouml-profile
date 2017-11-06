*OntoUML-Profile
extension_Collective: aCollective
	| oldCollective |
	oldCollective := self extension_Collective.
	self tagAt: #extension_Collective put: aCollective.
	OPUMLToOneLink
		on: self
		thisSelector: #extension_Collective
		otherSelector: #base_Class
		updateFrom: oldCollective
		to: aCollective