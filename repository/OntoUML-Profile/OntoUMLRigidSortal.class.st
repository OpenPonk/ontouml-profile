Class {
	#name : #OntoUMLRigidSortal,
	#superclass : #OntoUMLElement,
	#category : #'OntoUML-Profile-model'
}

{ #category : #'accessing - Object' }
OntoUMLRigidSortal >> base_Class [
	^ (sharedGeneralizations at: #Object) base_Class
]

{ #category : #'accessing - Object' }
OntoUMLRigidSortal >> base_Class: aClass [
	(sharedGeneralizations at: #Object) base_Class: aClass
]

{ #category : #initialization }
OntoUMLRigidSortal >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #Sortal.
	}
]

{ #category : #initialization }
OntoUMLRigidSortal >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Object put: (OntoUMLObject newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Sortal put: (OntoUMLSortal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #RigidSortal put: self.
]
