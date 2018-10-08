Class {
	#name : #OntoUMLSubQuantityOf,
	#superclass : #OntoUMLElement,
	#category : 'OntoUML-Profile-OntoUML-Profile'
}

{ #category : #'accessing - Meronymic' }
OntoUMLSubQuantityOf >> base_Association [
	^ (sharedGeneralizations at: #Meronymic) base_Association
]

{ #category : #'accessing - Meronymic' }
OntoUMLSubQuantityOf >> base_Association: anAssociation [
	(sharedGeneralizations at: #Meronymic) base_Association: anAssociation
]

{ #category : #'accessing - Meronymic' }
OntoUMLSubQuantityOf >> essential [
	^ (sharedGeneralizations at: #Meronymic) essential
]

{ #category : #'accessing - Meronymic' }
OntoUMLSubQuantityOf >> essential: aBoolean [
	(sharedGeneralizations at: #Meronymic) essential: aBoolean
]

{ #category : #initialization }
OntoUMLSubQuantityOf >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #Meronymic.
	}
]

{ #category : #initialization }
OntoUMLSubQuantityOf >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Meronymic put: (OntoUMLMeronymic newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #SubQuantityOf put: self.
]

{ #category : #'accessing - Meronymic' }
OntoUMLSubQuantityOf >> inseparable [
	^ (sharedGeneralizations at: #Meronymic) inseparable
]

{ #category : #'accessing - Meronymic' }
OntoUMLSubQuantityOf >> inseparable: aBoolean [
	(sharedGeneralizations at: #Meronymic) inseparable: aBoolean
]
