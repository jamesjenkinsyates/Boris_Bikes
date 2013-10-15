require 'van'

describe Van do

	let(:van) { van = Van.new }
	let(:bike) { double :bike, broken?: false }
	let(:broken_bike) { double :broken_bike, broken?: true }

	it 'can hold a bike' do
		van = Van.new [bike]
		expect(van).to have_broken_bikes
	end

	it 'can be empty' do
		expect(van).not_to have_broken_bikes
	end

	it 'collect a broken bike from a station' do
		station = double :station, { dock: nil, release_bike: :bike }
		station.dock(broken_bike)
		expect(station).to receive(:release_bike)
		van.collect_broken_bike(station)
	end

	it 'van has a broken bike after collecting it from the station' do
		
	end


end