Class {
	#name : #OntoUMLSemiRigidMixin,
	#superclass : #OntoUMLElement,
	#category : 'OntoUML-Profile-OntoUML-Profile'
}

{ #category : #'accessing - Object' }
OntoUMLSemiRigidMixin >> base_Class [
	^ (sharedGeneralizations at: #Object) base_Class
]

{ #category : #'accessing - Object' }
OntoUMLSemiRigidMixin >> base_Class: aClass [
	(sharedGeneralizations at: #Object) base_Class: aClass
]

{ #category : #initialization }
OntoUMLSemiRigidMixin >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #NonRigidMixin.
	}
]

{ #category : #initialization }
OntoUMLSemiRigidMixin >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Object put: (OntoUMLObject newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #MixinClass put: (OntoUMLMixinClass newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NonRigidMixin put: (OntoUMLNonRigidMixin newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #SemiRigidMixin put: self.
]
