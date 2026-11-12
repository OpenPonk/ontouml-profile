"
Verifies the serialization and deserialization roundtrip persistence for OntoUML models.
"
Class {
	#name : 'OntoUMLPluginRoundtripTest',
	#superclass : 'OPAbstractPluginExampleRoundtripTest',
	#category : 'OpenPonk-OntoUML-Plugin-Tests-Plugin',
	#package : 'OpenPonk-OntoUML-Plugin-Tests',
	#tag : 'Plugin'
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
