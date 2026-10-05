"
Verifies notation-specific default style resolution for OntoUML classes and stereotypes, ensuring ontological color semantics are respected while local style overrides remain functional.
"
Class {
	#name : 'OPOntoUmlDiagramStyleTest',
	#superclass : 'TestCase',
	#instVars : [
		'ontoModel',
		'diagram',
		'shape',
		'umlClass'
	],
	#category : 'OpenPonk-OntoUML-Plugin-Tests',
	#package : 'OpenPonk-OntoUML-Plugin',
	#tag : 'Tests'
}

{ #category : 'running' }
OPOntoUmlDiagramStyleTest >> setUp [
	super setUp.
	ontoModel := OntoUMLPlugin new newModel.
	diagram := OPOpenPonkDiagram forModelElement: ontoModel.
	umlClass := OPUMLClass new.
	umlClass applyStereotype: OntoUMLKind new.
	shape := OPUmlClassShape in: diagram forModelElement: umlClass
]

{ #category : 'running' }
OPOntoUmlDiagramStyleTest >> tearDown [
	shape := nil.
	umlClass := nil.
	diagram := nil.
	ontoModel := nil.
	super tearDown
]

{ #category : 'tests' }
OPOntoUmlDiagramStyleTest >> testCollectiveClassHasDefaultMintFillColor [
	| collectiveClass collectiveShape |
	collectiveClass := OPUMLClass new.
	collectiveClass applyStereotype: OntoUMLCollective new.
	collectiveShape := OPUmlClassShape in: diagram forModelElement: collectiveClass.
	self assert: collectiveShape fillColor equals: (Color fromHexString: 'D6FCEB')
]

{ #category : 'tests' }
OPOntoUmlDiagramStyleTest >> testEnumerationHasDefaultSlateColor [
	| sheet |
	sheet := OntoUMLPlugin new defaultStyleSheet.
	self assert: ((sheet ruleForType: 'Enumeration') at: #fillColor) equals: (Color fromHexString: 'DCE5EC')
]

{ #category : 'tests' }
OPOntoUmlDiagramStyleTest >> testKindClassHasDefaultGreenFillColor [
	self assert: shape fillColor equals: Color paleGreen
]

{ #category : 'tests' }
OPOntoUmlDiagramStyleTest >> testLocalOverrideTakesPrecedenceOverDefaultTypeColor [
	shape fillColor: Color blue.
	self assert: shape fillColor equals: Color blue.
	shape removeLocalStylePropertyNamed: #fillColor.
	self assert: shape fillColor equals: Color paleGreen
]

{ #category : 'tests' }
OPOntoUmlDiagramStyleTest >> testPhaseClassHasDefaultOrangeFillColor [
	| phaseClass phaseShape |
	phaseClass := OPUMLClass new.
	phaseClass applyStereotype: OntoUMLPhase new.
	phaseShape := OPUmlClassShape in: diagram forModelElement: phaseClass.
	self assert: phaseShape fillColor equals: Color paleOrange
]

{ #category : 'tests' }
OPOntoUmlDiagramStyleTest >> testRelatorClassHasDefaultCyanFillColor [
	| relatorClass relatorShape |
	relatorClass := OPUMLClass new.
	relatorClass applyStereotype: OntoUMLRelator new.
	relatorShape := OPUmlClassShape in: diagram forModelElement: relatorClass.
	self assert: relatorShape fillColor equals: Color paleBlue
]

{ #category : 'tests' }
OPOntoUmlDiagramStyleTest >> testRoleClassHasDefaultYellowFillColor [
	| roleClass roleShape |
	roleClass := OPUMLClass new.
	roleClass applyStereotype: OntoUMLRole new.
	roleShape := OPUmlClassShape in: diagram forModelElement: roleClass.
	self assert: roleShape fillColor equals: Color paleYellow
]

{ #category : 'tests' }
OPOntoUmlDiagramStyleTest >> testRoleMixinClassHasDefaultRedFillColor [
	| roleMixinClass roleMixinShape |
	roleMixinClass := OPUMLClass new.
	roleMixinClass applyStereotype: OntoUMLRoleMixin new.
	roleMixinShape := OPUmlClassShape in: diagram forModelElement: roleMixinClass.
	self assert: roleMixinShape fillColor equals: Color paleRed
]
