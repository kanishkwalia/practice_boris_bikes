require 'bike_container'

class Van

	include BikeContainer

	DEFAULT_CAPACITY = 10

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

	def collect_broken_bikes_from station
		station.bikes.each {|bike| transfer(bike, to: station) unless bike.working?}
	end

	def transfer bike, to: station
		to.release(bike)
		load(bike)
	end

	alias_method :load, :dock
end