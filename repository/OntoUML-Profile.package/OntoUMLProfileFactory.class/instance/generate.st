actions
generate
	<script: 'self new generate'>
	| model generator |
	model := self class profile.
	generator := OPUMLProfileGenerator new.
	generator sourceModel: model.
	generator classPrefix: model implementationPrefix.
	generator packageName: model implementationPackage.
	(CBChangesBrowser changes: generator generateAll) open