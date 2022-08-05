class CreatePointAndRewards
	private
		def call
			Account.each_slice(1000).each do |account|
				@account = account
				@user = account.user
				@transactions = account.transctions
				#Create $100 Point on every 10 transations
				point_creadit
				#Create 5% reward
				reward_award
				#Create moview award
				create_movie_award
			end
		end

		def point_creadit
			every_ten_tansactions = @transactions.where(point_creadit: false)
			return unless every_ten_tansactions.sum(:amount) >= 100
			@account.points.create!(earning_point: 10)
			every_ten_tansactions.update_all(point_creadit: true)
		end

		def reward_award
			rebate_reward = @transactions.where("amount >= ?", 100)
			return unless rebate_reward.count >= 10
			@user.update(rebate_reward: true)
		end

		def create_movie_award
			user_date = @user.created_at
			date_within_60 = user_date+60.days
			amount = transactions.where(created_at: @user_date..date_within_60).sum(:amount)
			return unless amount >= 1000
			reward = Reward.find_by(name: 'Movie Tickets')
			@user.rewards << reward
		end
end