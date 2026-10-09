"
I am a factory and builder for the OntoUML UML profile. I dynamically construct the profile, defining its ontology-based stereotypes for classes (like Kind, Collective) and associations (like Material, Mediation, ComponentOf).
"
Class {
	#name : 'OntoUMLProfileFactory',
	#superclass : 'OPUmlCustomProfile',
	#instVars : [
		'profile'
	],
	#category : 'OpenPonk-OntoUML-Profile-Model',
	#package : 'OpenPonk-OntoUML-Profile',
	#tag : 'Model'
}

{ #category : 'actions' }
OntoUMLProfileFactory class >> generate [

	<script>
	| model generator |
	model := self profile.
	generator := OPUMLProfileGenerator new.
	generator sourceModel: model.
	generator classPrefix: model implementationPrefix.
	generator packageName: model implementationPackage.
	(CBChangesBrowser changes: generator generateAll) open
]

{ #category : 'testing' }
OntoUMLProfileFactory class >> isAppliedTo: anEditor [
	"Answers true if the OntoUML profile is applied to the UML model of the active editor."
	| activeDiagramController activeModel |
	(anEditor isNotNil and: [ anEditor plugin isKindOf: OPUmlClassEditorPlugin ]) ifFalse: [ ^ false ].
	activeDiagramController := anEditor diagramController.
	(activeDiagramController isNotNil and: [ activeDiagramController model isNotNil ]) ifFalse: [ ^ false ].
	activeModel := activeDiagramController model.
	(activeModel respondsTo: #profileApplications) ifFalse: [ ^ false ].
	^ activeModel profileApplications anySatisfy: [ :eachProfileApplication | 
		eachProfileApplication appliedProfile isNotNil and: [ eachProfileApplication appliedProfile name = 'OntoUML' ] ]
]

{ #category : 'accessing' }
OntoUMLProfileFactory class >> profile [

	<script: 'self profile inspect'>
	^ super profile
]

{ #category : 'class initialization' }
OntoUMLProfileFactory class >> reset [

	<script>
	super reset
]

{ #category : 'actions' }
OntoUMLProfileFactory >> createProfile [
	profile ifNotNil: [ ^ profile ].
	profile := self profile.
	^ profile
]

{ #category : 'parts' }
OntoUMLProfileFactory >> formalPair [
	<gtExample>
	| pair |
	pair := self newStereotype: #Formal to: (self metaClassNamed: 'Association').
	pair first isAbstract: true.
	^ pair
]

{ #category : 'parts' }
OntoUMLProfileFactory >> materialPair [

	<gtExample>
	^ self
		  newStereotype: #Material
		  to: (self metaClassNamed: 'Association')
]

{ #category : 'parts' }
OntoUMLProfileFactory >> meronymicPair [
	<gtExample>
	| pair stereotype |
	pair := self newStereotype: #Meronymic to: (self metaClassNamed: 'Association').
	pair first isAbstract: true.
	stereotype := pair first.
	stereotype isAbstract: true.
	OPUMLProperty new
		name: 'essential';
		uuid: stereotype uuid , '-essential';
		owningClass: stereotype;
		type: (OPUMLPrimitiveType new name: 'Boolean');
		defaultValue:
			(OPUMLLiteralBoolean new
				value: false;
				uuid: stereotype uuid , '-essential-_defaultValue').
	OPUMLProperty new
		name: 'inseparable';
		uuid: stereotype uuid , '-inseparable';
		owningClass: stereotype;
		type: (OPUMLPrimitiveType new name: 'Boolean');
		defaultValue:
			(OPUMLLiteralBoolean new
				value: false;
				uuid: stereotype uuid , '-inseparable-_defaultValue').
	^ pair
]

{ #category : 'parts' }
OntoUMLProfileFactory >> momentPair [
	<gtExample>
	| classMetaclass pair stereotype |
	classMetaclass := self metaClassNamed: 'Class'.
	pair := self newStereotype: #Moment to: classMetaclass.
	stereotype := pair first.
	stereotype isAbstract: true.
	^ pair
]

{ #category : 'parts' }
OntoUMLProfileFactory >> newStereotype: aName subclassOf: aParent [
	| stereotype |
	stereotype := OPUMLStereotype new
		name: aName;
		uuid: aName.
	OPUMLGeneralization new
		general: aParent;
		specific: stereotype.
	^ stereotype
]

{ #category : 'parts' }
OntoUMLProfileFactory >> objectPair [
	<gtExample>
	| classMetaclass pair stereotype |
	classMetaclass := self metaClassNamed: 'Class'.
	pair := self newStereotype: #Object to: classMetaclass.
	stereotype := pair first.
	stereotype isAbstract: true.
	^ pair
]

{ #category : 'accessing' }
OntoUMLProfileFactory >> profile [

	| profile hierarchy |
	profile := self profilePackage.
	profile packagedElements addAll: self formalPair.
	profile packagedElements addAll: self materialPair.
	profile packagedElements addAll: self meronymicPair.
	profile packagedElements addAll: self momentPair.
	profile packagedElements addAll: self objectPair.
	hierarchy := {#Object -> #(Sortal MixinClass).
	#Sortal -> #(RigidSortal AntiRigidSortal).
	#RigidSortal -> #(SubstanceSortal SubKind).
	#SubstanceSortal -> #(Kind Quantity Collective).
	#AntiRigidSortal -> #(Phase Role).
	#MixinClass -> #(NonRigidMixin RigidMixin).
	#NonRigidMixin -> #(AntiRigidMixin SemiRigidMixin).
	#AntiRigidMixin -> #(RoleMixin PhaseMixin).
	#SemiRigidMixin -> #(Mixin).
	#RigidMixin -> #(Category).
	#Moment -> #(Relator IntrinsicMoment).
	#IntrinsicMoment -> #(Mode Quality)}
		,
			{#Formal -> #(BasicInternal DomainFormal).
			#BasicInternal -> #(Characterization Mediation Derivation Containment).
			#Meronymic -> #(ComponentOf MemberOf SubCollectionOf SubQuantityOf)}.
	hierarchy
		do: [ :pair | 
			| parent |
			parent := profile packagedElements detect: [ :each | each name = pair key ].
			parent isAbstract: true.
			pair value do: [ :each | profile packagedElements add: (self newStereotype: each subclassOf: parent) ] ].
	profile ownedStereotype do: [ :each | each profile: profile ].
	^ profile
]

{ #category : 'parts' }
OntoUMLProfileFactory >> profilePackage [
	^ OPUMLProfile new
		name: 'OntoUML';
		uuid: '_0';
		URI: 'https://openponk.org/OntoUML/1.0';
		implementationPackage: 'OntoUML-Profile';
		implementationPrefix: 'OntoUML';
		yourself
]
