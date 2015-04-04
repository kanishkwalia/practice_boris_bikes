module BikeContainer
	attr_reader :bikes, :capacity

	def dock(bike)
		raise "The docking station is full!" if full?
		raise "You can only dock a bike" unless bike.respond_to? :working?
		@bikes << bike
	end

	def full?
		@bikes.count == capacity
	end

end