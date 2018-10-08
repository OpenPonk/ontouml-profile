Class {
	#name : #OntoUMLIntrinsicMoment,
	#superclass : #OntoUMLElement,
	#category : 'OntoUML-Profile-OntoUML-Profile'
}

{ #category : #'accessing - Moment' }
OntoUMLIntrinsicMoment >> base_Class [
	^ (sharedGeneralizations at: #Moment) base_Class
]

{ #category : #'accessing - Moment' }
OntoUMLIntrinsicMoment >> base_Class: aClass [
	(sharedGeneralizations at: #Moment) base_Class: aClass
]

{ #category : #initialization }
OntoUMLIntrinsicMoment >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #Moment.
	}
]

{ #category : #initialization }
OntoUMLIntrinsicMoment >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Moment put: (OntoUMLMoment newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #IntrinsicMoment put: self.
]
