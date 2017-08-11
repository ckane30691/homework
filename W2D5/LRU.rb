class LRUCache
    def initialize(size)
			@size = size
			@cache = []
    end

    def count
      @cache.length
    end

    def add(el)
			if @cache.include?(el)
				@cache.delete(el)
				@cache << el
			elsif count >= @size
				@cache.shift
				@cache << el
			else
				@cahce << el
			end
			self
    end

    def show
      @cache
    end

  end
