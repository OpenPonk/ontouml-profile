"
Verifies OntoUML plugin metadata, prerequisite plugin declarations, system settings registration, and style editor launch.
"
Class {
	#name : 'OntoUMLPluginTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-OntoUML-Plugin-Tests-Plugin',
	#package : 'OpenPonk-OntoUML-Plugin-Tests',
	#tag : 'Plugin'
}

{ #category : 'tests' }
OntoUMLPluginTest >> testOpenNotationStyleEditorOpensAndClosesWindow [

	| windowsBefore newWindows |
	windowsBefore := (self currentWorld submorphs select: [ :morph | morph isSystemWindow ]) asIdentitySet.
	[
		OntoUMLPlugin openNotationStyleEditor.
		newWindows := self currentWorld submorphs select: [ :morph | morph isSystemWindow and: [ (windowsBefore includes: morph) not ] ].
		self assert: newWindows size equals: 1 ] ensure: [
			self currentWorld submorphs
				select: [ :morph | morph isSystemWindow and: [ (windowsBefore includes: morph) not ] ]
				thenDo: [ :window | window delete ] ]
]

{ #category : 'tests' }
OntoUMLPluginTest >> testPluginMetadata [

	| plugin |
	plugin := OntoUMLPlugin new.
	self assert: OntoUMLPlugin repositoryName equals: #'class-editor'.
	self assertCollection: OntoUMLPlugin requiredPluginClasses hasSameElements: { OPUmlClassEditorPlugin }.
	self assert: plugin name equals: 'OntoUML UFO-A'.
	self assert: plugin defaultModelName equals: 'OntoUML UFO-A'.
	self assert: plugin icon isForm description: 'Plugin icon must be a Form'.
	self assertCollection: OntoUMLPlugin defaultProfiles hasSameElements: { OntoUMLProfileFactory profile }
]

{ #category : 'tests' }
OntoUMLPluginTest >> testSettingsOnRegistersStyleEditorButton [

	| builder buttonNode |
	builder := SettingTreeBuilder new.
	OntoUMLPlugin settingsOn: builder.
	buttonNode := builder nodeList detect: [ :each | each name = #openNotationStyleEditor ].
	self assert: buttonNode parentName equals: #openponk.
	self assert: buttonNode item target identicalTo: OntoUMLPlugin.
	self assert: buttonNode item label equals: 'OntoUML Element Styles'
]
