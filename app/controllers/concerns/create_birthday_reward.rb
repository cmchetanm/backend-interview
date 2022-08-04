class CreateBirthdayReward
	attr_reader :users
	def initialize(users)
		@users = users
	end

	private
		def call
			@users.each do |user|
				account = user.account
				account.reward.push("A Free Coffee reward")
				reward.save!
			end
		end
end