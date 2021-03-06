require 'van'

describe Van do

	let(:van) { Van.new }
	let(:bike) { double :bike, broken?: false }
	let(:broken_bike) { double :broken_bike, broken?: true }
	let(:station) { double :station }

	it 'can hold a bike' do
		van = Van.new [bike]
		expect(van).to have_bike
	end

	it 'can be empty' do
		expect(van).not_to have_bike
	end

	it 'collects a broken bike from a station' do
		station = double :station, { dock: nil, release_broken_bike: broken_bike }
		expect(station).to receive(:release_broken_bike)
		van.collect_broken_bike_from station
	end

	it 'has a broken bike after collecting a broken bike' do
		station = double :station, release_broken_bike: broken_bike 
		van.collect_broken_bike_from station		
		expect(van).to have_bike			
	end

	it 'knows how many bikes it has' do
		van = Van.new [broken_bike, broken_bike, broken_bike]
		expect(van.bike_count).to eq 3
	end

	it 'knows when it is full' do
		van = Van.new Array.new(10, broken_bike)
		expect(van).to be_full
	end 

	it 'knows how many free spaces there are' do
		van = Van.new Array.new(7, broken_bike)
		expect(van.slots_available).to eq 3
	end
		

	it 'can be filled with broken bikes' do
    # station = double :station, { release_x_broken_bikes: broken_bike }
		# expect(station).to receive(release_x_broken_bikes: broken_bike)
    
    van.fill_with_broken_bikes_from station
    expect(van.bike_count).to eq > 2
	end

	it 'has broken bikes after filling with broken bikes' do
		station = double :station, { release_x_broken_bikes: Array.new(10, broken_bike) }
		van.fill_with_broken_bikes_from station		
		expect(van.bike_count).to eq 10
	end

	it 'knows which bikes are working' do
		van = Van.new [bike, bike, bike, broken_bike, broken_bike]
		expect(van.working_bikes).to eq([bike, bike, bike])
	end

	it 'knows which bikes are broken' do
		van = Van.new [bike, bike, bike, broken_bike, broken_bike]
		expect(van.broken_bikes).to eq([broken_bike, broken_bike])
	end

	it 'returns all working bikes to a station' do
    station = double :station, { :slots_available => 7 }
  	van = Van.new [bike, bike, bike, bike, broken_bike]
  	van.dock_all_working_bikes station
  	expect(van.bike_count).to eq 1
	end

end