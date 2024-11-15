Class {
	#name : 'OPOntouml401oppProjectLoadTest',
	#superclass : 'OPLegacyProjectLoadTest',
	#category : 'OpenPonk-OntoUML-Plugin-Tests',
	#package : 'OpenPonk-OntoUML-Plugin',
	#tag : 'Tests'
}

{ #category : 'files' }
OPOntouml401oppProjectLoadTest >> base64ProjectZip [

^'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vO0NYxBg5D5vsDDhYXcRB4y5bB21SXyVvF4ok7kS7WIrdC6L6rFJeUgGtkUbtUNVPkEHldZ27qv8U72QxW+aztvH5TKpZEHTC1XJ2FTHKzooICTacPthGdG0hU2j18x5nr/IvFFpkpk/xTdazc3/r8EZMO/Qex0+dZ7d2tfEQRWyv4mDzux7mNivQwAYROzgJvbDJTDeov1MnDqtHvK27iKgj7o2eMCjhPd2Fxdy1lGEIGBjf+2bBQmPuosw8GH09u4yJINWYQ5T+cGF2a8DASTG8OCF2Q93gUtC/BHdZVCFWDSOCxnXJnKd5bo0at5g7qD7+z3M7dfnARSG9ODm9sN9EAY8OkDXKXSUpPI0z9OErzzput9asDkmCrebagAijv1dnYIuA0lRh7XuChltD865VLlW96vpuZ5mHThCn27h1jDmdDOvJ2tnY4iuH9VxJl+TurqX2TPIeu5oH+Ag3BgQGC3lbf3eBk4vTov6Y05VlVSPzSAKWff8wsBctTTYRR7U2fYkh8D0LLaLPOjYtclnWlU0UeubbAkPCOtWNiQgROFO2YOmkjb855w9K7+OXu6aMAKcCbILP6g9GfzUqX8/Hv8DUEsBAhQDFAAAAAgA11FRWQgkVLo5AAAAQwAAABgAAAAAAAAAAAAAALaBAAAAAHByb2plY3QvZXhwb3J0LWluZm8uanNvblBLAQIUAxQAAAAIANdRUVnSFNCuawAAAIQAAAATAAAAAAAAAAAAAAC2gW8AAABwcm9qZWN0L21vZGVscy5qc29uUEsBAhQDFAAAAAgA11FRWb/qa/GYAAAAxwAAABQAAAAAAAAAAAAAALaBCwEAAHByb2plY3QvcHJvamVjdC5qc29uUEsBAhQDFAAAAAgA11FRWQrzmz5FAAAATQAAAEQAAAAAAAAAAAAAALaB1QEAAHByb2plY3QvbW9kZWxzL2Y4MWIwZDgyLTA5ZTEtMGQwMC05NWZlLWIyZGUwNzI1N2MwMy9leHBvcnQtaW5mby5qc29uUEsBAhQDFAAAAAgA11FRWXricozIBAAAGCgAAFEAAAAAAAAAAAAAALaBfAIAAHByb2plY3QvbW9kZWxzL2Y4MWIwZDgyLTA5ZTEtMGQwMC05NWZlLWIyZGUwNzI1N2MwMy9kaWFncmFtcy8xLU9udG9VTUwgTW9kZWwuc3RvblBLAQIUAxQAAAAIANdRUVm8BEa8NgAAAD4AAABNAAAAAAAAAAAAAAC2gbMHAABwcm9qZWN0L21vZGVscy9mODFiMGQ4Mi0wOWUxLTBkMDAtOTVmZS1iMmRlMDcyNTdjMDMvZGlhZ3JhbXMvZXhwb3J0LWluZm8uanNvblBLAQIUAxQAAAAIANdRUVlMPQejMwAAADsAAABKAAAAAAAAAAAAAAC2gVQIAABwcm9qZWN0L21vZGVscy9mODFiMGQ4Mi0wOWUxLTBkMDAtOTVmZS1iMmRlMDcyNTdjMDMvbW9kZWwvZXhwb3J0LWluZm8uanNvblBLAQIUAxQAAAAIANdRUVm8/zJ9AQMAAHAOAABDAAAAAAAAAAAAAAC2ge8IAABwcm9qZWN0L21vZGVscy9mODFiMGQ4Mi0wOWUxLTBkMDAtOTVmZS1iMmRlMDcyNTdjMDMvbW9kZWwvbW9kZWwueG1sUEsFBgAAAAAIAAgAHgMAAFEMAAAAAA=='

]