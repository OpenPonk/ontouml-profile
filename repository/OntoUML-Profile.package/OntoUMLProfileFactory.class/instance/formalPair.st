parts
formalPair
	<gtExample>
	| pair |
	pair := self newStereotype: #Formal to: (self metaClassNamed: 'Association').
	pair first isAbstract: true.
	^ pair