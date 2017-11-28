world menu
menuCommandOn: aBuilder
	<worldMenu>
	| parent |
	parent := #UntoUMLStructuralEditor.
	(aBuilder item: parent)
		icon: OPIcons current openponkIcon;
		label: 'OntoUML UFO-A Editor';
		parent: #MostUsedTools;
		action: [ self openEmptyModel ];
		with: [ (aBuilder item: #OntoUMLEmptyOpen)
				parent: parent;
				label: 'Open Empty Model';
				icon: OPUmlIcons modelIcon;
				withSeparatorAfter;
				action: [ self openEmptyModel ].
			((self class methodsInProtocol: 'examples')
				collect: [ :each | 
					(aBuilder item: ('OntoUML' , each selector capitalized) asSymbol)
						parent: parent;
						label: each pragmas first arguments first;
						icon: OPUmlIcons modelIcon;
						target: self;
						selector: each selector ]) last withSeparatorAfter.
			(aBuilder item: #OntoUMLProfileOpen)
				parent: parent;
				label: 'Open OntoUML Profile';
				icon: OPUmlIcons profileIcon;
				action: [ OPUmlProject openOnModel: OntoUMLProfileFactory profile ].
			(aBuilder item: #OntoUMLProfileInspect)
				parent: parent;
				label: 'Inspect OntoUML Profile';
				icon: OPUmlIcons profileIcon;
				action: [ OntoUMLProfileFactory profile inspect ] ]