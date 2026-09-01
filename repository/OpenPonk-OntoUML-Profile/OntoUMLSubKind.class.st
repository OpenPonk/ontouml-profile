"
I represent the OntoUML `«subKind»` stereotype applied to a UML Class. I model a rigid sortal that inherits its principle of identity from a specific parent Kind (e.g., Man or Woman inheriting from Person).
"
Class {
	#name : 'OntoUMLSubKind',
	#superclass : 'OntoUMLElement',
	#category : 'OpenPonk-OntoUML-Profile-Model',
	#package : 'OpenPonk-OntoUML-Profile',
	#tag : 'Model'
}

{ #category : 'accessing - Object' }
OntoUMLSubKind >> base_Class [
	^ (sharedGeneralizations at: #Object) base_Class
]

{ #category : 'accessing - Object' }
OntoUMLSubKind >> base_Class: aClass [
	(sharedGeneralizations at: #Object) base_Class: aClass
]

{ #category : 'initialization' }
OntoUMLSubKind >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #RigidSortal.
	}
]

{ #category : 'initialization' }
OntoUMLSubKind >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Object put: (OntoUMLObject newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Sortal put: (OntoUMLSortal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #RigidSortal put: (OntoUMLRigidSortal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #SubKind put: self.
]
