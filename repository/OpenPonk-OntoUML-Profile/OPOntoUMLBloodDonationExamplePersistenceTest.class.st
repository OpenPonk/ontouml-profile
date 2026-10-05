"
Verifies persistence roundtrip of the comprehensive OntoUML Blood Donation example model.
"
Class {
	#name : 'OPOntoUMLBloodDonationExamplePersistenceTest',
	#superclass : 'OPExamplePersistenceTest',
	#category : 'OpenPonk-OntoUML-Profile-Tests',
	#package : 'OpenPonk-OntoUML-Profile',
	#tag : 'Tests'
}

{ #category : 'hooks' }
OPOntoUMLBloodDonationExamplePersistenceTest >> createExampleModel [
	^ OntoUMLExamples exampleBloodDonation
]
