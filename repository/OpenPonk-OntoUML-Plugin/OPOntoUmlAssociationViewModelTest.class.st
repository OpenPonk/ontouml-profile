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
	#category : 'OpenPonk-OntoUML-Plugin-Tests',
	#package : 'OpenPonk-OntoUML-Plugin',
	#tag : 'Tests'
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
	| componentOfStereotype descriptions essentialDesc inseparableDesc |
	componentOfStereotype := OntoUMLComponentOf new.
	association applyStereotype: componentOfStereotype.

	descriptions := (OPUmlStereotypeDescriptions for: viewModel) descriptions.
	essentialDesc := descriptions detect: [ :each | each label = 'Is Essential' ].
	inseparableDesc := descriptions detect: [ :each | each label = 'Is Inseparable' ].

	self deny: (essentialDesc accessor read: viewModel).
	self deny: (inseparableDesc accessor read: viewModel).

	essentialDesc accessor write: true to: viewModel.
	self assert: componentOfStereotype essential.
	self assert: (essentialDesc accessor read: viewModel).

	inseparableDesc accessor write: true to: viewModel.
	self assert: componentOfStereotype inseparable.
	self assert: (inseparableDesc accessor read: viewModel)
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

	self deny: (immutablePartDescription accessor read: viewModel).
	self deny: (immutableWholeDescription accessor read: viewModel).

	immutablePartDescription accessor write: true to: viewModel.
	self assert: componentOfStereotype immutablePart.
	self assert: (immutablePartDescription accessor read: viewModel).

	immutableWholeDescription accessor write: true to: viewModel.
	self assert: componentOfStereotype immutableWhole.
	self assert: (immutableWholeDescription accessor read: viewModel)
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
		self assertCollection: labels includesAll: {
			'Is Essential'.
			'Is Inseparable'.
			'Is Immutable Part'.
			'Is Immutable Whole' } ]
]

{ #category : 'tests' }
OPOntoUmlAssociationViewModelTest >> testChangingStereotypeInFormRebuildsFormWithStereotypeAttributes [
	| form stereotypeDropListBinding checkboxLabelsAfterChange |
	project models first profileApplications add:
		(OPUMLProfileApplication new appliedProfile: OntoUMLProfileFactory profile).
	form := OPPropertiesForm new.
	form viewModel: viewModel.

	stereotypeDropListBinding := form bindings detect: [ :eachBinding |
		eachBinding description isNotNil and: [ eachBinding description label = 'Stereotype' ] ].
	stereotypeDropListBinding presenter selectItem: 'MemberOf'.

	checkboxLabelsAfterChange := (form bindings
		select: [ :eachBinding | eachBinding isKindOf: OPFormCheckboxBinding ])
		collect: [ :eachBinding | eachBinding presenter label ].

	self assertCollection: checkboxLabelsAfterChange includesAll: {
		'Is Essential'.
		'Is Inseparable'.
		'Is Immutable Part'.
		'Is Immutable Whole' }
]

{ #category : 'tests' }
OPOntoUmlAssociationViewModelTest >> testCreatingMemberOfAssociationFromPaletteRebuildsFormWithStereotypeAttributes [
	| diagramController palette memberOfEntry form assocController checkboxLabels |
	project models first profileApplications add:
		(OPUMLProfileApplication new appliedProfile: OntoUMLProfileFactory profile).

	diagramController := OPUmlPackageDiagramController new.
	diagramController viewModel: (registry viewModelFor: project models first).

	palette := OPPalette new.
	diagramController initializeProfile: OntoUMLProfileFactory profile palette: palette.

	memberOfEntry := palette entries detect: [ :eachEntry | eachEntry label = 'MemberOf' ].
	self assert: memberOfEntry isNotNil.

	viewModel removeStereotypesIn: association.
	form := OPPropertiesForm new.
	form viewModel: viewModel.

	assocController := OPUmlAssociationController new.
	assocController viewModel: viewModel.

	(memberOfEntry tool instVarNamed: #onComplete) value: assocController.

	checkboxLabels := (form bindings
		select: [ :eachBinding | eachBinding isKindOf: OPFormCheckboxBinding ])
		collect: [ :eachBinding | eachBinding presenter label ].

	self assertCollection: checkboxLabels includesAll: {
		'Is Essential'.
		'Is Inseparable'.
		'Is Immutable Part'.
		'Is Immutable Whole' }
]
