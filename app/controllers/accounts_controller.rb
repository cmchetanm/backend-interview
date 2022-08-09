class AccountsController < ApplicationController
  before_action :load_account, only: %i[update show]

  def show
    render json: { data: @account }, status: :ok
  end

  def update
    if params[:balance].present?
      if @account.update(balance: (@account.balance.to_f + params[:balance].to_f))
        render json: { data: @account }, status: :ok
      else
        render json: { error: @account.errors }, status: :unprocessable_entity
      end
    else
      render json: { error: "balance not present!" }, status: :unprocessable_entity
    end
  end

  private

  def load_account
    user = User.find_by(id: params[:id])
    @account = user&.account

    return if @account

    render json: { message: "user account with user id #{params[:id]} not found" }
  end
end
