Class {
	#name : #OntoUMLCategory,
	#superclass : #OntoUMLElement,
	#category : #'OntoUML-Profile-model'
}

{ #category : #'accessing - Object' }
OntoUMLCategory >> base_Class [
	^ (sharedGeneralizations at: #Object) base_Class
]

{ #category : #'accessing - Object' }
OntoUMLCategory >> base_Class: aClass [
	(sharedGeneralizations at: #Object) base_Class: aClass
]

{ #category : #initialization }
OntoUMLCategory >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #RigidMixin.
	}
]

{ #category : #initialization }
OntoUMLCategory >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Object put: (OntoUMLObject newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #MixinClass put: (OntoUMLMixinClass newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #RigidMixin put: (OntoUMLRigidMixin newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Category put: self.
]
