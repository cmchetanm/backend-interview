class CreateUserType
	attr_reader :users

	def initialize(users)
		@users = users
	end

	private
		def call
			@users.each do |user|
				point = user.account.points.pluck(:earning_point).sum rescue 0
				if point > 999 && point < 5000
					user.update(user_type: "gold")
				elsif point > 5000
					user.update(user_type: "platinum")
					reward = Reward.find_by(name: 'Airport Lounge Access')
					user.rewards << reward
				end
			end
		end
end


