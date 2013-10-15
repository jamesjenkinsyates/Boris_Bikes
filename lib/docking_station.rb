class DockingStation

	def initialize bikes = [], capacity = 20 
		@bikes = bikes
		@capacity = capacity
	end

	def bike_count
		@bikes.count
	end

	def dock bike
		raise "Station is full" if full?
		@bikes << bike
	end

	def release_bike
		raise "There are no bikes in this station" if @bikes.empty?
		@bikes.pop 
	end

	def full?
		bike_count == @capacity
	end

	def fill_station station
		@capacity.times { station.dock(:bike) }
	end

	def available_bikes 
		@bikes.reject { |bike| bike.broken? }
	end

	def broken_bikes
		@bikes.select { |bike| bike.broken? }
	end

end