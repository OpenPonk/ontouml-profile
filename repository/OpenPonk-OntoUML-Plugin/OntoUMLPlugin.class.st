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
OntoUMLPlugin class >> repositoryName [
	^ #'ontouml-editor'
]

{ #category : 'accessing' }
OntoUMLPlugin class >> requiredPluginClasses [
	"Answers prerequisite plugin classes needed by OntoUML."

	^ { OPUmlClassEditorPlugin }
]

{ #category : 'templates' }
OntoUMLPlugin >> exampleProjectTemplates [
	"Answers example project templates for OntoUML UFO-A diagrams."

	^ { 
		(OPProjectTemplate
			named: 'Role Mixin Pattern'
			icon: self icon
			modelFactory: [ OntoUMLExamples exampleRoleMixinPattern1 ]
			isExample: true).
		(OPProjectTemplate
			named: 'Containment, SubQuantityOf'
			icon: self icon
			modelFactory: [ OntoUMLExamples exampleSubQuantityContainment ]
			isExample: true) }
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
