"
I am a class representing the OntoUML profile itself.
"
Class {
	#name : 'OntoUMLProfileFactory',
	#superclass : 'OPUmlCustomProfile',
	#instVars : [
		'profile'
	],
	#category : 'OntoUML-Profile-model',
	#package : 'OntoUML-Profile',
	#tag : 'model'
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

{ #category : 'actions' }
OntoUMLProfileFactory class >> openProfile [

	<script>
	self new openProfile
]

{ #category : 'accessing' }
OntoUMLProfileFactory >> createProfile [
	profile ifNotNil: [ ^ profile ].
	profile := OPUMLXMIReader readFrom: self xmi readStream.
	profile implementationPackage: 'OntoUML-Profile';
		implementationPrefix: 'OntoUML'.	
	profile ownedStereotype do: [ :each | each profile: profile ].
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

{ #category : 'actions' }
OntoUMLProfileFactory >> openProfile [

	(OPProject openOnModel: self profile) showAllElementsInAllDiagrams
]

{ #category : 'accessing' }
OntoUMLProfileFactory >> profile [
	<gtExample>
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
	<gtExample>
	^ OPUMLProfile new
		name: 'OntoUML';
		uuid: '_0';
		URI: 'http://www.openponk.org/OntoUML/0.1';
		implementationPackage: 'OntoUML-Profile';
		implementationPrefix: 'OntoUML';
		yourself
]

{ #category : 'accessing' }
OntoUMLProfileFactory >> xmi [
	^ 
'<?xml version="1.0" encoding="UTF-8"?>
<xmi:XMI xmlns:uml="http://www.omg.org/spec/UML/20110701" xmlns:xmi="http://www.omg.org/spec/XMI/20110701">
    <uml:Profile xmi:type="uml:Profile" xmi:id="_0" URI="http://www.openponk.org/OntoUML/0.1" name="OntoUML">
        <packagedElement xmi:type="uml:Stereotype" xmi:id="Formal" isAbstract="true" name="Formal">
            <ownedAttribute xmi:type="uml:Property" xmi:id="Formal-base_Association" association="Association_Formal" name="base_Association">
                <type xmi:type="uml:Class" href="http://www.omg.org/spec/UML/20131001/UML.xmi#Association"/>
            </ownedAttribute>
        </packagedElement>
        <packagedElement xmi:type="uml:Extension" xmi:id="Association_Formal" memberEnd="Formal-base_Association Association_Formal-extension_Formal" name="Association_Formal">
            <ownedEnd xmi:type="uml:Property" xmi:id="Association_Formal-extension_Formal" aggregation="composite" association="Association_Formal" name="extension_Formal" type="Formal">
                <lowerValue xmi:type="uml:LiteralInteger" xmi:id="Association_Formal-extension_Formal-_lowerValue"/>
            </ownedEnd>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="Material" name="Material">
            <ownedAttribute xmi:type="uml:Property" xmi:id="Material-base_Association" association="Association_Material" name="base_Association">
                <type xmi:type="uml:Class" href="http://www.omg.org/spec/UML/20131001/UML.xmi#Association"/>
            </ownedAttribute>
        </packagedElement>
        <packagedElement xmi:type="uml:Extension" xmi:id="Association_Material" memberEnd="Material-base_Association Association_Material-extension_Material" name="Association_Material">
            <ownedEnd xmi:type="uml:Property" xmi:id="Association_Material-extension_Material" aggregation="composite" association="Association_Material" name="extension_Material" type="Material">
                <lowerValue xmi:type="uml:LiteralInteger" xmi:id="Association_Material-extension_Material-_lowerValue"/>
            </ownedEnd>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="Meronymic" isAbstract="true" name="Meronymic">
            <ownedAttribute xmi:type="uml:Property" xmi:id="Meronymic-base_Association" association="Association_Meronymic" name="base_Association">
                <type xmi:type="uml:Class" href="http://www.omg.org/spec/UML/20131001/UML.xmi#Association"/>
            </ownedAttribute>
            <ownedAttribute xmi:type="uml:Property" xmi:id="Meronymic-essential" name="essential">
                <defaultValue xmi:type="uml:LiteralBoolean" xmi:id="Meronymic-essential-_defaultValue"/>
                <type xmi:type="uml:PrimitiveType" href="http://www.omg.org/spec/UML/20131001/PrimitiveTypes.xmi#Boolean"/>
            </ownedAttribute>
            <ownedAttribute xmi:type="uml:Property" xmi:id="Meronymic-inseparable" name="inseparable">
                <defaultValue xmi:type="uml:LiteralBoolean" xmi:id="Meronymic-inseparable-_defaultValue"/>
                <type xmi:type="uml:PrimitiveType" href="http://www.omg.org/spec/UML/20131001/PrimitiveTypes.xmi#Boolean"/>
            </ownedAttribute>
        </packagedElement>
        <packagedElement xmi:type="uml:Extension" xmi:id="Association_Meronymic" memberEnd="Meronymic-base_Association Association_Meronymic-extension_Meronymic" name="Association_Meronymic">
            <ownedEnd xmi:type="uml:Property" xmi:id="Association_Meronymic-extension_Meronymic" aggregation="composite" association="Association_Meronymic" name="extension_Meronymic" type="Meronymic">
                <lowerValue xmi:type="uml:LiteralInteger" xmi:id="Association_Meronymic-extension_Meronymic-_lowerValue"/>
            </ownedEnd>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="Moment" isAbstract="true" name="Moment">
            <ownedAttribute xmi:type="uml:Property" xmi:id="Moment-base_Class" association="Class_Moment" name="base_Class">
                <type xmi:type="uml:Class" href="http://www.omg.org/spec/UML/20131001/UML.xmi#Class"/>
            </ownedAttribute>
        </packagedElement>
        <packagedElement xmi:type="uml:Extension" xmi:id="Class_Moment" memberEnd="Moment-base_Class Class_Moment-extension_Moment" name="Class_Moment">
            <ownedEnd xmi:type="uml:Property" xmi:id="Class_Moment-extension_Moment" aggregation="composite" association="Class_Moment" name="extension_Moment" type="Moment">
                <lowerValue xmi:type="uml:LiteralInteger" xmi:id="Class_Moment-extension_Moment-_lowerValue"/>
            </ownedEnd>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="Object" isAbstract="true" name="Object">
            <ownedAttribute xmi:type="uml:Property" xmi:id="Object-base_Class" association="Class_Object" name="base_Class">
                <type xmi:type="uml:Class" href="http://www.omg.org/spec/UML/20131001/UML.xmi#Class"/>
            </ownedAttribute>
        </packagedElement>
        <packagedElement xmi:type="uml:Extension" xmi:id="Class_Object" memberEnd="Object-base_Class Class_Object-extension_Object" name="Class_Object">
            <ownedEnd xmi:type="uml:Property" xmi:id="Class_Object-extension_Object" aggregation="composite" association="Class_Object" name="extension_Object" type="Object">
                <lowerValue xmi:type="uml:LiteralInteger" xmi:id="Class_Object-extension_Object-_lowerValue"/>
            </ownedEnd>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="Sortal" isAbstract="true" name="Sortal">
            <generalization xmi:type="uml:Generalization" xmi:id="f496ffc7-8c6e-0d00-97cd-c81800b73ac9" general="Object"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="MixinClass" isAbstract="true" name="MixinClass">
            <generalization xmi:type="uml:Generalization" xmi:id="dc9affc7-8c6e-0d00-97ce-df5900b73ac9" general="Object"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="RigidSortal" isAbstract="true" name="RigidSortal">
            <generalization xmi:type="uml:Generalization" xmi:id="c49effc7-8c6e-0d00-97cf-7f0000b73ac9" general="Sortal"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="AntiRigidSortal" isAbstract="true" name="AntiRigidSortal">
            <generalization xmi:type="uml:Generalization" xmi:id="c49effc7-8c6e-0d00-97d0-04fe00b73ac9" general="Sortal"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="SubstanceSortal" isAbstract="true" name="SubstanceSortal">
            <generalization xmi:type="uml:Generalization" xmi:id="aca2ffc7-8c6e-0d00-97d1-cc8f00b73ac9" general="RigidSortal"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="SubKind" name="SubKind">
            <generalization xmi:type="uml:Generalization" xmi:id="94a6ffc7-8c6e-0d00-97d2-da6e00b73ac9" general="RigidSortal"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="Kind" name="Kind">
            <generalization xmi:type="uml:Generalization" xmi:id="64aeffc7-8c6e-0d00-97d3-a4f800b73ac9" general="SubstanceSortal"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="Quantity" name="Quantity">
            <generalization xmi:type="uml:Generalization" xmi:id="4cb2ffc7-8c6e-0d00-97d4-ba0a00b73ac9" general="SubstanceSortal"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="Collective" name="Collective">
            <generalization xmi:type="uml:Generalization" xmi:id="4cb2ffc7-8c6e-0d00-97d5-03a400b73ac9" general="SubstanceSortal"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="Phase" name="Phase">
            <generalization xmi:type="uml:Generalization" xmi:id="34b6ffc7-8c6e-0d00-97d6-236200b73ac9" general="AntiRigidSortal"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="Role" name="Role">
            <generalization xmi:type="uml:Generalization" xmi:id="34b6ffc7-8c6e-0d00-97d7-2d5b00b73ac9" general="AntiRigidSortal"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="NonRigidMixin" isAbstract="true" name="NonRigidMixin">
            <generalization xmi:type="uml:Generalization" xmi:id="1cbaffc7-8c6e-0d00-97d8-e2ee00b73ac9" general="MixinClass"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="RigidMixin" isAbstract="true" name="RigidMixin">
            <generalization xmi:type="uml:Generalization" xmi:id="04beffc7-8c6e-0d00-97d9-b6ff00b73ac9" general="MixinClass"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="AntiRigidMixin" isAbstract="true" name="AntiRigidMixin">
            <generalization xmi:type="uml:Generalization" xmi:id="04beffc7-8c6e-0d00-97da-26d000b73ac9" general="NonRigidMixin"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="SemiRigidMixin" isAbstract="true" name="SemiRigidMixin">
            <generalization xmi:type="uml:Generalization" xmi:id="ecc1ffc7-8c6e-0d00-97db-403c00b73ac9" general="NonRigidMixin"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="RoleMixin" name="RoleMixin">
            <generalization xmi:type="uml:Generalization" xmi:id="ecc1ffc7-8c6e-0d00-97dc-5f1800b73ac9" general="AntiRigidMixin"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="PhaseMixin" name="PhaseMixin">
            <generalization xmi:type="uml:Generalization" xmi:id="d4c5ffc7-8c6e-0d00-97dd-3bf200b73ac9" general="AntiRigidMixin"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="Mixin" name="Mixin">
            <generalization xmi:type="uml:Generalization" xmi:id="d4c5ffc7-8c6e-0d00-97de-af3600b73ac9" general="SemiRigidMixin"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="Category" name="Category">
            <generalization xmi:type="uml:Generalization" xmi:id="bcc9ffc7-8c6e-0d00-97df-1cd200b73ac9" general="RigidMixin"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="Relator" name="Relator">
            <generalization xmi:type="uml:Generalization" xmi:id="a4cdffc7-8c6e-0d00-97e0-2b8d00b73ac9" general="Moment"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="IntrinsicMoment" isAbstract="true" name="IntrinsicMoment">
            <generalization xmi:type="uml:Generalization" xmi:id="a4cdffc7-8c6e-0d00-97e1-776b00b73ac9" general="Moment"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="Mode" name="Mode">
            <generalization xmi:type="uml:Generalization" xmi:id="8cd1ffc7-8c6e-0d00-97e2-40ff00b73ac9" general="IntrinsicMoment"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="Quality" name="Quality">
            <generalization xmi:type="uml:Generalization" xmi:id="5cd9ffc7-8c6e-0d00-97e3-5c2b00b73ac9" general="IntrinsicMoment"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="BasicInternal" isAbstract="true" name="BasicInternal">
            <generalization xmi:type="uml:Generalization" xmi:id="44ddffc7-8c6e-0d00-97e4-435700b73ac9" general="Formal"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="DomainFormal" name="DomainFormal">
            <generalization xmi:type="uml:Generalization" xmi:id="44ddffc7-8c6e-0d00-97e5-3e2400b73ac9" general="Formal"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="Characterization" name="Characterization">
            <generalization xmi:type="uml:Generalization" xmi:id="2ce1ffc7-8c6e-0d00-97e6-c6cc00b73ac9" general="BasicInternal"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="Mediation" name="Mediation">
            <generalization xmi:type="uml:Generalization" xmi:id="2ce1ffc7-8c6e-0d00-97e7-894200b73ac9" general="BasicInternal"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="Derivation" name="Derivation">
            <generalization xmi:type="uml:Generalization" xmi:id="14e5ffc7-8c6e-0d00-97e8-5cc900b73ac9" general="BasicInternal"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="Containment" name="Containment">
            <generalization xmi:type="uml:Generalization" xmi:id="fce8ffc7-8c6e-0d00-97e9-945d00b73ac9" general="BasicInternal"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="ComponentOf" name="ComponentOf">
            <generalization xmi:type="uml:Generalization" xmi:id="fce8ffc7-8c6e-0d00-97ea-669800b73ac9" general="Meronymic"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="MemberOf" name="MemberOf">
            <generalization xmi:type="uml:Generalization" xmi:id="fce8ffc7-8c6e-0d00-97eb-964d00b73ac9" general="Meronymic"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="SubCollectionOf" name="SubCollectionOf">
            <generalization xmi:type="uml:Generalization" xmi:id="e4ecffc7-8c6e-0d00-97ec-c5e300b73ac9" general="Meronymic"/>
        </packagedElement>
        <packagedElement xmi:type="uml:Stereotype" xmi:id="SubQuantityOf" name="SubQuantityOf">
            <generalization xmi:type="uml:Generalization" xmi:id="ccf0ffc7-8c6e-0d00-97ed-dcc500b73ac9" general="Meronymic"/>
        </packagedElement>
    </uml:Profile>
</xmi:XMI>'
]
