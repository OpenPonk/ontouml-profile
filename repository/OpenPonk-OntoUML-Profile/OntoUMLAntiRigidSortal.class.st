"
I represent the OntoUML `«antiRigidSortal»` stereotype applied to a UML Class. I model a contingent (anti-rigid) concept that carries a principle of identity, such as a Role or Phase.
"
Class {
	#name : 'OntoUMLAntiRigidSortal',
	#superclass : 'OntoUMLElement',
	#category : 'OpenPonk-OntoUML-Profile-Model',
	#package : 'OpenPonk-OntoUML-Profile',
	#tag : 'Model'
}

{ #category : 'accessing - Object' }
OntoUMLAntiRigidSortal >> base_Class [
	^ (sharedGeneralizations at: #Object) base_Class
]

{ #category : 'accessing - Object' }
OntoUMLAntiRigidSortal >> base_Class: aClass [
	(sharedGeneralizations at: #Object) base_Class: aClass
]

{ #category : 'initialization' }
OntoUMLAntiRigidSortal >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #Sortal.
	}
]

{ #category : 'initialization' }
OntoUMLAntiRigidSortal >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Object put: (OntoUMLObject newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Sortal put: (OntoUMLSortal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #AntiRigidSortal put: self.
]
