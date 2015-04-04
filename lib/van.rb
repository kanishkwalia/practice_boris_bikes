class Van

	DEFAULT_CAPACITY = 10
	attr_reader :bikes, :capacity

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

	def load bike
		raise "The van is full!" if full?
		bikes << bike
	end

	def release bike
		bikes.delete(bike)
	end

	def full?
		bikes.count == capacity
	end

end