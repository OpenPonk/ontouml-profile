"
I represent the OntoUML `«subQuantityOf»` stereotype applied to a UML Association. I model a meronymic (part-whole) relation between quantities (amounts of matter).
"
Class {
	#name : 'OntoUMLSubQuantityOf',
	#superclass : 'OntoUMLElement',
	#category : 'OpenPonk-OntoUML-Profile-Model',
	#package : 'OpenPonk-OntoUML-Profile',
	#tag : 'Model'
}

{ #category : 'accessing - Meronymic' }
OntoUMLSubQuantityOf >> base_Association [
	^ (sharedGeneralizations at: #Meronymic) base_Association
]

{ #category : 'accessing - Meronymic' }
OntoUMLSubQuantityOf >> base_Association: anAssociation [
	(sharedGeneralizations at: #Meronymic) base_Association: anAssociation
]

{ #category : 'accessing - Meronymic' }
OntoUMLSubQuantityOf >> essential [
	^ (sharedGeneralizations at: #Meronymic) essential
]

{ #category : 'accessing - Meronymic' }
OntoUMLSubQuantityOf >> essential: aBoolean [
	(sharedGeneralizations at: #Meronymic) essential: aBoolean
]

{ #category : 'initialization' }
OntoUMLSubQuantityOf >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #Meronymic.
	}
]

{ #category : 'initialization' }
OntoUMLSubQuantityOf >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Meronymic put: (OntoUMLMeronymic newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #SubQuantityOf put: self.
]

{ #category : 'accessing - Meronymic' }
OntoUMLSubQuantityOf >> inseparable [
	^ (sharedGeneralizations at: #Meronymic) inseparable
]

{ #category : 'accessing - Meronymic' }
OntoUMLSubQuantityOf >> inseparable: aBoolean [
	(sharedGeneralizations at: #Meronymic) inseparable: aBoolean
]
