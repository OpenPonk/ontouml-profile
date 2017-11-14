parts
momentPair
	<gtExample>
	| classMetaclass pair stereotype |
	classMetaclass := self metaClassNamed: 'Class'.
	pair := self newStereotype: #Moment to: classMetaclass.
	stereotype := pair first.
	stereotype isAbstract: true.
	^ pair