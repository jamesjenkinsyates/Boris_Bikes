class Van

	def initialize bikes = [], capacity = 10
		@bikes = bikes
		@capacity = capacity
	end

	def has_bike?
		!(@bikes.empty?)
	end

	def collect_broken_bike_from station
		@bikes << station.release_broken_bike
	end

	def bike_count
		@bikes.count
	end

	def full?
		bike_count == @capacity
	end

	def slots_available
		@capacity - bike_count
	end

	def fill_with_broken_bikes_from station
		@bikes = station.release_x_broken_bikes(slots_available)
	end

	def working_bikes 
		@bikes.reject { |bike| bike.broken? }
	end

	def broken_bikes
		@bikes.select { |bike| bike.broken? }
	end

	def dock_working_bike
		@bikes.delete(working_bikes.first)
	end

end