Class {
	#name : #OntoUMLMemberOf,
	#superclass : #OntoUMLElement,
	#category : #'OntoUML-Profile-model'
}

{ #category : #'accessing - Meronymic' }
OntoUMLMemberOf >> base_Association [
	^ (sharedGeneralizations at: #Meronymic) base_Association
]

{ #category : #'accessing - Meronymic' }
OntoUMLMemberOf >> base_Association: anAssociation [
	(sharedGeneralizations at: #Meronymic) base_Association: anAssociation
]

{ #category : #'accessing - Meronymic' }
OntoUMLMemberOf >> essential [
	^ (sharedGeneralizations at: #Meronymic) essential
]

{ #category : #'accessing - Meronymic' }
OntoUMLMemberOf >> essential: aBoolean [
	(sharedGeneralizations at: #Meronymic) essential: aBoolean
]

{ #category : #initialization }
OntoUMLMemberOf >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #Meronymic.
	}
]

{ #category : #initialization }
OntoUMLMemberOf >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Meronymic put: (OntoUMLMeronymic newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #MemberOf put: self.
]

{ #category : #'accessing - Meronymic' }
OntoUMLMemberOf >> inseparable [
	^ (sharedGeneralizations at: #Meronymic) inseparable
]

{ #category : #'accessing - Meronymic' }
OntoUMLMemberOf >> inseparable: aBoolean [
	(sharedGeneralizations at: #Meronymic) inseparable: aBoolean
]
