parts
materialPair
	<gtExample>
	| pair |
	pair := self newStereotype: #Material to: (self metaClassNamed: 'Association').
	pair first isAbstract: true.
	^ pair