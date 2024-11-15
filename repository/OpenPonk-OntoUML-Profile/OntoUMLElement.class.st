"
I am an abstract class for OntoUML implementing some behavior for managing the classes and other stuff.
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
