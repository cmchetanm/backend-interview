class RewardsController < ApplicationController
	def create
	end

	private

	def reward_params
		params.require(:reward).permit(:name, :price)
	end
end