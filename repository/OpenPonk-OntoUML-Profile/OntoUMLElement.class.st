"
I am the abstract base class for all OntoUML stereotypes. I provide common behavior for managing the underlying UML metamodel elements they extend.
"
Class {
	#name : 'OntoUMLElement',
	#superclass : 'OPUMLMetaElement',
	#category : 'OpenPonk-OntoUML-Profile-Model',
	#package : 'OpenPonk-OntoUML-Profile',
	#tag : 'Model'
}

{ #category : 'accessing' }
OntoUMLElement >> umlClassName [
	^ self className withoutPrefix: 'OntoUML'
]

{ #category : 'accessing' }
OntoUMLElement >> umlMetaClass [
	^ OntoUMLProfileFactory metaClassFor: self
]
