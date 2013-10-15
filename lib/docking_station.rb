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
		@bikes.delete(working_bikes.first) 
	end

	def full?
		bike_count == @capacity
	end

	def fill_station station
		@capacity.times { station.dock(:bike) }
	end

	def working_bikes 
		@bikes.reject { |bike| bike.broken? }
	end

	def broken_bikes
		@bikes.select { |bike| bike.broken? }
	end

	def release_broken_bike
		@bikes.delete(broken_bikes.first)
	end

	def release_all_broken_bikes
		broken_bikes.map{ release_broken_bike}
	end

	def release_x_broken_bikes(x)
		broken_bikes[0,x].map{ release_broken_bike}
	end

end