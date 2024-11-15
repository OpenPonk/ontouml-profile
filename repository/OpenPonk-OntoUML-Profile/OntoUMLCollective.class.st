Class {
	#name : 'OntoUMLCollective',
	#superclass : 'OntoUMLElement',
	#category : 'OpenPonk-OntoUML-Profile-Model',
	#package : 'OpenPonk-OntoUML-Profile',
	#tag : 'Model'
}

{ #category : 'accessing - Object' }
OntoUMLCollective >> base_Class [
	^ (sharedGeneralizations at: #Object) base_Class
]

{ #category : 'accessing - Object' }
OntoUMLCollective >> base_Class: aClass [
	(sharedGeneralizations at: #Object) base_Class: aClass
]

{ #category : 'initialization' }
OntoUMLCollective >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #SubstanceSortal.
	}
]

{ #category : 'initialization' }
OntoUMLCollective >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Object put: (OntoUMLObject newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Sortal put: (OntoUMLSortal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #RigidSortal put: (OntoUMLRigidSortal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #SubstanceSortal put: (OntoUMLSubstanceSortal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Collective put: self.
]
