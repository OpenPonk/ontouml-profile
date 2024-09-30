Class {
	#name : 'OntoUMLRelator',
	#superclass : 'OntoUMLElement',
	#category : 'OntoUML-Profile-Model',
	#package : 'OntoUML-Profile',
	#tag : 'Model'
}

{ #category : 'accessing - Moment' }
OntoUMLRelator >> base_Class [
	^ (sharedGeneralizations at: #Moment) base_Class
]

{ #category : 'accessing - Moment' }
OntoUMLRelator >> base_Class: aClass [
	(sharedGeneralizations at: #Moment) base_Class: aClass
]

{ #category : 'initialization' }
OntoUMLRelator >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #Moment.
	}
]

{ #category : 'initialization' }
OntoUMLRelator >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Moment put: (OntoUMLMoment newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Relator put: self.
]
