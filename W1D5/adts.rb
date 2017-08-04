class Stack

	def initialize
		@my_stack = []
	end

	def add(el)
		@my_stack << el
	end

	def remove
		@my_stack.pop
	end

	def show
		@my_stack
	end
end
