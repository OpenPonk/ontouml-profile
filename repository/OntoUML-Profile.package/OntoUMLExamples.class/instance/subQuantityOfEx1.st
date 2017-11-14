examples
subQuantityOfEx1
	<gtExample>
	| model |
	model := self subQuantityOfEx1Base.
	self applyStereotypeNamed: #Quantity toName: #Beer in: model.
	self applyStereotypeNamed: #Quantity toName: #Alcohol in: model.
	self applyStereotypeNamed: #Kind toName: #Barrel in: model.
	self applyStereotypeNamed: #Containment toNamePair: #(Barrel Beer) in: model.
	self applyStereotypeNamed: #SubQuantityOf toNamePair: #(Beer Alcohol) in: model.
	^ model