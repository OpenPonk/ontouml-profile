Class {
	#name : 'OntoUMLMenuItems',
	#superclass : 'Object',
	#category : 'OntoUML-OpenPonk-menu',
	#package : 'OntoUML-OpenPonk',
	#tag : 'menu'
}

{ #category : 'world menu' }
OntoUMLMenuItems class >> menuCommandOn: aBuilder [

	<worldMenu>
	| parent |
	parent := #OntoUML.
	(aBuilder item: parent)
		icon: OntoUMLIcons ontoumlIcon;
		label: 'OntoUML UFO-A Editor';
		action: [ OntoUMLExamples openEmptyModel ];
		order: 210;
		with: [ 
			(aBuilder item: #OntoUMLEmptyOpen)
				parent: parent;
				label: 'Open Empty Model';
				icon: OntoUMLIcons ontoumlIcon;
				withSeparatorAfter;
				action: [ OntoUMLExamples openEmptyModel ].
			((OntoUMLExamples class methodsInProtocol: 'examples') collect: [ 
				 :each | 
				 (aBuilder item: ('OntoUML' , each selector capitalized) asSymbol)
					 parent: parent;
					 label: each pragmas first arguments first;
					 icon: OntoUMLIcons ontoumlIcon;
					 target: OntoUMLExamples;
					 selector: each selector ]) last withSeparatorAfter.
			(aBuilder item: #OntoUMLProfileOpen)
				parent: parent;
				label: 'Open OntoUML Profile';
				icon: OntoUMLIcons ontoumlIcon;
				action: [ OntoUMLProfileFactory openProfile ].
			(aBuilder item: #OntoUMLProfileInspect)
				parent: parent;
				label: 'Inspect OntoUML Profile';
				icon: OntoUMLIcons ontoumlIcon;
				withSeparatorAfter;
				action: [ OntoUMLProfileFactory profile inspect ] ]
]
