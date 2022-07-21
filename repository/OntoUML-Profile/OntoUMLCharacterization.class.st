Class {
	#name : #OntoUMLCharacterization,
	#superclass : #OntoUMLElement,
	#category : #'OntoUML-Profile-model'
}

{ #category : #'accessing - Formal' }
OntoUMLCharacterization >> base_Association [
	^ (sharedGeneralizations at: #Formal) base_Association
]

{ #category : #'accessing - Formal' }
OntoUMLCharacterization >> base_Association: anAssociation [
	(sharedGeneralizations at: #Formal) base_Association: anAssociation
]

{ #category : #initialization }
OntoUMLCharacterization >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #BasicInternal.
	}
]

{ #category : #initialization }
OntoUMLCharacterization >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Formal put: (OntoUMLFormal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #BasicInternal put: (OntoUMLBasicInternal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Characterization put: self.
]
