Class {
	#name : 'OntoUMLSortal',
	#superclass : 'OntoUMLElement',
	#category : 'OntoUML-Profile-model',
	#package : 'OntoUML-Profile',
	#tag : 'model'
}

{ #category : 'accessing - Object' }
OntoUMLSortal >> base_Class [
	^ (sharedGeneralizations at: #Object) base_Class
]

{ #category : 'accessing - Object' }
OntoUMLSortal >> base_Class: aClass [
	(sharedGeneralizations at: #Object) base_Class: aClass
]

{ #category : 'initialization' }
OntoUMLSortal >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #Object.
	}
]

{ #category : 'initialization' }
OntoUMLSortal >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Object put: (OntoUMLObject newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Sortal put: self.
]
