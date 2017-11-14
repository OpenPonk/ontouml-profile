examples
roleMixinPattern1Base
	"https://ontouml.org/ufo/wiki/rolemixin/ Pattern 1"

	<gtExample>
	| model customer person company individualCustomer corporateCustomer gs |
	model := self emptyModel.
	(customer := OPUMLClass new name: 'Customer') isAbstract: true.
	person := OPUMLClass new name: 'Person'.
	company := OPUMLClass new name: 'Company'.
	individualCustomer := OPUMLClass new name: 'Individual Customer'.
	corporateCustomer := OPUMLClass new name: 'Corporate Customer'.
	gs := (self
		generalizationSetOn:
			{self generalizationFrom: individualCustomer to: customer.
			self generalizationFrom: corporateCustomer to: customer}) name: 'gs1'.
	self generalizationFrom: individualCustomer to: person.
	self generalizationFrom: corporateCustomer to: company.
	model packagedElements
		add: customer;
		add: person;
		add: company;
		add: individualCustomer;
		add: corporateCustomer;
		add: gs.
	^ model