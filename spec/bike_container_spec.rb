require 'bike_container'

class BikeHolder
	include BikeContainer
	
	def initialize
		@bikes = []
		@capacity = 1
	end
end

describe BikeContainer do
	let(:holder) {BikeHolder.new}
	let(:bike) {double :bike, working?: true}

	it "can dock a bike" do
		holder.dock bike
		expect(holder.bikes).to eq [bike]
	end

end