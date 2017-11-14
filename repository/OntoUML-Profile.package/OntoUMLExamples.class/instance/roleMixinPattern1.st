examples
roleMixinPattern1
	"https://ontouml.org/ufo/wiki/rolemixin/ Pattern 1"

	<gtExample>
	| model |
	model := self roleMixinPattern1Base.
	self applyStereotypeNamed: #Kind toName: 'Person' in: model.
	self applyStereotypeNamed: #Kind toName: 'Company' in: model.
	self applyStereotypeNamed: #RoleMixin toName: 'Customer' in: model.
	self applyStereotypeNamed: #Role toName: 'Individual Customer' in: model.
	self applyStereotypeNamed: #Role toName: 'Corporate Customer' in: model.
	^ model