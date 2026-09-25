Class {
	#name : 'OntoUMLPluginRoundtripTest',
	#superclass : 'OPAbstractPluginExampleRoundtripTest',
	#category : 'OpenPonk-OntoUML-Plugin-Tests',
	#package : 'OpenPonk-OntoUML-Plugin',
	#tag : 'Tests'
}

{ #category : 'accessing' }
OntoUMLPluginRoundtripTest class >> pluginClass [
	^ OntoUMLPlugin
]

{ #category : 'accessing' }
OntoUMLPluginRoundtripTest >> supportedModelClasses [
	"Answers model classes that can carry OntoUML UFO-A stereotypes in diagrams."
	^ { OPUMLClass . OPUMLAssociation . OPUMLGeneralization } asSet
]
