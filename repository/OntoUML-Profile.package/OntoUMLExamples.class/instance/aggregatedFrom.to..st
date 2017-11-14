support
aggregatedFrom: leftSide to: rightSide
	| association leftProp rightProp |
	association := OPUMLAssociation new.
	(leftProp := OPUMLProperty new)
		name: '';
		lowerValue: (OPUMLLiteralInteger new value: 1);
		upperValue: (OPUMLLiteralUnlimitedNatural new value: 1);
		owningAssociation: association;
		type: leftSide.
	(rightProp := OPUMLProperty new)
		name: '';
		lowerValue: (OPUMLLiteralInteger new value: 1);
		upperValue: (OPUMLLiteralUnlimitedNatural new value: 1);
		aggregation: OPUMLAggregationKind composite;
		owningAssociation: association;
		type: rightSide.
	association memberEnds addAll: association ownedEnds asArray.
	^ association