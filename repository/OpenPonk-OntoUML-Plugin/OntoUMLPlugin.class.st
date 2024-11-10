Class {
	#name : 'OntoUMLPlugin',
	#superclass : 'OPUmlClassEditorPlugin',
	#category : 'OpenPonk-OntoUML-Plugin-plugin',
	#package : 'OpenPonk-OntoUML-Plugin',
	#tag : 'plugin'
}

{ #category : 'as yet unclassified' }
OntoUMLPlugin class >> defaultProfiles [
	^ {OntoUMLProfileFactory profile}
]

{ #category : 'accessing' }
OntoUMLPlugin >> icon [

	^ OntoUMLIcons ontoumlIcon
]

{ #category : 'accessing' }
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
