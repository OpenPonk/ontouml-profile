Class {
	#name : 'OntoUMLPhaseMixin',
	#superclass : 'OntoUMLElement',
	#category : 'OntoUML-Profile-model',
	#package : 'OntoUML-Profile',
	#tag : 'model'
}

{ #category : 'accessing - Object' }
OntoUMLPhaseMixin >> base_Class [
	^ (sharedGeneralizations at: #Object) base_Class
]

{ #category : 'accessing - Object' }
OntoUMLPhaseMixin >> base_Class: aClass [
	(sharedGeneralizations at: #Object) base_Class: aClass
]

{ #category : 'initialization' }
OntoUMLPhaseMixin >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #AntiRigidMixin.
	}
]

{ #category : 'initialization' }
OntoUMLPhaseMixin >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Object put: (OntoUMLObject newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #MixinClass put: (OntoUMLMixinClass newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NonRigidMixin put: (OntoUMLNonRigidMixin newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #AntiRigidMixin put: (OntoUMLAntiRigidMixin newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #PhaseMixin put: self.
]
