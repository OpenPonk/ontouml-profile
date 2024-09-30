Class {
	#name : 'OntoUMLFormal',
	#superclass : 'OntoUMLElement',
	#instVars : [
		'base_Association'
	],
	#category : 'OntoUML-Profile-Model',
	#package : 'OntoUML-Profile',
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
