"
I represent the OntoUML `«formal»` stereotype applied to a UML Association. I model a formal relation that holds directly between entities without requiring an intervening truth-maker (relator).
"
Class {
	#name : 'OntoUMLFormal',
	#superclass : 'OntoUMLElement',
	#instVars : [
		'base_Association'
	],
	#category : 'OpenPonk-OntoUML-Profile-Model',
	#package : 'OpenPonk-OntoUML-Profile',
	#tag : 'Model'
}

{ #category : 'accessing' }
OntoUMLFormal >> base_Association [
	""
	^ base_Association
]

{ #category : 'accessing' }
OntoUMLFormal >> base_Association: anAssociation [
	""
	|anOldBase_Association|
	anOldBase_Association := base_Association.
	base_Association := anAssociation.
	OPUMLToOneLink
		on: self identity
		thisSelector: #base_Association
		otherSelector: #extension_Formal
		from: anOldBase_Association
		to: base_Association
]

{ #category : 'initialization' }
OntoUMLFormal >> initializeDirectGeneralizations [
	directGeneralizations := {
	}
]

{ #category : 'initialization' }
OntoUMLFormal >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Formal put: self.
]
