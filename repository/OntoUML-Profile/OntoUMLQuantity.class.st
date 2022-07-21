Class {
	#name : #OntoUMLQuantity,
	#superclass : #OntoUMLElement,
	#category : #'OntoUML-Profile-model'
}

{ #category : #'accessing - Object' }
OntoUMLQuantity >> base_Class [
	^ (sharedGeneralizations at: #Object) base_Class
]

{ #category : #'accessing - Object' }
OntoUMLQuantity >> base_Class: aClass [
	(sharedGeneralizations at: #Object) base_Class: aClass
]

{ #category : #initialization }
OntoUMLQuantity >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #SubstanceSortal.
	}
]

{ #category : #initialization }
OntoUMLQuantity >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Object put: (OntoUMLObject newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Sortal put: (OntoUMLSortal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #RigidSortal put: (OntoUMLRigidSortal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #SubstanceSortal put: (OntoUMLSubstanceSortal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Quantity put: self.
]
