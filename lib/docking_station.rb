class DockingStation

	def initialize 
		@bikes = []
	end

	def bike_count
		@bikes.count
	end

	def dock bike
		@bikes << bike
	end

	def release bike
		@bikes.delete(bike) if @bikes.include? bike
		"That bike is not in this docking station"
	end

	def full?
		@bikes.count == 20
	end

end