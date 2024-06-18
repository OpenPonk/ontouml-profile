Class {
	#name : 'OntoUMLDerivation',
	#superclass : 'OntoUMLElement',
	#category : 'OntoUML-Profile-model',
	#package : 'OntoUML-Profile',
	#tag : 'model'
}

{ #category : 'accessing - Formal' }
OntoUMLDerivation >> base_Association [
	^ (sharedGeneralizations at: #Formal) base_Association
]

{ #category : 'accessing - Formal' }
OntoUMLDerivation >> base_Association: anAssociation [
	(sharedGeneralizations at: #Formal) base_Association: anAssociation
]

{ #category : 'initialization' }
OntoUMLDerivation >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #BasicInternal.
	}
]

{ #category : 'initialization' }
OntoUMLDerivation >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Formal put: (OntoUMLFormal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #BasicInternal put: (OntoUMLBasicInternal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Derivation put: self.
]
