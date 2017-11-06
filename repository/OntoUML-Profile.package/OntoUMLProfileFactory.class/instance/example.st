actions
example
	<gtExample>
	| model profile quantityStereotype subQuantityOfStereotype |
	model := self baseModel.
	profile := self class profile.
	model profileApplications
		add:
			(OPUMLProfileApplication new
				uuid: model uuid , '-_profileApplication.0';
				appliedProfile: profile).
	quantityStereotype := profile packagedElements
		detect: [ :each | each name = 'Quantity' ].
	subQuantityOfStereotype := profile packagedElements
		detect: [ :each | each name = 'SubQuantityOf' ].
	model packagedElements
		select: [ :each | each oclIsKindOf: #Class ]
		thenDo: [ :each | each applyStereotype: quantityStereotype implementationClass asClass new ].
	model packagedElements
		select: [ :each | each oclIsKindOf: #Association ]
		thenDo: [ :each | 
			| stereo |
			stereo := subQuantityOfStereotype implementationClass asClass new.
			stereo essential: true.
			each applyStereotype: stereo ].
	^ model