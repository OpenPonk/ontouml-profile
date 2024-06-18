Class {
	#name : 'OntoUMLPhase',
	#superclass : 'OntoUMLElement',
	#category : 'OntoUML-Profile-model',
	#package : 'OntoUML-Profile',
	#tag : 'model'
}

{ #category : 'accessing - Object' }
OntoUMLPhase >> base_Class [
	^ (sharedGeneralizations at: #Object) base_Class
]

{ #category : 'accessing - Object' }
OntoUMLPhase >> base_Class: aClass [
	(sharedGeneralizations at: #Object) base_Class: aClass
]

{ #category : 'initialization' }
OntoUMLPhase >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #AntiRigidSortal.
	}
]

{ #category : 'initialization' }
OntoUMLPhase >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Object put: (OntoUMLObject newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Sortal put: (OntoUMLSortal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #AntiRigidSortal put: (OntoUMLAntiRigidSortal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Phase put: self.
]
