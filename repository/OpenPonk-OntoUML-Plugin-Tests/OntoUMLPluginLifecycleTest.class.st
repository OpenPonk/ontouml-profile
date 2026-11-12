"
Verifies the initialization, profile attachment, and shutdown lifecycle of the OntoUML plugin.
"
Class {
	#name : 'OntoUMLPluginLifecycleTest',
	#superclass : 'OPAbstractPluginExampleLifecycleTest',
	#category : 'OpenPonk-OntoUML-Plugin-Tests-Plugin',
	#package : 'OpenPonk-OntoUML-Plugin-Tests',
	#tag : 'Plugin'
}

{ #category : 'accessing' }
OntoUMLPluginLifecycleTest class >> pluginClass [
	"Answers the OPPlugin class under test."
	^ OntoUMLPlugin
]
