Class {
	#name : #OntoUMLProfileFactory,
	#superclass : #OPUmlCustomProfile,
	#category : #'OntoUML-Profile-Model'
}

{ #category : #actions }
OntoUMLProfileFactory >> baseModel [
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
		owningAssociation: subQuantity;
		type: wine.
	(alcoholProp := OPUMLProperty new)
		name: 'alcohol';
		lowerValue: (OPUMLLiteralInteger new value: 1);
		upperValue: (OPUMLLiteralUnlimitedNatural new value: 1);
		aggregation: OPUMLAggregationKind composite;
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
]

{ #category : #actions }
OntoUMLProfileFactory >> createProfile [
	^ self profile
]

{ #category : #example }
OntoUMLProfileFactory >> example [
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
		thenDo: [ :each | each applyStereotype: quantityStereotype implementationClass new ].
	model packagedElements
		select: [ :each | each oclIsKindOf: #Association ]
		thenDo: [ :each | 
			| stereo |
			stereo := subQuantityOfStereotype implementationClass new.
			stereo essential: true.
			each applyStereotype: stereo ].
	^ model
]

{ #category : #parts }
OntoUMLProfileFactory >> formalPair [
	<gtExample>
	| pair |
	pair := self newStereotype: #Formal to: (self metaClassNamed: 'Association').
	pair first isAbstract: true.
	^ pair
]

{ #category : #actions }
OntoUMLProfileFactory >> generate [
	<script: 'self new generate'>
	| model generator |
	model := self class profile.
	generator := OPUMLProfileGenerator new.
	generator sourceModel: model.
	generator classPrefix: model implementationPrefix.
	generator packageName: model implementationPackage.
	(CBChangesBrowser changes: generator generateAll) open
]

{ #category : #parts }
OntoUMLProfileFactory >> materialPair [
	<gtExample>
	| pair |
	pair := self newStereotype: #Material to: (self metaClassNamed: 'Association').
	pair first isAbstract: true.
	^ pair
]

{ #category : #parts }
OntoUMLProfileFactory >> meronymicPair [
	<gtExample>
	| pair stereotype |
	pair := self newStereotype: #Meronymic to: (self metaClassNamed: 'Association').
	pair first isAbstract: true.
	stereotype := pair first.
	stereotype isAbstract: true.
	OPUMLProperty new
		name: 'essential';
		uuid: stereotype uuid , '-essential';
		owningClass: stereotype;
		type: (OPUMLPrimitiveType new name: 'Boolean');
		defaultValue:
			(OPUMLLiteralBoolean new
				value: false;
				uuid: stereotype uuid , '-essential-_defaultValue').
	OPUMLProperty new
		name: 'inseparable';
		uuid: stereotype uuid , '-inseparable';
		owningClass: stereotype;
		type: (OPUMLPrimitiveType new name: 'Boolean');
		defaultValue:
			(OPUMLLiteralBoolean new
				value: false;
				uuid: stereotype uuid , '-inseparable-_defaultValue').
	^ pair
]

{ #category : #parts }
OntoUMLProfileFactory >> momentPair [
	<gtExample>
	| classMetaclass pair stereotype |
	classMetaclass := self metaClassNamed: 'Class'.
	pair := self newStereotype: #Moment to: classMetaclass.
	stereotype := pair first.
	stereotype isAbstract: true.
	^ pair
]

{ #category : #parts }
OntoUMLProfileFactory >> newStereotype: aName subclassOf: aParent [
	| stereotype |
	stereotype := OPUMLStereotype new
		name: aName;
		uuid: aName.
	OPUMLGeneralization new
		general: aParent;
		specific: stereotype.
	^ stereotype
]

{ #category : #parts }
OntoUMLProfileFactory >> objectPair [
	<gtExample>
	| classMetaclass pair stereotype |
	classMetaclass := self metaClassNamed: 'Class'.
	pair := self newStereotype: #Object to: classMetaclass.
	stereotype := pair first.
	stereotype isAbstract: true.
	^ pair
]

{ #category : #example }
OntoUMLProfileFactory >> openExample [
	<script: 'self new openExample'>
	OPProject openOnModel: self example
]

{ #category : #actions }
OntoUMLProfileFactory >> openProfile [
	<script: 'self new openProfile'>
	OPProject openOnModel: self class profile
]

{ #category : #accessing }
OntoUMLProfileFactory >> profile [
	<gtExample>
	| profile hierarchy |
	profile := self profilePackage.
	profile packagedElements addAll: self formalPair.
	profile packagedElements addAll: self materialPair.
	profile packagedElements addAll: self meronymicPair.
	profile packagedElements addAll: self momentPair.
	profile packagedElements addAll: self objectPair.
	hierarchy := {#Object -> #(Sortal MixinClass).
	#Sortal -> #(RigidSortal AntiRigidSortal).
	#RigidSortal -> #(SubstanceSortal SubKind).
	#SubstanceSortal -> #(Kind Quantity Collective).
	#AntiRigidSortal -> #(Phase Role).
	#MixinClass -> #(NonRigidMixin RigidMixin).
	#NonRigidMixin -> #(AntiRigidMixin SemiRigidMixin).
	#AntiRigidMixin -> #(RoleMixin).
	#SemiRigidMixin -> #(Mixin).
	#RigidMixin -> #(Category).
	#Moment -> #(Relator IntrinsicMoment).
	#IntrinsicMoment -> #(Mode Quality)}
		,
			{#Formal -> #(BasicInternal DomainFormal).
			#BasicInternal -> #(Characterization Mediation Derivation Containment).
			#Meronymic -> #(ComponentOf MemberOf SubCollectionOf SubQuantityOf)}.
	hierarchy
		do: [ :pair | 
			| parent |
			parent := profile packagedElements detect: [ :each | each name = pair key ].
			parent isAbstract: true.
			pair value do: [ :each | profile packagedElements add: (self newStereotype: each subclassOf: parent) ] ].
	profile ownedStereotype do: [ :each | each profile: profile ].
	^ profile
]

{ #category : #parts }
OntoUMLProfileFactory >> profilePackage [
	<gtExample>
	^ OPUMLProfile new
		name: 'OntoUML';
		uuid: '_0';
		URI: 'http://www.openponk.org/OntoUML/0.1';
		implementationPackage: 'OntoUML-Profile';
		implementationPrefix: 'OntoUML';
		yourself
]

{ #category : #actions }
OntoUMLProfileFactory >> reset [
	<script: 'self reset'>
	self class reset
]
