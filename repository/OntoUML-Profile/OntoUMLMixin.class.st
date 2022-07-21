Class {
	#name : #OntoUMLMixin,
	#superclass : #OntoUMLElement,
	#category : #'OntoUML-Profile-model'
}

{ #category : #'accessing - Object' }
OntoUMLMixin >> base_Class [
	^ (sharedGeneralizations at: #Object) base_Class
]

{ #category : #'accessing - Object' }
OntoUMLMixin >> base_Class: aClass [
	(sharedGeneralizations at: #Object) base_Class: aClass
]

{ #category : #initialization }
OntoUMLMixin >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #SemiRigidMixin.
	}
]

{ #category : #initialization }
OntoUMLMixin >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Object put: (OntoUMLObject newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #MixinClass put: (OntoUMLMixinClass newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NonRigidMixin put: (OntoUMLNonRigidMixin newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #SemiRigidMixin put: (OntoUMLSemiRigidMixin newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Mixin put: self.
]
