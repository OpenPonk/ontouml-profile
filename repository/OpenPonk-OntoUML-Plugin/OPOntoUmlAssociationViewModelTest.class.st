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
