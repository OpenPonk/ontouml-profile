"
Verifies persistence roundtrip of the comprehensive OntoUML Blood Donation example model.
"
Class {
	#name : 'OPOntoUMLBloodDonationExamplePersistenceTest',
	#superclass : 'OPExamplePersistenceTest',
	#category : 'OpenPonk-OntoUML-Profile-Tests-Examples',
	#package : 'OpenPonk-OntoUML-Profile-Tests',
	#tag : 'Examples'
}

{ #category : 'hooks' }
OPOntoUMLBloodDonationExamplePersistenceTest >> createExampleModel [
	^ OntoUMLExamples exampleBloodDonation
]
