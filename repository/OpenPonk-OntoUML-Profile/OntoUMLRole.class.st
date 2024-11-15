Class {
	#name : 'OntoUMLRole',
	#superclass : 'OntoUMLElement',
	#category : 'OpenPonk-OntoUML-Profile-Model',
	#package : 'OpenPonk-OntoUML-Profile',
	#tag : 'Model'
}

{ #category : 'accessing - Object' }
OntoUMLRole >> base_Class [
	^ (sharedGeneralizations at: #Object) base_Class
]

{ #category : 'accessing - Object' }
OntoUMLRole >> base_Class: aClass [
	(sharedGeneralizations at: #Object) base_Class: aClass
]

{ #category : 'initialization' }
OntoUMLRole >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #AntiRigidSortal.
	}
]

{ #category : 'initialization' }
OntoUMLRole >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Object put: (OntoUMLObject newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Sortal put: (OntoUMLSortal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #AntiRigidSortal put: (OntoUMLAntiRigidSortal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Role put: self.
]