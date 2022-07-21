Class {
	#name : #OntoUMLKind,
	#superclass : #OntoUMLElement,
	#category : #'OntoUML-Profile-model'
}

{ #category : #'accessing - Object' }
OntoUMLKind >> base_Class [
	^ (sharedGeneralizations at: #Object) base_Class
]

{ #category : #'accessing - Object' }
OntoUMLKind >> base_Class: aClass [
	(sharedGeneralizations at: #Object) base_Class: aClass
]

{ #category : #initialization }
OntoUMLKind >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #SubstanceSortal.
	}
]

{ #category : #initialization }
OntoUMLKind >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Object put: (OntoUMLObject newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Sortal put: (OntoUMLSortal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #RigidSortal put: (OntoUMLRigidSortal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #SubstanceSortal put: (OntoUMLSubstanceSortal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Kind put: self.
]
