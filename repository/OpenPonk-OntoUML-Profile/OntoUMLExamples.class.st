Class {
	#name : 'OntoUMLExamples',
	#superclass : 'Object',
	#category : 'OpenPonk-OntoUML-Profile-Examples',
	#package : 'OpenPonk-OntoUML-Profile',
	#tag : 'Examples'
}

{ #category : 'models' }
OntoUMLExamples class >> emptyModel [

	<script: 'self emptyModel inspect'>
	^ self new emptyModel
]

{ #category : 'models' }
OntoUMLExamples class >> exampleRoleMixinPattern1 [

	<script: 'self exampleRoleMixinPattern1 inspect'>
	^ self new roleMixinPattern1
]

{ #category : 'models' }
OntoUMLExamples class >> exampleSubQuantityContainment [

	<script: 'self exampleSubQuantityContainment inspect'>
	^ self new subQuantityOfEx1
]

{ #category : 'scripts' }
OntoUMLExamples class >> openExample: aModel [

	| project |
	project := OPProject named: 'OntoUML Example'.
	project addModel: aModel.
	^ (OPWorkbench openProject: project) showAllElementsInAllDiagrams
]

{ #category : 'scripts' }
OntoUMLExamples class >> openExampleEmptyModel [

	<example>
	^ OPProject openOnModel: self emptyModel
]

{ #category : 'examples' }
OntoUMLExamples class >> openExampleRoleMixinPattern1 [

	<example>
	^ self openExample: self new roleMixinPattern1
]

{ #category : 'examples' }
OntoUMLExamples class >> openExampleSubQuantityContainment [

	<example>
	^ self openExample: self exampleSubQuantityContainment
]

{ #category : 'support' }
OntoUMLExamples >> aggregatedFrom: leftSide to: rightSide [
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
]

{ #category : 'support' }
OntoUMLExamples >> applyProfile: aProfile to: aModel [

	aModel profileApplications add:
		(OPUMLProfileApplication new appliedProfile: aProfile)
]

{ #category : 'support' }
OntoUMLExamples >> applyProfileTo: aModel [

	self applyProfile: self profile to: aModel
]

{ #category : 'support' }
OntoUMLExamples >> applyStereotypeNamed: aStereotypeName toName: aPackagedElementName in: aModel [
	| packagedElement stereotype |
	packagedElement := aModel packagedElements detect: [ :each | each name = aPackagedElementName ].
	stereotype := self profile ownedStereotype detect: [ :each | each name = aStereotypeName ].
	packagedElement applyStereotype: stereotype implementationClass new
]

{ #category : 'support' }
OntoUMLExamples >> applyStereotypeNamed: aStereotypeName toNamePair: aNamePair in: aModel [
	| packagedElement stereotype |
	packagedElement := aModel packagedElements
		detect: [ :each | 
			(each oclIsKindOf: #Association)
				and: [ (each memberEnds collect: [ :end | end type name ]) asArray sorted = aNamePair sorted ] ].
	stereotype := self profile ownedStereotype detect: [ :each | each name = aStereotypeName ].
	packagedElement applyStereotype: stereotype implementationClass new
]

{ #category : 'support' }
OntoUMLExamples >> associationFrom: leftSide to: rightSide [
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
		owningAssociation: association;
		type: rightSide.
	association memberEnds addAll: association ownedEnds asArray.
	^ association
]

{ #category : 'examples' }
OntoUMLExamples >> defaultModelName [

	^ 'OntoUML Model'
]

{ #category : 'examples' }
OntoUMLExamples >> emptyModel [

	| model |
	model := OPUMLPackage new name: self defaultModelName.
	self applyProfileTo: model.
	^ model
]

{ #category : 'support' }
OntoUMLExamples >> generalizationFrom: aSpecific to: aGeneral [
	^ OPUMLGeneralization new
		general: aGeneral;
		specific: aSpecific
]

{ #category : 'support' }
OntoUMLExamples >> generalizationSetOn: aCollection [
	| generalizationSet |
	generalizationSet := OPUMLGeneralizationSet new.
	aCollection do: [ :each | generalizationSet generalizations add: each ].
	^ generalizationSet
]

{ #category : 'accessing' }
OntoUMLExamples >> profile [

	^ OntoUMLProfileFactory profile
]

{ #category : 'examples' }
OntoUMLExamples >> roleMixinPattern1 [
	"https://ontouml.org/ufo/wiki/rolemixin/ Pattern 1"

	| model |
	model := self roleMixinPattern1Base.
	self applyStereotypeNamed: #Kind toName: 'Person' in: model.
	self applyStereotypeNamed: #Kind toName: 'Company' in: model.
	self applyStereotypeNamed: #RoleMixin toName: 'Customer' in: model.
	self
		applyStereotypeNamed: #Role
		toName: 'Individual Customer'
		in: model.
	self
		applyStereotypeNamed: #Role
		toName: 'Corporate Customer'
		in: model.
	^ model
]

{ #category : 'examples' }
OntoUMLExamples >> roleMixinPattern1Base [
	"https://ontouml.org/ufo/wiki/rolemixin/ Pattern 1"

	| model customer person company individualCustomer corporateCustomer gs |
	model := self emptyModel.
	(customer := OPUMLClass new name: 'Customer') isAbstract: true.
	person := OPUMLClass new name: 'Person'.
	company := OPUMLClass new name: 'Company'.
	individualCustomer := OPUMLClass new name: 'Individual Customer'.
	corporateCustomer := OPUMLClass new name: 'Corporate Customer'.
	gs := (self generalizationSetOn: {
			       (self generalizationFrom: individualCustomer to: customer).
			       (self generalizationFrom: corporateCustomer to: customer) })
		      name: 'gs1'.
	self generalizationFrom: individualCustomer to: person.
	self generalizationFrom: corporateCustomer to: company.
	model packagedElements
		add: customer;
		add: person;
		add: company;
		add: individualCustomer;
		add: corporateCustomer;
		add: gs.
	^ model
]

{ #category : 'examples' }
OntoUMLExamples >> subQuantityOfEx1 [

	| model |
	model := self subQuantityOfEx1Base.
	self applyStereotypeNamed: #Quantity toName: #Beer in: model.
	self applyStereotypeNamed: #Quantity toName: #Alcohol in: model.
	self applyStereotypeNamed: #Kind toName: #Barrel in: model.
	self
		applyStereotypeNamed: #Containment
		toNamePair: #( Barrel Beer )
		in: model.
	self
		applyStereotypeNamed: #SubQuantityOf
		toNamePair: #( Beer Alcohol )
		in: model.
	^ model
]

{ #category : 'examples' }
OntoUMLExamples >> subQuantityOfEx1Base [

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
]
