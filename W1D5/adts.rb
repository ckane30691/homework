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

class Queue

	def initialize
		@my_queue = []
	end

	def enqueue(val)
		@my_queue.unshift(val)
	end

	def dequeue
		@my_queue.pop
	end

	def show
		@my_queue
	end

end

class Map

	def initialize
		@my_map = []
	end

	def assign(k, v)
		if @my_map.empty?
			@my_map << [k, v]
		else
		  @my_map.each do |sub_arr|
				if sub_arr[0] == k
					sub_arr[1] = v
					return self
				end
			end
			@my_map << [k, v]
		end
	end

	def lookup(k)
		@my_map.each { |sub_arr| return sub_arr[1] if sub_arr[0] == k }
	end

	def remove(k)
		@my_map.delete_if { |sub_arr| sub_arr[0] == k }
	end

	def show
		@my_map
	end

end
