Class {
	#name : 'OntoUMLRoleMixin',
	#superclass : 'OntoUMLElement',
	#category : 'OntoUML-Profile-model',
	#package : 'OntoUML-Profile',
	#tag : 'model'
}

{ #category : 'accessing - Object' }
OntoUMLRoleMixin >> base_Class [
	^ (sharedGeneralizations at: #Object) base_Class
]

{ #category : 'accessing - Object' }
OntoUMLRoleMixin >> base_Class: aClass [
	(sharedGeneralizations at: #Object) base_Class: aClass
]

{ #category : 'initialization' }
OntoUMLRoleMixin >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #AntiRigidMixin.
	}
]

{ #category : 'initialization' }
OntoUMLRoleMixin >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Object put: (OntoUMLObject newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #MixinClass put: (OntoUMLMixinClass newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NonRigidMixin put: (OntoUMLNonRigidMixin newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #AntiRigidMixin put: (OntoUMLAntiRigidMixin newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #RoleMixin put: self.
]
