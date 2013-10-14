class Bike

	# attr_reader :broken
	
	def initialize (user = nil)
		@user = user
		@broken = false
	end

	def has_user?
		!@user.nil?
	end

	def broken?
		@broken
	end

end