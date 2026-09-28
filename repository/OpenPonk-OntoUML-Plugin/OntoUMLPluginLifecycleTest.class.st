"
Verifies the initialization, profile attachment, and shutdown lifecycle of the OntoUML plugin.
"
Class {
	#name : 'OntoUMLPluginLifecycleTest',
	#superclass : 'OPAbstractPluginExampleLifecycleTest',
	#category : 'OpenPonk-OntoUML-Plugin-Tests',
	#package : 'OpenPonk-OntoUML-Plugin',
	#tag : 'Tests'
}

{ #category : 'accessing' }
OntoUMLPluginLifecycleTest class >> pluginClass [
	"Answers the OPPlugin class under test."
	^ OntoUMLPlugin
]
