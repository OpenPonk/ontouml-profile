Class {
	#name : #OntoUMLDomainFormal,
	#superclass : #OntoUMLElement,
	#category : 'OntoUML-Profile-OntoUML-Profile'
}

{ #category : #'accessing - Formal' }
OntoUMLDomainFormal >> base_Association [
	^ (sharedGeneralizations at: #Formal) base_Association
]

{ #category : #'accessing - Formal' }
OntoUMLDomainFormal >> base_Association: anAssociation [
	(sharedGeneralizations at: #Formal) base_Association: anAssociation
]

{ #category : #initialization }
OntoUMLDomainFormal >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #Formal.
	}
]

{ #category : #initialization }
OntoUMLDomainFormal >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Formal put: (OntoUMLFormal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #DomainFormal put: self.
]
