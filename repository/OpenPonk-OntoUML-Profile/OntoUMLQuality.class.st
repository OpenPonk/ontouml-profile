Class {
	#name : 'OntoUMLQuality',
	#superclass : 'OntoUMLElement',
	#category : 'OpenPonk-OntoUML-Profile-Model',
	#package : 'OpenPonk-OntoUML-Profile',
	#tag : 'Model'
}

{ #category : 'accessing - Moment' }
OntoUMLQuality >> base_Class [
	^ (sharedGeneralizations at: #Moment) base_Class
]

{ #category : 'accessing - Moment' }
OntoUMLQuality >> base_Class: aClass [
	(sharedGeneralizations at: #Moment) base_Class: aClass
]

{ #category : 'initialization' }
OntoUMLQuality >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #IntrinsicMoment.
	}
]

{ #category : 'initialization' }
OntoUMLQuality >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Moment put: (OntoUMLMoment newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #IntrinsicMoment put: (OntoUMLIntrinsicMoment newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Quality put: self.
]
