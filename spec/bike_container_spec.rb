require 'bike_container'

shared_examples "a bike container" do

		let(:container) { described_class.new }
		let(:bike) {double :bike, working?: true}

		it "can dock a bike" do
			container.dock bike
			expect(container.bikes).to eq [bike]
		end

		it "can release a bike" do
			container.dock(bike)
			container.release(bike)
			expect(container.working_bikes).to eq []
		end

		it "knows if it is full" do
			container.capacity.times {container.dock bike}
			expect(container).to be_full
		end

		it "knows if its not full" do
			expect(container).not_to be_full
		end

		it "shouldn't load a bike if full" do
			container.capacity.times { container.dock bike }
			expect { container.dock bike }.to raise_error "The #{described_class} is full!"
		end
	end








