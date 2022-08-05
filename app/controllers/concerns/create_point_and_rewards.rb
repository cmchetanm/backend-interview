class CreatePointAndRewards
	private
		def call
			Account.each_slice(1000).each do |account|
				@account = account
				@user = account.user
				@transactions = account.transctions
				#For every $100 the end user spends they receive 10 points
				point_creadit
				#Create 5% reward
				reward_award
				#Create moview award
				create_movie_award
				#create standerd points
				standard_points
				#create quartly points
				quarterly_bonus
			end
		end

		def point_creadit
			every_tansactions = @transactions.where(point_creadit: false)
			return nil unless every_tansactions.where("amount >= ?", 100)
			every_tansactions.each do |trans|
				@account.points.create!(earning_point: 10)
				trans.update(point_creadit: true)
			end
		end

		def reward_award
			rebate_reward = @transactions.where("amount >= ?", 100)
			return nil unless rebate_reward.count >= 10
			@user.update(rebate_reward: true)
		end

		def create_movie_award
			user_date = @user.created_at
			date_within_60 = user_date+60.days
			amount = transactions.where(created_at: @user_date..date_within_60).sum(:amount)
			return nil unless amount >= 1000
			reward = Reward.find_by(name: 'Movie Tickets')
			@user.rewards << reward
		end

		def standard_points
			country_code = @user.country_code
			counts = @transactions.where.not(country_code: country_code).count
			counts.times { @account.points.create!(earning_point: 20) }
		end

		def quarterly_bonus
			user_date = @user.created_at
			months = user_date+3.months
			amount = @transactions.where(created_at: user_date..months).sum(:amount)
			return unless amount >= 2000
			@account.points.create!(earning_point: 100)
		end
end