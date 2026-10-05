"
Verifies that user-configured style overrides registered in notation style settings take precedence over built-in default notation styles.
"
Class {
	#name : 'OPOntoUmlUserStyleOverrideTest',
	#superclass : 'TestCase',
	#instVars : [
		'ontoPlugin',
		'ontoModel',
		'diagram',
		'umlClass',
		'shape'
	],
	#category : 'OpenPonk-OntoUML-Plugin-Tests',
	#package : 'OpenPonk-OntoUML-Plugin',
	#tag : 'Tests'
}

{ #category : 'running' }
OPOntoUmlUserStyleOverrideTest >> setUp [
	super setUp.
	OPNotationStyleRegistry resetDefault.
	ontoPlugin := OntoUMLPlugin new.
	OPNotationStyleRegistry default
		atPlugin: ontoPlugin
		type: 'Kind'
		set: #fillColor
		to: Color red.
	ontoModel := ontoPlugin newModel.
	diagram := OPOpenPonkDiagram forModelElement: ontoModel.
	umlClass := OPUMLClass new.
	umlClass applyStereotype: OntoUMLKind new.
	shape := OPUmlClassShape in: diagram forModelElement: umlClass
]

{ #category : 'running' }
OPOntoUmlUserStyleOverrideTest >> tearDown [
	OPNotationStyleRegistry resetDefault.
	shape := nil.
	umlClass := nil.
	diagram := nil.
	ontoModel := nil.
	ontoPlugin := nil.
	super tearDown
]

{ #category : 'tests' }
OPOntoUmlUserStyleOverrideTest >> testUserOverrideTakesPrecedenceOverBuiltInDefault [
	"User override (Color red) must override NEMO default pastel green for Kind"
	self assert: shape fillColor equals: Color red
]
