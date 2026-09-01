"
I represent the OntoUML `«antiRigidMixin»` stereotype applied to a UML Class. I model a property that applies to instances of different kinds and is contingent (anti-rigid), such as a RoleMixin or PhaseMixin.
"
Class {
	#name : 'OntoUMLAntiRigidMixin',
	#superclass : 'OntoUMLElement',
	#category : 'OpenPonk-OntoUML-Profile-Model',
	#package : 'OpenPonk-OntoUML-Profile',
	#tag : 'Model'
}

{ #category : 'accessing - Object' }
OntoUMLAntiRigidMixin >> base_Class [
	^ (sharedGeneralizations at: #Object) base_Class
]

{ #category : 'accessing - Object' }
OntoUMLAntiRigidMixin >> base_Class: aClass [
	(sharedGeneralizations at: #Object) base_Class: aClass
]

{ #category : 'initialization' }
OntoUMLAntiRigidMixin >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #NonRigidMixin.
	}
]

{ #category : 'initialization' }
OntoUMLAntiRigidMixin >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Object put: (OntoUMLObject newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #MixinClass put: (OntoUMLMixinClass newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NonRigidMixin put: (OntoUMLNonRigidMixin newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #AntiRigidMixin put: self.
]
