examples
emptyModel
	<gtExample>
	| model |
	model := OPUMLModel new name: 'OntoUML Model'.
	self applyProfileTo: model.
	^ model