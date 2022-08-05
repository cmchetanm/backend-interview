class CreateBirthdayReward
	attr_reader :users
	def initialize(users)
		@users = users
	end

	private
	def call
		@users.each do |user|
			reward = Reward.find_by(name: "Coffee")
			user.rewards << reward
		end
	end
end