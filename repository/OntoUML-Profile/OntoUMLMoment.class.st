Class {
	#name : #OntoUMLMoment,
	#superclass : #OntoUMLElement,
	#instVars : [
		'base_Class'
	],
	#category : 'OntoUML-Profile-OntoUML-Profile'
}

{ #category : #accessing }
OntoUMLMoment >> base_Class [
	""
	^ base_Class
]

{ #category : #accessing }
OntoUMLMoment >> base_Class: aClass [
	""
	|anOldBase_Class|
	anOldBase_Class := base_Class.
	base_Class := aClass.
	OPUMLToOneLink
		on: self identity
		thisSelector: #base_Class
		otherSelector: #extension_Moment
		from: anOldBase_Class
		to: base_Class
]

{ #category : #initialization }
OntoUMLMoment >> initializeDirectGeneralizations [
	directGeneralizations := {
	}
]

{ #category : #initialization }
OntoUMLMoment >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Moment put: self.
]
