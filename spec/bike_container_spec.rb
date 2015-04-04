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

	it "can release a bike" do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.working_bikes).to eq []
	end

	it "knows if it is full" do
		1.times{holder.dock bike}
		expect(holder).to be_full
	end

	it "knows if its not full" do
		expect(holder).not_to be_full
	end

	it "shouldn't load a bike if full" do
		1.times{holder.dock bike}
		expect { holder.dock bike }.to raise_error "The BikeHolder is full!"
	end


end