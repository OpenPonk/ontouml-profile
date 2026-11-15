"
Verifies Magritte descriptions and properties of association view models under applied OntoUML stereotypes.
"
Class {
	#name : 'OPOntoUmlAssociationViewModelTest',
	#superclass : 'TestCase',
	#instVars : [
		'project',
		'classA',
		'classB',
		'endA',
		'endB',
		'association',
		'registry',
		'viewModel'
	],
	#category : 'OpenPonk-OntoUML-Plugin-Tests-Plugin',
	#package : 'OpenPonk-OntoUML-Plugin-Tests',
	#tag : 'Plugin'
}

{ #category : 'running' }
OPOntoUmlAssociationViewModelTest >> setUp [
	super setUp.
	project := OPProject new.
	classA := OPUMLClass new name: 'ClassA'.
	classB := OPUMLClass new name: 'ClassB'.
	endA := OPUMLProperty new name: 'roleA'; type: classA.
	endB := OPUMLProperty new name: 'roleB'; type: classB.
	association := OPUMLAssociation new name: 'AssocAB'.
	endA association: association.
	endB association: association.
	association memberEnds add: endA; add: endB.
	endA owningAssociation: association.
	endB owningAssociation: association.
	project addModel: (OPUMLPackage new name: 'RootPkg'; yourself).
	project models first packagedElements addAll: { classA . classB . association }.
	registry := OPViewModelRegistry forProject: project.
	viewModel := registry viewModelFor: association
]

{ #category : 'running' }
OPOntoUmlAssociationViewModelTest >> tearDown [
	viewModel := nil.
	registry := nil.
	classA := nil.
	classB := nil.
	endA := nil.
	endB := nil.
	association := nil.
	project := nil.
	super tearDown
]

{ #category : 'tests' }
OPOntoUmlAssociationViewModelTest >> testAssociationWithComponentOfEssentialAndInseparableCanBeReadAndWritten [

	| componentOfStereotype descriptions essentialDescription inseparableDescription |
	componentOfStereotype := OntoUMLComponentOf new.
	association applyStereotype: componentOfStereotype.

	descriptions := (OPUmlStereotypeDescriptions for: viewModel) descriptions.
	essentialDescription := descriptions detect: [ :each | each label = 'Is Essential' ].
	inseparableDescription := descriptions detect: [ :each | each label = 'Is Inseparable' ].

	self deny: (essentialDescription accessor read: viewModel) description: 'ComponentOf essential property must initially be false'.
	self
		deny: (inseparableDescription accessor read: viewModel)
		description: 'ComponentOf inseparable property must initially be false'.

	essentialDescription accessor write: true to: viewModel.
	self
		assert: componentOfStereotype essential
		description: 'ComponentOf essential attribute must be true after writing through accessor'.
	self
		assert: (essentialDescription accessor read: viewModel)
		description: 'Essential accessor must read true after enabling essential'.

	inseparableDescription accessor write: true to: viewModel.
	self
		assert: componentOfStereotype inseparable
		description: 'ComponentOf inseparable attribute must be true after writing through accessor'.
	self
		assert: (inseparableDescription accessor read: viewModel)
		description: 'Inseparable accessor must read true after enabling inseparable'
]

{ #category : 'tests' }
OPOntoUmlAssociationViewModelTest >> testAssociationWithComponentOfHasEssentialAndInseparableDescriptions [
	| componentOfStereotype descriptions collectBooleanLabels booleanLabels |
	componentOfStereotype := OntoUMLComponentOf new.
	association applyStereotype: componentOfStereotype.

	descriptions := viewModel magritteDescription.

	collectBooleanLabels := nil.
	collectBooleanLabels := [ :container |
		| labels |
		labels := OrderedCollection new.
		container children do: [ :each |
			(each isKindOf: MABooleanDescription) ifTrue: [ labels add: each label ].
			(each isKindOf: MAContainer) ifTrue: [ labels addAll: (collectBooleanLabels value: each) ] ].
		labels ].

	booleanLabels := collectBooleanLabels value: descriptions.

	self assertCollection: booleanLabels includesAll: { 'Is Essential' . 'Is Inseparable' }
]

{ #category : 'tests' }
OPOntoUmlAssociationViewModelTest >> testAssociationWithComponentOfImmutablePartAndImmutableWholeCanBeReadAndWritten [

	| componentOfStereotype descriptions immutablePartDescription immutableWholeDescription |
	componentOfStereotype := OntoUMLComponentOf new.
	association applyStereotype: componentOfStereotype.

	descriptions := (OPUmlStereotypeDescriptions for: viewModel) descriptions.
	immutablePartDescription := descriptions detect: [ :eachDescription | eachDescription label = 'Is Immutable Part' ].
	immutableWholeDescription := descriptions detect: [ :eachDescription | eachDescription label = 'Is Immutable Whole' ].

	self
		deny: (immutablePartDescription accessor read: viewModel)
		description: 'ComponentOf immutablePart property must initially be false'.
	self
		deny: (immutableWholeDescription accessor read: viewModel)
		description: 'ComponentOf immutableWhole property must initially be false'.

	immutablePartDescription accessor write: true to: viewModel.
	self
		assert: componentOfStereotype immutablePart
		description: 'ComponentOf immutablePart attribute must be true after writing through accessor'.
	self
		assert: (immutablePartDescription accessor read: viewModel)
		description: 'ImmutablePart accessor must read true after enabling immutablePart'.

	immutableWholeDescription accessor write: true to: viewModel.
	self
		assert: componentOfStereotype immutableWhole
		description: 'ComponentOf immutableWhole attribute must be true after writing through accessor'.
	self
		assert: (immutableWholeDescription accessor read: viewModel)
		description: 'ImmutableWhole accessor must read true after enabling immutableWhole'
]

{ #category : 'tests' }
OPOntoUmlAssociationViewModelTest >> testAssociationWithMeronymicSubtypesHasAllFourModalDescriptions [

	| meronymicClasses |
	meronymicClasses := {
		                    OntoUMLComponentOf.
		                    OntoUMLMemberOf.
		                    OntoUMLSubCollectionOf.
		                    OntoUMLSubQuantityOf }.

	meronymicClasses do: [ :eachStereotypeClass |
			| descriptions labels |
			viewModel removeStereotypesIn: association.
			association applyStereotype: eachStereotypeClass new.
			descriptions := (OPUmlStereotypeDescriptions for: viewModel) descriptions.
			labels := descriptions collect: #label.
			self assertCollection: labels hasSameElements: { 'Is Essential'. 'Is Inseparable'. 'Is Immutable Part'. 'Is Immutable Whole' } ]
]

{ #category : 'tests' }
OPOntoUmlAssociationViewModelTest >> testChangingStereotypeInFormRebuildsFormWithStereotypeAttributes [

	| form checkboxLabelsBeforeChange stereotypeDropListBinding checkboxLabelsAfterChange modalLabels |
	modalLabels := { 'Is Essential'. 'Is Inseparable'. 'Is Immutable Part'. 'Is Immutable Whole' }.
	project models first profileApplications add: (OPUMLProfileApplication new appliedProfile: OntoUMLProfileFactory profile).
	form := OPPropertiesForm new.
	form viewModel: viewModel.

	checkboxLabelsBeforeChange := form bindings
		                              select: [ :eachBinding | eachBinding isKindOf: OPFormCheckboxBinding ]
		                              thenCollect: [ :eachBinding | eachBinding presenter label ].
	self denyCollection: checkboxLabelsBeforeChange includesAny: modalLabels.

	stereotypeDropListBinding := form bindings detect: [ :eachBinding |
		                             eachBinding description isNotNil and: [ eachBinding description label = 'Stereotype' ] ].
	stereotypeDropListBinding presenter selectItem: 'MemberOf'.

	self assertCollection: (association appliedStereotypes collect: #class) hasSameElements: { OntoUMLMemberOf }.

	checkboxLabelsAfterChange := form bindings
		                             select: [ :eachBinding | eachBinding isKindOf: OPFormCheckboxBinding ]
		                             thenCollect: [ :eachBinding | eachBinding presenter label ].

	self assertCollection: checkboxLabelsAfterChange includesAll: modalLabels
]

{ #category : 'tests' }
OPOntoUmlAssociationViewModelTest >> testCreatingMemberOfAssociationFromPaletteRebuildsFormWithStereotypeAttributes [

	| diagramController palette memberOfEntry form associationController checkboxLabelsBefore checkboxLabels modalLabels |
	modalLabels := { 'Is Essential'. 'Is Inseparable'. 'Is Immutable Part'. 'Is Immutable Whole' }.
	project models first profileApplications add: (OPUMLProfileApplication new appliedProfile: OntoUMLProfileFactory profile).

	diagramController := OPUmlPackageDiagramController new.
	diagramController viewModel: (registry viewModelFor: project models first).

	palette := OPPalette new.
	diagramController initializeProfile: OntoUMLProfileFactory profile palette: palette.

	memberOfEntry := palette entries detect: [ :eachEntry | eachEntry label = 'MemberOf' ].
	self assert: memberOfEntry class identicalTo: OPPaletteEntry.
	self assert: memberOfEntry label equals: 'MemberOf'.
	self assert: memberOfEntry tool class identicalTo: OPConnectionCreationTool.

	viewModel removeStereotypesIn: association.
	form := OPPropertiesForm new.
	form viewModel: viewModel.

	checkboxLabelsBefore := form bindings
		                        select: [ :eachBinding | eachBinding isKindOf: OPFormCheckboxBinding ]
		                        thenCollect: [ :eachBinding | eachBinding presenter label ].
	self denyCollection: checkboxLabelsBefore includesAny: modalLabels.

	associationController := OPUmlAssociationController new.
	associationController viewModel: viewModel.

	(memberOfEntry tool instVarNamed: #onComplete) value: associationController.

	self assertCollection: (association appliedStereotypes collect: #class) hasSameElements: { OntoUMLMemberOf }.

	checkboxLabels := form bindings
		                  select: [ :eachBinding | eachBinding isKindOf: OPFormCheckboxBinding ]
		                  thenCollect: [ :eachBinding | eachBinding presenter label ].

	self assertCollection: checkboxLabels includesAll: modalLabels
]
