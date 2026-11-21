"
Verifies construction and profile application of bundled OntoUML example models.
"
Class {
	#name : 'OntoUMLExamplesTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-OntoUML-Profile-Tests-Examples',
	#package : 'OpenPonk-OntoUML-Profile-Tests',
	#tag : 'Examples'
}

{ #category : 'tests' }
OntoUMLExamplesTest >> testEmptyModelCreatesNamedPackageWithOntoUMLProfile [

	| model |
	model := OntoUMLExamples emptyModel.
	self assert: model class identicalTo: OPUMLPackage.
	self assert: model name equals: 'OntoUML Model'.
	self assertEmpty: model packagedElements.
	self assertCollection: (model profileApplications collect: [ :each | each appliedProfile name ]) hasSameElements: { 'OntoUML' }
]
