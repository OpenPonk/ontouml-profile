actions
createProfile
	| profile classMetaclass sortals meronymic associationMetaclass |
	profile := OPUMLProfile new
		name: 'OntoUML';
		uuid: '_0';
		URI: 'http://www.openponk.org/OntoUML/0.1';
		implementationPackage: 'OntoUML-Profile';
		implementationPrefix: 'OntoUML'.
	classMetaclass := self metaClassNamed: 'Class'.
	sortals := #(Kind Quantity Collective).
	sortals sorted
		do:
			[ :each | profile packagedElements addAll: (self newStereotype: each to: classMetaclass) ].
	associationMetaclass := self metaClassNamed: 'Association'.
	meronymic := #(SubQuantityOf).
	meronymic sorted
		do: [ :each | 
			| pair |
			pair := self newStereotype: each to: associationMetaclass.
			profile packagedElements addAll: pair.
			OPUMLProperty new
				name: 'essential';
				uuid: pair first uuid , '-essential';
				owningClass: pair first;
				type: (OPUMLPrimitiveType new name: 'Boolean').
			OPUMLProperty new
				name: 'inseparable';
				uuid: pair first uuid , '-inseparable';
				owningClass: pair first;
				type: (OPUMLPrimitiveType new name: 'Boolean') ].
	profile ownedStereotype do: [ :each | each profile: profile ].
	^ profile