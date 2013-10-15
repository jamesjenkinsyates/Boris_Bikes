class Van

	def initialize bikes = []
		@bikes = bikes
	end

	def has_broken_bikes?
		!(@bikes.empty?)
	end

	def collect_broken_bike station
		station.release_bike
	end

end