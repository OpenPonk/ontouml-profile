actions
baseModel
	<gtExample>
	| model wine alcohol subQuantity wineProp alcoholProp |
	model := OPUmlExamples new emptyModel.
	wine := OPUMLClass new name: 'Wine'.
	alcohol := OPUMLClass new name: 'Alcohol'.
	subQuantity := OPUMLAssociation new.
	(wineProp := OPUMLProperty new)
		name: 'wine';
		lowerValue: (OPUMLLiteralInteger new value: 1);
		upperValue: (OPUMLLiteralUnlimitedNatural new value: 1);
		aggregation: OPUMLAggregationKind composite;
		owningAssociation: subQuantity;
		type: wine.
	(alcoholProp := OPUMLProperty new)
		name: 'alcohol';
		lowerValue: (OPUMLLiteralInteger new value: 1);
		upperValue: (OPUMLLiteralUnlimitedNatural new value: 1);
		owningAssociation: subQuantity;
		type: alcohol.
	subQuantity
		memberEnds:
			{wineProp.
			alcoholProp} asOrderedCollection.
	model packagedElements
		add: wine;
		add: alcohol;
		add: subQuantity.
	^ model