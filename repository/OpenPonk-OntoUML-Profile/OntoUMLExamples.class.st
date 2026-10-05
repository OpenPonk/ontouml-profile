"
I provide a collection of executable examples demonstrating OntoUML models and modeling patterns (such as RoleMixin and SubQuantity Containment) within the OpenPonk environment.
"
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
OntoUMLExamples class >> exampleAlcohol [

	<script: 'self exampleSubQuantityContainment inspect'>
	^ self new subQuantityOfEx1
]

{ #category : 'examples' }
OntoUMLExamples class >> exampleBloodDonation [
	<script: 'self exampleBloodDonation inspect'>
	^ self new bloodDonation
]

{ #category : 'models' }
OntoUMLExamples class >> exampleRoleMixinPattern1 [

	<script: 'self exampleRoleMixinPattern1 inspect'>
	^ self new roleMixinPattern1
]

{ #category : 'examples' }
OntoUMLExamples class >> openExampleBloodDonation [
	<example>
	^ self openExample: self exampleBloodDonation
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
	association memberEnds addAll: association ownedEnds.
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
	association memberEnds addAll: association ownedEnds.
	^ association
]

{ #category : 'examples' }
OntoUMLExamples >> bloodDonation [
	| model profile applyStereo createAssoc classes genHealthy genDeferred genSet |
	model := self emptyModel name: 'Blood Donation'.
	profile := self profile.
	classes := Dictionary new.

	applyStereo := [ :element :stereoName |
		| stereoClass |
		stereoClass := (profile ownedStereotype detect: [ :s | s name = stereoName ]) implementationClass.
		element applyStereotype: stereoClass new ].

	createAssoc := [ :sourceElement :targetElement :stereoName :assocName |
		| assoc sourceEnd targetEnd |
		assoc := OPUMLAssociation new name: assocName.
		sourceEnd := OPUMLProperty new
			name: '';
			lowerValue: (OPUMLLiteralInteger new value: 1);
			upperValue: (OPUMLLiteralUnlimitedNatural new value: 1);
			owningAssociation: assoc;
			type: sourceElement.
		targetEnd := OPUMLProperty new
			name: '';
			lowerValue: (OPUMLLiteralInteger new value: 1);
			upperValue: (OPUMLLiteralUnlimitedNatural new value: 1);
			owningAssociation: assoc;
			type: targetElement.
		assoc memberEnds addAll: assoc ownedEnds.
		model packagedElements add: assoc.
		applyStereo value: assoc value: stereoName.
		assoc ].

	#(
		('PhysicalEntity' 'Category')
		('InsuredEntity' 'Mixin')
		('ClinicalClient' 'RoleMixin')
		('EligibleEntity' 'PhaseMixin')
		('Person' 'Kind')
		('FemalePerson' 'SubKind')
		('HealthyPerson' 'Phase')
		('DeferredPerson' 'Phase')
		('BloodDonor' 'Role')
		('Nurse' 'Role')
		('MedicalStaff' 'Collective')
		('MobileDriveUnit' 'Collective')
		('WholeBlood' 'Quantity')
		('BloodPlasma' 'Quantity')
		('BloodBag' 'Kind')
		('DonationKit' 'Kind')
		('BloodDonation' 'Relator')
		('BloodType' 'Mode')
		('HemoglobinLevel' 'Quality')
	) do: [ :pair |
		| cls |
		cls := OPUMLClass new name: pair first.
		applyStereo value: cls value: pair second.
		model packagedElements add: cls.
		classes at: pair first put: cls ].

	model packagedElements add: (self generalizationFrom: (classes at: 'FemalePerson') to: (classes at: 'Person')).
	model packagedElements add: (self generalizationFrom: (classes at: 'BloodDonor') to: (classes at: 'HealthyPerson')).
	model packagedElements add: (self generalizationFrom: (classes at: 'BloodDonor') to: (classes at: 'ClinicalClient')).
	model packagedElements add: (self generalizationFrom: (classes at: 'HealthyPerson') to: (classes at: 'EligibleEntity')).
	model packagedElements add: (self generalizationFrom: (classes at: 'Nurse') to: (classes at: 'Person')).
	model packagedElements add: (self generalizationFrom: (classes at: 'Person') to: (classes at: 'PhysicalEntity')).
	model packagedElements add: (self generalizationFrom: (classes at: 'Person') to: (classes at: 'InsuredEntity')).

	genHealthy := self generalizationFrom: (classes at: 'HealthyPerson') to: (classes at: 'Person').
	genDeferred := self generalizationFrom: (classes at: 'DeferredPerson') to: (classes at: 'Person').
	genSet := (self generalizationSetOn: { genHealthy . genDeferred })
		name: 'gsDonorPhases';
		isDisjoint: true;
		isCovering: true.
	model packagedElements add: genHealthy; add: genDeferred; add: genSet.

	createAssoc value: (classes at: 'BloodDonation') value: (classes at: 'BloodDonor') value: 'Mediation' value: 'medDonor'.
	createAssoc value: (classes at: 'BloodDonation') value: (classes at: 'Nurse') value: 'Mediation' value: 'medNurse'.
	createAssoc value: (classes at: 'BloodDonor') value: (classes at: 'Nurse') value: 'Material' value: 'donatesWith'.
	createAssoc value: (classes at: 'BloodDonor') value: (classes at: 'HemoglobinLevel') value: 'Characterization' value: 'charHemoglobin'.
	createAssoc value: (classes at: 'BloodDonor') value: (classes at: 'BloodType') value: 'Characterization' value: 'charBloodType'.
	createAssoc value: (classes at: 'MedicalStaff') value: (classes at: 'Nurse') value: 'MemberOf' value: 'staffMember'.
	createAssoc value: (classes at: 'MedicalStaff') value: (classes at: 'MobileDriveUnit') value: 'SubCollectionOf' value: 'subStaff'.
	createAssoc value: (classes at: 'WholeBlood') value: (classes at: 'BloodPlasma') value: 'SubQuantityOf' value: 'plasmaFraction'.
	createAssoc value: (classes at: 'BloodBag') value: (classes at: 'WholeBlood') value: 'Containment' value: 'containedBlood'.
	(createAssoc value: (classes at: 'DonationKit') value: (classes at: 'BloodBag') value: 'ComponentOf' value: 'kitBag')
		appliedStereotypes first
			essential: true;
			inseparable: true.
	createAssoc value: (classes at: 'Person') value: (classes at: 'Person') value: 'DomainFormal' value: 'isCompatibleDonor'.

	^ model
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
