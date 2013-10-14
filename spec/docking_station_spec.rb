require 'docking_station'

describe DockingStation do 

	let(:station) { DockingStation.new }

	it 'can accept a bike' do
		bike = double :bike
		expect(station.bike_count).to eq 0		
		station.dock(bike)
		expect(station.bike_count).to eq 1
	end

	it 'should release a bike' do
		bike = double :bike
		station.dock(bike)
		expect(station.bike_count).to eq 1
		station.release(bike)
		expect(station.bike_count).to eq 0
	end

	it 'should tell you if the bike you want to release is not at the station' do
		bike = double :bike
		expect(station.release(bike)).to eq "That bike is not in this docking station"
	end

	it 'should know if the station is full' do
		bike = double :bike
		20.times { station.dock(bike) }
		expect(station).to be_full
	end

	it 'should know if the station is not full' do
		bike = double :bike
		19.times { station.dock(bike) }
		expect(station).not_to be_full
	end

	it 'should not let you dock a bike if the station is full' do
		bike = double :bike
		20.times { station.dock(bike) }
		
	end
end