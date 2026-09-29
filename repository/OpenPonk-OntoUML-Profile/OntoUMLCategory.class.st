"
I represent the OntoUML `«category»` stereotype applied to a UML Class. I model a rigid mixin that represents essential properties common to entities of different kinds.
"
Class {
	#name : 'OntoUMLCategory',
	#superclass : 'OntoUMLElement',
	#category : 'OpenPonk-OntoUML-Profile-Model',
	#package : 'OpenPonk-OntoUML-Profile',
	#tag : 'Model'
}

{ #category : 'accessing - Object' }
OntoUMLCategory >> base_Class [
	^ (sharedGeneralizations at: #Object) base_Class
]

{ #category : 'accessing - Object' }
OntoUMLCategory >> base_Class: aClass [
	(sharedGeneralizations at: #Object) base_Class: aClass
]

{ #category : 'initialization' }
OntoUMLCategory >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #RigidMixin.
	}
]

{ #category : 'initialization' }
OntoUMLCategory >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Object put: (OntoUMLObject newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #MixinClass put: (OntoUMLMixinClass newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #RigidMixin put: (OntoUMLRigidMixin newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Category put: self.
]
