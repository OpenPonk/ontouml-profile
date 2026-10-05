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

{ #category : 'settings' }
OntoUMLPlugin class >> openNotationStyleEditor [
	(OPNotationStylePresenter forPlugin: self new) open
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

{ #category : 'settings' }
OntoUMLPlugin class >> settingsOn: aBuilder [
	<systemsettings>
	(aBuilder button: #openNotationStyleEditor)
		parent: #openponk;
		order: 40;
		target: self;
		isTransient: true;
		label: 'OntoUML Element Styles';
		description: 'Open palette configuration editor to customize OntoUML element colors.';
		buttonLabel: 'Configure OntoUML Styles'
]

{ #category : 'accessing' }
OntoUMLPlugin >> defaultModelName [

	^ self name
]

{ #category : 'accessing' }
OntoUMLPlugin >> defaultStyleSheet [
	| sheet |
	sheet := OPStyleSheet new.

	"1. Rigid Sortals (identity providers)"
	#( 'Kind' 'SubKind' 'Sortal' 'RigidSortal' 'SubstanceSortal' ) do: [ :each |
		sheet atType: each set: #fillColor to: Color paleGreen ].

	"2. Sortals of collections and quantities"
	#( 'Collective' 'Quantity' ) do: [ :each |
		sheet atType: each set: #fillColor to: (Color fromHexString: 'D6FCEB') ].

	"3. Relational anti-rigid sortals (roles)"
	#( 'Role' 'AntiRigidSortal' ) do: [ :each |
		sheet atType: each set: #fillColor to: Color paleYellow ].

	"4. Intrinsic anti-rigid sortals (phases / states)"
	#( 'Phase' ) do: [ :each |
		sheet atType: each set: #fillColor to: Color paleOrange ].

	"5. Moments and aspects"
	#( 'Relator' 'Mode' 'Quality' 'Moment' 'IntrinsicMoment' ) do: [ :each |
		sheet atType: each set: #fillColor to: Color paleBlue ].

	"6. Rigid mixins"
	#( 'Category' 'RigidMixin' ) do: [ :each |
		sheet atType: each set: #fillColor to: Color paleMagenta ].

	"7. Dynamic / anti-rigid mixins"
	#( 'RoleMixin' 'PhaseMixin' 'Mixin' 'AntiRigidMixin' 'NonRigidMixin' 'SemiRigidMixin' 'MixinClass' ) do: [ :each |
		sheet atType: each set: #fillColor to: Color paleRed ].

	"8. Value datatypes"
	#( 'Datatype' 'DataType' ) do: [ :each |
		sheet atType: each set: #fillColor to: Color veryVeryLightGray ].

	"9. Enumeration types"
	#( 'Enumeration' ) do: [ :each |
		sheet atType: each set: #fillColor to: (Color fromHexString: 'DCE5EC') ].

	^ sheet
]

{ #category : 'templates' }
OntoUMLPlugin >> exampleProjectTemplates [
	"Answers example project templates for OntoUML UFO-A diagrams."

	^ { 
		(OPProjectTemplate
			named: 'Blood Donation'
			icon: self icon
			modelFactory: [ OntoUMLExamples exampleBloodDonation ]
			isExample: true).
		(OPProjectTemplate
			named: 'Role Mixin Pattern'
			icon: self icon
			modelFactory: [ OntoUMLExamples exampleRoleMixinPattern1 ]
			isExample: true).
		(OPProjectTemplate
			named: 'Alcohol'
			icon: self icon
			modelFactory: [ OntoUMLExamples exampleAlcohol ]
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
