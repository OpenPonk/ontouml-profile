Extension { #name : 'OPUMLClass' }

{ #category : '*OpenPonk-OntoUML-Profile' }
OPUMLClass >> extension_Moment [
	^ self tagAt: #extension_Moment ifAbsent: [ nil ]
]

{ #category : '*OpenPonk-OntoUML-Profile' }
OPUMLClass >> extension_Moment: aMoment [
	| oldMoment |
	oldMoment := self extension_Moment.
	self tagAt: #extension_Moment put: aMoment.
	OPUMLToOneLink
		on: self
		thisSelector: #extension_Moment
		otherSelector: #base_Class
		updateFrom: oldMoment
		to: aMoment
]

{ #category : '*OpenPonk-OntoUML-Profile' }
OPUMLClass >> extension_Object [
		^ self tagAt: #extension_Object ifAbsent: [ nil ]
]

{ #category : '*OpenPonk-OntoUML-Profile' }
OPUMLClass >> extension_Object: aObject [
	| oldObject |
	oldObject := self extension_Object.
	self tagAt: #extension_Object put: aObject.
	OPUMLToOneLink
		on: self
		thisSelector: #extension_Object
		otherSelector: #base_Class
		updateFrom: oldObject
		to: aObject
]
