Class {
	#name : 'OntoUMLRigidMixin',
	#superclass : 'OntoUMLElement',
	#category : 'OntoUML-Profile-Model',
	#package : 'OntoUML-Profile',
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
