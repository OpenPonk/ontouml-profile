Extension { #name : #OPUMLAssociation }

{ #category : #'*OntoUML-Profile' }
OPUMLAssociation >> extension_Formal [
	^ self tagAt: #extension_Formal ifAbsent: [ nil ]
]

{ #category : #'*OntoUML-Profile' }
OPUMLAssociation >> extension_Formal: aFormal [
	| oldFormal |
	oldFormal := self extension_Formal.
	self tagAt: #extension_Formal put: aFormal.
	OPUMLToOneLink
		on: self
		thisSelector: #extension_Formal
		otherSelector: #base_Association
		updateFrom: oldFormal
		to: aFormal
]

{ #category : #'*OntoUML-Profile' }
OPUMLAssociation >> extension_Material [
	^ self tagAt: #extension_Material ifAbsent: [ nil ]
]

{ #category : #'*OntoUML-Profile' }
OPUMLAssociation >> extension_Material: aMaterial [
	| oldMaterial |
	oldMaterial := self extension_Material.
	self tagAt: #extension_Material put: aMaterial.
	OPUMLToOneLink
		on: self
		thisSelector: #extension_Material
		otherSelector: #base_Association
		updateFrom: oldMaterial
		to: aMaterial
]

{ #category : #'*OntoUML-Profile' }
OPUMLAssociation >> extension_Meronymic [
		^ self tagAt: #extension_Meronymic ifAbsent: [ nil ]
]

{ #category : #'*OntoUML-Profile' }
OPUMLAssociation >> extension_Meronymic: aMeronymic [
	| oldMeronymic |
	oldMeronymic := self extension_Meronymic.
	self tagAt: #extension_Meronymic put: aMeronymic.
	OPUMLToOneLink
		on: self
		thisSelector: #extension_Meronymic
		otherSelector: #base_Association
		updateFrom: oldMeronymic
		to: aMeronymic
]
