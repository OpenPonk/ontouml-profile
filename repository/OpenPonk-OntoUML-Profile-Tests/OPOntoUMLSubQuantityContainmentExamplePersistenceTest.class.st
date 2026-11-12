"
I am an integration test class verifying that the OntoUML SubQuantity Containment pattern example model survives roundtrip serialization (save and load) without data loss or corruption.
"
Class {
	#name : 'OPOntoUMLSubQuantityContainmentExamplePersistenceTest',
	#superclass : 'OPExamplePersistenceTest',
	#category : 'OpenPonk-OntoUML-Profile-Tests-Examples',
	#package : 'OpenPonk-OntoUML-Profile-Tests',
	#tag : 'Examples'
}

{ #category : 'hooks' }
OPOntoUMLSubQuantityContainmentExamplePersistenceTest >> createExampleModel [

	^ OntoUMLExamples exampleAlcohol
]
