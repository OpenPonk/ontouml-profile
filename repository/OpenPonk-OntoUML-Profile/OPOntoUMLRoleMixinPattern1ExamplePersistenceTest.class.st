"
I am an integration test class verifying that the OntoUML RoleMixin pattern example model survives roundtrip serialization (save and load) without data loss or corruption.
"
Class {
	#name : 'OPOntoUMLRoleMixinPattern1ExamplePersistenceTest',
	#superclass : 'OPExamplePersistenceTest',
	#category : 'OpenPonk-OntoUML-Profile-Tests',
	#package : 'OpenPonk-OntoUML-Profile',
	#tag : 'Tests'
}

{ #category : 'hooks' }
OPOntoUMLRoleMixinPattern1ExamplePersistenceTest >> createExampleModel [

	^ OntoUMLExamples exampleRoleMixinPattern1
]
