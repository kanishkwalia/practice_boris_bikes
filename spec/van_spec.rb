require 'van'

describe Van do
	let(:van) { Van.new }
	let(:broken_bike) {double :bike, working?: false}
	let(:bike) {double :bike, working?: true}

	it "can have a default capacity" do
		expect(van.capacity).to eq 10
	end

	it "can have a custom capacity" do
		big_van = Van.new({capacity: 20})
		expect(big_van.capacity).to eq 20
	end

	it "can load a bike" do
		van.load broken_bike
		expect(van.bikes).to eq [broken_bike]
	end

	it "can release a bike" do
		van.load broken_bike
		van.release broken_bike
		expect(van.bikes).to eq []
	end

	it "knows if it is full" do
		10.times{van.load broken_bike}
		expect(van).to be_full
	end

	it "knows if its not full" do
		expect(van).not_to be_full
	end

	it "shouldn't load a bike if full" do
		10.times{van.load broken_bike}
		expect { van.load broken_bike }.to raise_error "The Van is full!"
	end

	it "should be able to collect broken bikes from a station" do
		docking_station = double :docking_station, bikes: [bike, broken_bike]
		allow(docking_station).to receive(:release)
		van.collect_broken_bikes_from docking_station
		expect(van.bikes).to eq [broken_bike]
	end

	it "should be able to remove broken bikes from a station when collecting broken bikes" do
		docking_station = double :docking_station, bikes: [bike, broken_bike]
		expect(docking_station).to receive(:release).with broken_bike
		van.collect_broken_bikes_from docking_station
	end

 end
