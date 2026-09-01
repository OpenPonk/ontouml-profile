"
I represent an abstract OntoUML stereotype for substance sortals applied to a UML Class. I generalize rigid sortals that provide principles of identity for their instances (like Kind, Collective, and Quantity).
"
Class {
	#name : 'OntoUMLSubstanceSortal',
	#superclass : 'OntoUMLElement',
	#category : 'OpenPonk-OntoUML-Profile-Model',
	#package : 'OpenPonk-OntoUML-Profile',
	#tag : 'Model'
}

{ #category : 'accessing - Object' }
OntoUMLSubstanceSortal >> base_Class [
	^ (sharedGeneralizations at: #Object) base_Class
]

{ #category : 'accessing - Object' }
OntoUMLSubstanceSortal >> base_Class: aClass [
	(sharedGeneralizations at: #Object) base_Class: aClass
]

{ #category : 'initialization' }
OntoUMLSubstanceSortal >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #RigidSortal.
	}
]

{ #category : 'initialization' }
OntoUMLSubstanceSortal >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Object put: (OntoUMLObject newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Sortal put: (OntoUMLSortal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #RigidSortal put: (OntoUMLRigidSortal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #SubstanceSortal put: self.
]
