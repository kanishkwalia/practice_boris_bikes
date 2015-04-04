require 'van'

describe Van do
	let(:van) { Van.new }
	let(:bike) {double :bike}

	it "can have a default capacity" do
		expect(van.capacity).to eq 10
	end

	it "can have a custom capacity" do
		big_van = Van.new({capacity: 20})
		expect(big_van.capacity).to eq 20
	end

	it "can load a bike" do
		van.load bike
		expect(van.bikes).to eq [bike]
	end

	it "can release a bike" do
		van.load bike
		van.release bike
		expect(van.bikes).to eq []
	end

	it "knows if it is full" do
		10.times{van.load bike}
		expect(van).to be_full
	end

	it "knows if its not full" do
		expect(van).not_to be_full
	end

	it "shouldn't load a bike if full" do
		10.times{van.load bike}
		expect { van.load bike }.to raise_error "The van is full!"
	end
end
