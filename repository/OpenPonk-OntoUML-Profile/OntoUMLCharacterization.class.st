"
I represent the OntoUML `«characterization»` stereotype applied to a UML Association. I model the existential dependence relationship between an IntrinsicMoment (like a Quality or Mode) and its bearer.
"
Class {
	#name : 'OntoUMLCharacterization',
	#superclass : 'OntoUMLElement',
	#category : 'OpenPonk-OntoUML-Profile-Model',
	#package : 'OpenPonk-OntoUML-Profile',
	#tag : 'Model'
}

{ #category : 'accessing - Formal' }
OntoUMLCharacterization >> base_Association [
	^ (sharedGeneralizations at: #Formal) base_Association
]

{ #category : 'accessing - Formal' }
OntoUMLCharacterization >> base_Association: anAssociation [
	(sharedGeneralizations at: #Formal) base_Association: anAssociation
]

{ #category : 'initialization' }
OntoUMLCharacterization >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #BasicInternal.
	}
]

{ #category : 'initialization' }
OntoUMLCharacterization >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Formal put: (OntoUMLFormal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #BasicInternal put: (OntoUMLBasicInternal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Characterization put: self.
]
