Class {
	#name : #OntoUMLObject,
	#superclass : #OntoUMLElement,
	#instVars : [
		'base_Class'
	],
	#category : 'OntoUML-Profile-OntoUML-Profile'
}

{ #category : #accessing }
OntoUMLObject >> base_Class [
	""
	^ base_Class
]

{ #category : #accessing }
OntoUMLObject >> base_Class: aClass [
	""
	|anOldBase_Class|
	anOldBase_Class := base_Class.
	base_Class := aClass.
	OPUMLToOneLink
		on: self identity
		thisSelector: #base_Class
		otherSelector: #extension_Object
		from: anOldBase_Class
		to: base_Class
]

{ #category : #initialization }
OntoUMLObject >> initializeDirectGeneralizations [
	directGeneralizations := {
	}
]

{ #category : #initialization }
OntoUMLObject >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Object put: self.
]
