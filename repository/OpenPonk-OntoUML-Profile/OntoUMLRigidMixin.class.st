"
I represent an abstract OntoUML stereotype for rigid mixins (like Categories) applied to a UML Class.
"
Class {
	#name : 'OntoUMLRigidMixin',
	#superclass : 'OntoUMLElement',
	#category : 'OpenPonk-OntoUML-Profile-Model',
	#package : 'OpenPonk-OntoUML-Profile',
	#tag : 'Model'
}

{ #category : 'accessing - Object' }
OntoUMLRigidMixin >> base_Class [
	^ (sharedGeneralizations at: #Object) base_Class
]

{ #category : 'accessing - Object' }
OntoUMLRigidMixin >> base_Class: aClass [
	(sharedGeneralizations at: #Object) base_Class: aClass
]

{ #category : 'initialization' }
OntoUMLRigidMixin >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #MixinClass.
	}
]

{ #category : 'initialization' }
OntoUMLRigidMixin >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Object put: (OntoUMLObject newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #MixinClass put: (OntoUMLMixinClass newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #RigidMixin put: self.
]
