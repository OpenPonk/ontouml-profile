Class {
	#name : 'OntoUMLMode',
	#superclass : 'OntoUMLElement',
	#category : 'OpenPonk-OntoUML-Profile-Model',
	#package : 'OpenPonk-OntoUML-Profile',
	#tag : 'Model'
}

{ #category : 'accessing - Moment' }
OntoUMLMode >> base_Class [
	^ (sharedGeneralizations at: #Moment) base_Class
]

{ #category : 'accessing - Moment' }
OntoUMLMode >> base_Class: aClass [
	(sharedGeneralizations at: #Moment) base_Class: aClass
]

{ #category : 'initialization' }
OntoUMLMode >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #IntrinsicMoment.
	}
]

{ #category : 'initialization' }
OntoUMLMode >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Moment put: (OntoUMLMoment newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #IntrinsicMoment put: (OntoUMLIntrinsicMoment newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Mode put: self.
]
