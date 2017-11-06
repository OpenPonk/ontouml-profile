*OntoUML-Profile
extension_Quantity: aQuantity
	| oldQuantity |
	oldQuantity := self extension_Quantity.
	self tagAt: #extension_Quantity put: aQuantity.
	OPUMLToOneLink
		on: self
		thisSelector: #extension_Quantity
		otherSelector: #base_Class
		updateFrom: oldQuantity
		to: aQuantity