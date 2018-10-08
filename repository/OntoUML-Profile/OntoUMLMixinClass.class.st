Class {
	#name : #OntoUMLMixinClass,
	#superclass : #OntoUMLElement,
	#category : 'OntoUML-Profile-OntoUML-Profile'
}

{ #category : #'accessing - Object' }
OntoUMLMixinClass >> base_Class [
	^ (sharedGeneralizations at: #Object) base_Class
]

{ #category : #'accessing - Object' }
OntoUMLMixinClass >> base_Class: aClass [
	(sharedGeneralizations at: #Object) base_Class: aClass
]

{ #category : #initialization }
OntoUMLMixinClass >> initializeDirectGeneralizations [
	directGeneralizations := {
		sharedGeneralizations at: #Object.
	}
]

{ #category : #initialization }
OntoUMLMixinClass >> initializeSharedGeneralizations [
	sharedGeneralizations at: #Object put: (OntoUMLObject newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #MixinClass put: self.
]
