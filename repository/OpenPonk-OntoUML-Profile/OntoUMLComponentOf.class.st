"
I represent the OntoUML `«componentOf»` stereotype applied to a UML Association. I model a specific type of meronymic (part-whole) relation where a functional component is part of a complex system. I track whether the relation is essential or inseparable.
"
Class {
	#name : 'OntoUMLComponentOf',
	#superclass : 'OntoUMLElement',
	#category : 'OpenPonk-OntoUML-Profile-Model',
	#package : 'OpenPonk-OntoUML-Profile',
	#tag : 'Model'
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
