"
I am an integration test class verifying that the OntoUML SubQuantity Containment pattern example model survives roundtrip serialization (save and load) without data loss or corruption.
"
Class {
	#name : 'OPOntoUMLSubQuantityContainmentExamplePersistenceTest',
	#superclass : 'OPExamplePersistenceTest',
	#category : 'OpenPonk-OntoUML-Profile-Tests',
	#package : 'OpenPonk-OntoUML-Profile',
	#tag : 'Tests'
}

{ #category : 'hooks' }
OPOntoUMLSubQuantityContainmentExamplePersistenceTest >> createExampleModel [

	^ OntoUMLExamples exampleSubQuantityContainment
]
