"
I represent an abstract OntoUML stereotype for mixin classes (non-sortals) applied to a UML Class. I generalize types that classify entities of different kinds, thus lacking a uniform principle of identity.
"
Class {
	#name : 'OntoUMLMixinClass',
	#superclass : 'OntoUMLElement',
	#category : 'OpenPonk-OntoUML-Profile-Model',
	#package : 'OpenPonk-OntoUML-Profile',
	#tag : 'Model'
}

{ #category : 'accessing - Object' }
OntoUMLMixinClass >> base_Class [
	^ (sharedGeneralizations at: #Object) base_Class
]

{ #category : 'accessing - Object' }
OntoUMLMixinClass >> base_Class: aClass [
	(sharedGeneralizations at: #Object) base_Class: aClass
]

{ #category : 'initialization' }
OntoUMLMixinClass >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #Object.
	}
]

{ #category : 'initialization' }
OntoUMLMixinClass >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Object put: (OntoUMLObject newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #MixinClass put: self.
]
