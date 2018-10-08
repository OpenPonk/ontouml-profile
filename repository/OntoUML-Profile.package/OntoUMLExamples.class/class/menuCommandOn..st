world menu
menuCommandOn: aBuilder
	<worldMenu>
	| parent |
	parent := #UntoUMLStructuralEditor.
	(aBuilder item: parent)
		icon: self ontoumlIcon;
		label: 'OntoUML UFO-A Editor';
		parent: #MostUsedTools;
		action: [ self openEmptyModel ];
		with: [ (aBuilder item: #OntoUMLEmptyOpen)
				parent: parent;
				label: 'Open Empty Model';
				icon: self ontoumlIcon;
				withSeparatorAfter;
				action: [ self openEmptyModel ].
			((self class methodsInProtocol: 'examples')
				collect: [ :each | 
					(aBuilder item: ('OntoUML' , each selector capitalized) asSymbol)
						parent: parent;
						label: each pragmas first arguments first;
						icon: self ontoumlIcon;
						target: self;
						selector: each selector ]) last withSeparatorAfter.
			(aBuilder item: #OntoUMLProfileOpen)
				parent: parent;
				label: 'Open OntoUML Profile';
				icon: self ontoumlIcon;
				action: [ OPUmlProject openOnModel: OntoUMLProfileFactory profile ].
			(aBuilder item: #OntoUMLProfileInspect)
				parent: parent;
				label: 'Inspect OntoUML Profile';
				icon: self ontoumlIcon;
				action: [ OntoUMLProfileFactory profile inspect ] ]