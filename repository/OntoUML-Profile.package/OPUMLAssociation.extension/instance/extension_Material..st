*OntoUML-Profile
extension_Material: aMaterial
	| oldMaterial |
	oldMaterial := self extension_Material.
	self tagAt: #extension_Material put: aMaterial.
	OPUMLToOneLink
		on: self
		thisSelector: #extension_Material
		otherSelector: #base_Association
		updateFrom: oldMaterial
		to: aMaterial