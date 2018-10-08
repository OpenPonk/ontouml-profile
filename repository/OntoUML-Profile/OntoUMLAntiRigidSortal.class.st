Class {
	#name : #OntoUMLAntiRigidSortal,
	#superclass : #OntoUMLElement,
	#category : 'OntoUML-Profile-OntoUML-Profile'
}

{ #category : #'accessing - Object' }
OntoUMLAntiRigidSortal >> base_Class [
	^ (sharedGeneralizations at: #Object) base_Class
]

{ #category : #'accessing - Object' }
OntoUMLAntiRigidSortal >> base_Class: aClass [
	(sharedGeneralizations at: #Object) base_Class: aClass
]

{ #category : #initialization }
OntoUMLAntiRigidSortal >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #Sortal.
	}
]

{ #category : #initialization }
OntoUMLAntiRigidSortal >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Object put: (OntoUMLObject newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Sortal put: (OntoUMLSortal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #AntiRigidSortal put: self.
]
