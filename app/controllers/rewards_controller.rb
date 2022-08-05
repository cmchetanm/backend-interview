class RewardsController < ApplicationController
	def create
		client = User.find_by(id: 1)
		if client.client_id.nil?
			@reward = client.rewards.new(reward_params)
			if @reward.save
				render json: { data: @reward }
			else
				byebug
				render json: { errors: @reward.errors }
			end
		else
			render json: { message: "you are not authorize to access this page." }
		end
	end

	def purchase_reward
	end

	private

	def reward_params
		params.require(:reward).permit(:name, :price)
	end
end