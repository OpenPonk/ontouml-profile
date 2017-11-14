*OntoUML-Profile
extension_Moment: aMoment
	| oldMoment |
	oldMoment := self extension_Moment.
	self tagAt: #extension_Moment put: aMoment.
	OPUMLToOneLink
		on: self
		thisSelector: #extension_Moment
		otherSelector: #base_Class
		updateFrom: oldMoment
		to: aMoment