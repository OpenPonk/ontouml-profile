"
I am the core plugin class for OntoUML in OpenPonk. I register the OntoUML editor extension, supply the default OntoUML profile, and manage the initialization of new OntoUML models.
"
Class {
	#name : 'OntoUMLPlugin',
	#superclass : 'OPUmlClassEditorPlugin',
	#category : 'OpenPonk-OntoUML-Plugin-Plugin',
	#package : 'OpenPonk-OntoUML-Plugin',
	#tag : 'Plugin'
}

{ #category : 'accessing' }
OntoUMLPlugin class >> defaultProfiles [
	^ {OntoUMLProfileFactory profile}
]

{ #category : 'accessing' }
OntoUMLPlugin >> icon [

	^ OntoUMLIcons ontoumlIcon
]

{ #category : 'testing' }
OntoUMLPlugin >> isPluginFor: aModel [

	^ ({ self modelClass } includes: aModel class) and: [ 
		  self supportsProfilesOf: aModel ]
]

{ #category : 'accessing' }
OntoUMLPlugin >> name [
	^ 'OntoUML UFO-A'
]

{ #category : 'instance creation' }
OntoUMLPlugin >> newModel [
	| model |
	model := super newModel.
	model profileApplications
		addAll:
			(self defaultProfiles
				collect: [ :each | OPUMLProfileApplication new appliedProfile: each ]).
	^ model
]
