parts
meronymicPair
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