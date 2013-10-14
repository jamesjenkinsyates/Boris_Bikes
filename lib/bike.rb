class Bike

	# attr_reader :broken
	
	def initialize (user = nil)
		@user = user
		fix
	end

	def has_user?
		!@user.nil?
	end

	def broken?
		@broken
	end

	def break
		@broken = true
	end

	def fix
		@broken = false
	end

end