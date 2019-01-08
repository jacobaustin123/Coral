def getfn():
	def bar():
		return 1
	if True:
		def bar():
			return 2
	return bar


print(getfn()())
