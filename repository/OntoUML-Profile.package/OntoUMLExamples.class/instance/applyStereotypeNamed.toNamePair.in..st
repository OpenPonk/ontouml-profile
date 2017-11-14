support
applyStereotypeNamed: aStereotypeName toNamePair: aNamePair in: aModel
	| packagedElement stereotype |
	packagedElement := aModel packagedElements
		detect: [ :each | 
			(each oclIsKindOf: #Association)
				and: [ (each memberEnds collect: [ :end | end type name ]) asArray sorted = aNamePair sorted ] ].
	stereotype := self profile ownedStereotype detect: [ :each | each name = aStereotypeName ].
	packagedElement applyStereotype: stereotype implementationClass new