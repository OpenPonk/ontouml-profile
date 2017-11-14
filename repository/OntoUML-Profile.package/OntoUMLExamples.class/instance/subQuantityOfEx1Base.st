examples
subQuantityOfEx1Base
	<gtExample>
	| model barrel beer alcohol containment subQuantity |
	model := self emptyModel.
	barrel := OPUMLClass new name: 'Barrel'.
	beer := OPUMLClass new name: 'Beer'.
	alcohol := OPUMLClass new name: 'Alcohol'.
	subQuantity := self aggregatedFrom: beer to: alcohol.
	containment := self associationFrom: barrel to: beer.
	model packagedElements
		add: barrel;
		add: beer;
		add: alcohol;
		add: containment;
		add: subQuantity.
	^ model