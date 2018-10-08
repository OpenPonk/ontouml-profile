Class {
	#name : #OntoUMLElement,
	#superclass : #OPUMLElement,
	#category : 'OntoUML-Profile'
}

{ #category : #accessing }
OntoUMLElement >> umlClassName [
	^ self className withoutPrefix: 'OntoUML'
]

{ #category : #accessing }
OntoUMLElement >> umlMetaClass [
	^ OntoUMLProfileFactory metaClassFor: self
]
