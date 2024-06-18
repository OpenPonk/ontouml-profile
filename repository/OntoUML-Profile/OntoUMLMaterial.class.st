Class {
	#name : 'OntoUMLMaterial',
	#superclass : 'OntoUMLElement',
	#instVars : [
		'base_Association'
	],
	#category : 'OntoUML-Profile-model',
	#package : 'OntoUML-Profile',
	#tag : 'model'
}

{ #category : 'accessing' }
OntoUMLMaterial >> base_Association [
	""
	^ base_Association
]

{ #category : 'accessing' }
OntoUMLMaterial >> base_Association: anAssociation [
	""
	|anOldBase_Association|
	anOldBase_Association := base_Association.
	base_Association := anAssociation.
	OPUMLToOneLink
		on: self identity
		thisSelector: #base_Association
		otherSelector: #extension_Material
		from: anOldBase_Association
		to: base_Association
]

{ #category : 'initialization' }
OntoUMLMaterial >> initializeDirectGeneralizations [
	directGeneralizations := {
	}
]

{ #category : 'initialization' }
OntoUMLMaterial >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Material put: self.
]
