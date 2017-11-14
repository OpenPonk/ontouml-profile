parts
objectPair
	<gtExample>
	| classMetaclass pair stereotype |
	classMetaclass := self metaClassNamed: 'Class'.
	pair := self newStereotype: #Object to: classMetaclass.
	stereotype := pair first.
	stereotype isAbstract: true.
	^ pair