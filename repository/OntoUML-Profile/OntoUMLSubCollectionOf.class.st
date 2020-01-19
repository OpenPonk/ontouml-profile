Class {
	#name : #OntoUMLSubCollectionOf,
	#superclass : #OntoUMLElement,
	#category : 'OntoUML-Profile-OntoUML-Profile'
}

{ #category : #'accessing - Meronymic' }
OntoUMLSubCollectionOf >> base_Association [
	^ (sharedGeneralizations at: #Meronymic) base_Association
]

{ #category : #'accessing - Meronymic' }
OntoUMLSubCollectionOf >> base_Association: anAssociation [
	(sharedGeneralizations at: #Meronymic) base_Association: anAssociation
]

{ #category : #'accessing - Meronymic' }
OntoUMLSubCollectionOf >> essential [
	^ (sharedGeneralizations at: #Meronymic) essential
]

{ #category : #'accessing - Meronymic' }
OntoUMLSubCollectionOf >> essential: aBoolean [
	(sharedGeneralizations at: #Meronymic) essential: aBoolean
]

{ #category : #initialization }
OntoUMLSubCollectionOf >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #Meronymic.
	}
]

{ #category : #initialization }
OntoUMLSubCollectionOf >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Meronymic put: (OntoUMLMeronymic newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #SubCollectionOf put: self.
]

{ #category : #'accessing - Meronymic' }
OntoUMLSubCollectionOf >> inseparable [
	^ (sharedGeneralizations at: #Meronymic) inseparable
]

{ #category : #'accessing - Meronymic' }
OntoUMLSubCollectionOf >> inseparable: aBoolean [
	(sharedGeneralizations at: #Meronymic) inseparable: aBoolean
]
