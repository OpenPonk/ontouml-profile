Class {
	#name : 'OntoUMLComponentOf',
	#superclass : 'OntoUMLElement',
	#category : 'OntoUML-Profile-model',
	#package : 'OntoUML-Profile',
	#tag : 'model'
}

{ #category : 'accessing - Meronymic' }
OntoUMLComponentOf >> base_Association [
	^ (sharedGeneralizations at: #Meronymic) base_Association
]

{ #category : 'accessing - Meronymic' }
OntoUMLComponentOf >> base_Association: anAssociation [
	(sharedGeneralizations at: #Meronymic) base_Association: anAssociation
]

{ #category : 'accessing - Meronymic' }
OntoUMLComponentOf >> essential [
	^ (sharedGeneralizations at: #Meronymic) essential
]

{ #category : 'accessing - Meronymic' }
OntoUMLComponentOf >> essential: aBoolean [
	(sharedGeneralizations at: #Meronymic) essential: aBoolean
]

{ #category : 'initialization' }
OntoUMLComponentOf >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #Meronymic.
	}
]

{ #category : 'initialization' }
OntoUMLComponentOf >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Meronymic put: (OntoUMLMeronymic newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #ComponentOf put: self.
]

{ #category : 'accessing - Meronymic' }
OntoUMLComponentOf >> inseparable [
	^ (sharedGeneralizations at: #Meronymic) inseparable
]

{ #category : 'accessing - Meronymic' }
OntoUMLComponentOf >> inseparable: aBoolean [
	(sharedGeneralizations at: #Meronymic) inseparable: aBoolean
]
