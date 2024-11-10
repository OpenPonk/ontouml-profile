Class {
	#name : 'OntoUMLMeronymic',
	#superclass : 'OntoUMLElement',
	#instVars : [
		'base_Association',
		'essential',
		'inseparable'
	],
	#category : 'OpenPonk-OntoUML-Profile-Model',
	#package : 'OpenPonk-OntoUML-Profile',
	#tag : 'Model'
}

{ #category : 'accessing' }
OntoUMLMeronymic >> base_Association [
	""
	^ base_Association
]

{ #category : 'accessing' }
OntoUMLMeronymic >> base_Association: anAssociation [
	""
	|anOldBase_Association|
	anOldBase_Association := base_Association.
	base_Association := anAssociation.
	OPUMLToOneLink
		on: self identity
		thisSelector: #base_Association
		otherSelector: #extension_Meronymic
		from: anOldBase_Association
		to: base_Association
]

{ #category : 'accessing' }
OntoUMLMeronymic >> essential [
	""
	^ essential ifNil: [ essential := false ]
]

{ #category : 'accessing' }
OntoUMLMeronymic >> essential: aBoolean [
	""
	essential := aBoolean
]

{ #category : 'initialization' }
OntoUMLMeronymic >> initializeDirectGeneralizations [
	directGeneralizations := {
	}
]

{ #category : 'initialization' }
OntoUMLMeronymic >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Meronymic put: self.
]

{ #category : 'accessing' }
OntoUMLMeronymic >> inseparable [
	""
	^ inseparable ifNil: [ inseparable := false ]
]

{ #category : 'accessing' }
OntoUMLMeronymic >> inseparable: aBoolean [
	""
	inseparable := aBoolean
]
