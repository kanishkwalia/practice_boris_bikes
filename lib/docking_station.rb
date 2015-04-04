class DockingStation

	DEFAULT_CAPACITY = 20

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

	def capacity
		@capacity
	end

	def has_bikes?
		!@bikes.empty?
	end

	def dock(bike)
		raise "You can only dock a bike" unless bike.respond_to? :working?
		@bikes << bike
	end

	def available_bikes
		@bikes.select{|bike| bike.working?}
	end
end