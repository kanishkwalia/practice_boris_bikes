require 'docking_station'

describe DockingStation do
	let(:old_street) { DockingStation.new }
	let(:bike) { double(:bike, {working?: true})}
	let(:broken_bike) { double(:broken_bike, {working?: false})}

	it "can have a default capacity" do
		expect(old_street.capacity).to eq 20
	end

	it "can have a custom capacity" do
		shoreditch = DockingStation.new({capacity: 50})
		expect(shoreditch.capacity).to eq 50
	end

	it "has no bikes when created" do
		expect(old_street).not_to have_bikes
	end

	it "can accept bikes" do
		old_street.dock(bike)
		expect(old_street).to have_bikes
	end

	it "raises an error when you're not docking a bike" do
		bike = 'Bike'
		expect { old_street.dock(bike) }.to raise_error "You can only dock a bike"
	end

	it "knows it has working bikes" do
		old_street.dock(broken_bike)
		old_street.dock(bike)
		expect(old_street.available_bikes).to eq [bike]
	end

end