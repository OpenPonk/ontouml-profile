Class {
	#name : #OntoUMLExamples,
	#superclass : #Object,
	#category : #'OntoUML-Profile-Examples'
}

{ #category : #examples }
OntoUMLExamples class >> exampleRoleMixinPattern1 [
	<example: 'Role Mixin'>
	^ OPProject openOnModel: self new roleMixinPattern1
]

{ #category : #examples }
OntoUMLExamples class >> exampleSubQuantityContainment [
	<example: 'Containment, SubQuantityOf'>
	^ OPProject openOnModel: self new subQuantityOfEx1
]

{ #category : #'world menu' }
OntoUMLExamples class >> menuCommandOn: aBuilder [

	<worldMenu>
	| parent |
	parent := #OntoUML.
	(aBuilder item: parent)
		icon: OntoUMLPlugin ontoumlIcon;
		label: 'OntoUML UFO-A Editor';
		action: [ self openEmptyModel ];
		order: 210;
		with: [ 
			(aBuilder item: #OntoUMLEmptyOpen)
				parent: parent;
				label: 'Open Empty Model';
				icon: OntoUMLPlugin ontoumlIcon;
				withSeparatorAfter;
				action: [ self openEmptyModel ].
			((self class methodsInProtocol: 'examples') collect: [ :each | 
				 (aBuilder item: ('OntoUML' , each selector capitalized) asSymbol)
					 parent: parent;
					 label: each pragmas first arguments first;
					 icon: OntoUMLPlugin ontoumlIcon;
					 target: self;
					 selector: each selector ]) last withSeparatorAfter.
			(aBuilder item: #OntoUMLProfileOpen)
				parent: parent;
				label: 'Open OntoUML Profile';
				icon: OntoUMLPlugin ontoumlIcon;
				action: [ OPProject openOnModel: OntoUMLProfileFactory profile ].
			(aBuilder item: #OntoUMLProfileInspect)
				parent: parent;
				label: 'Inspect OntoUML Profile';
				icon: OntoUMLPlugin ontoumlIcon;
				action: [ OntoUMLProfileFactory profile inspect ] ]
]

{ #category : #scripts }
OntoUMLExamples class >> openEmptyModel [
	<script>
	^ OPProject openOnModel: self new emptyModel
]

{ #category : #support }
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

{ #category : #support }
OntoUMLExamples >> applyProfileTo: aModel [
	aModel profileApplications
		add:
			(OPUMLProfileApplication new
				uuid: self profile uuid asString , '-_profileApplication.0';
				appliedProfile: self profile)
]

{ #category : #support }
OntoUMLExamples >> applyStereotypeNamed: aStereotypeName toName: aPackagedElementName in: aModel [
	| packagedElement stereotype |
	packagedElement := aModel packagedElements detect: [ :each | each name = aPackagedElementName ].
	stereotype := self profile ownedStereotype detect: [ :each | each name = aStereotypeName ].
	packagedElement applyStereotype: stereotype implementationClass new
]

{ #category : #support }
OntoUMLExamples >> applyStereotypeNamed: aStereotypeName toNamePair: aNamePair in: aModel [
	| packagedElement stereotype |
	packagedElement := aModel packagedElements
		detect: [ :each | 
			(each oclIsKindOf: #Association)
				and: [ (each memberEnds collect: [ :end | end type name ]) asArray sorted = aNamePair sorted ] ].
	stereotype := self profile ownedStereotype detect: [ :each | each name = aStereotypeName ].
	packagedElement applyStereotype: stereotype implementationClass new
]

{ #category : #support }
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

{ #category : #examples }
OntoUMLExamples >> emptyModel [
	<gtExample>
	| model |
	model := OPUMLPackage new name: 'OntoUML Model'.
	self applyProfileTo: model.
	^ model
]

{ #category : #support }
OntoUMLExamples >> generalizationFrom: aSpecific to: aGeneral [
	^ OPUMLGeneralization new
		general: aGeneral;
		specific: aSpecific
]

{ #category : #support }
OntoUMLExamples >> generalizationSetOn: aCollection [
	| generalizationSet |
	generalizationSet := OPUMLGeneralizationSet new.
	aCollection do: [ :each | generalizationSet generalizations add: each ].
	^ generalizationSet
]

{ #category : #accessing }
OntoUMLExamples >> profile [
	^ OntoUMLProfileFactory profile
]

{ #category : #examples }
OntoUMLExamples >> roleMixinPattern1 [
	"https://ontouml.org/ufo/wiki/rolemixin/ Pattern 1"

	<gtExample>
	| model |
	model := self roleMixinPattern1Base.
	self applyStereotypeNamed: #Kind toName: 'Person' in: model.
	self applyStereotypeNamed: #Kind toName: 'Company' in: model.
	self applyStereotypeNamed: #RoleMixin toName: 'Customer' in: model.
	self applyStereotypeNamed: #Role toName: 'Individual Customer' in: model.
	self applyStereotypeNamed: #Role toName: 'Corporate Customer' in: model.
	^ model
]

{ #category : #examples }
OntoUMLExamples >> roleMixinPattern1Base [
	"https://ontouml.org/ufo/wiki/rolemixin/ Pattern 1"

	<gtExample>
	| model customer person company individualCustomer corporateCustomer gs |
	model := self emptyModel.
	(customer := OPUMLClass new name: 'Customer') isAbstract: true.
	person := OPUMLClass new name: 'Person'.
	company := OPUMLClass new name: 'Company'.
	individualCustomer := OPUMLClass new name: 'Individual Customer'.
	corporateCustomer := OPUMLClass new name: 'Corporate Customer'.
	gs := (self
		generalizationSetOn:
			{self generalizationFrom: individualCustomer to: customer.
			self generalizationFrom: corporateCustomer to: customer}) name: 'gs1'.
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

{ #category : #examples }
OntoUMLExamples >> subQuantityOfEx1 [
	<gtExample>
	| model |
	model := self subQuantityOfEx1Base.
	self applyStereotypeNamed: #Quantity toName: #Beer in: model.
	self applyStereotypeNamed: #Quantity toName: #Alcohol in: model.
	self applyStereotypeNamed: #Kind toName: #Barrel in: model.
	self applyStereotypeNamed: #Containment toNamePair: #(Barrel Beer) in: model.
	self applyStereotypeNamed: #SubQuantityOf toNamePair: #(Beer Alcohol) in: model.
	^ model
]

{ #category : #examples }
OntoUMLExamples >> subQuantityOfEx1Base [
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
]
