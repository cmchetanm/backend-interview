class RewardsController < ApplicationController
  before_action :load_user, :load_reward, only: :purchase_reward

  def index
    render json: { data: Reward.all }
  end

  def create
    client = User.load_client
    if client.client_id.nil?
      @reward = client.rewards.new(reward_params)
      if @reward.save
        render json: { data: @reward }
      else
        render json: { errors: @reward.errors }
      end
    else
      render json: { message: "you are not authorize to access this page." }
    end
  end

  def purchase_reward
    price = check_reward_discount
    transaction = @user.account.transactions.create(
      amount: price,
      country_code: @user.country_code,
      status: 0
      )
    if transaction.errors.empty? && transaction.valid?
      @user.rewards << @reward
      render json: { data: { transaction: transaction, account_details: @user.account, rewards: @user.rewards } }
    else
      render json: { errors: transaction.errors }
    end
  end

  def point
    user = User.find_by(id: params[:user_id])
    if user.present?
      render json: { data: user.account.points }
    else
      render json: { message: "user with id #{params[:user_id]} not found" }
    end
  end

  private

  def check_reward_discount
    return @reward.price unless @user.rebate_reward
    discount = (@reward.price)*(5/100.0)
    (@reward.price) - (discount)
  end

  def load_user
    @user = User.find_by(id: params[:data][:user_id])

    return if @user

    render json: { message: "user with id #{params[:data][:user_id]} not found" }
  end

  def load_reward
    @reward = Reward.find_by(id: params[:data][:reward_id])

    return if @reward

    render json: { message: "reward with id #{params[:data][:reward_id]} not found" }
  end

  def reward_params
    params.require(:reward).permit(:name, :price)
  end
end
