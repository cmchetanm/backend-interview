class UsersController  < ApplicationController
  before_action :load_client, only: :create
  before_action :load_user, only: %i[update show destroy]

  def index
    @users = User.all

    render json: { data: @users }
  end

  def show
    render json: { data: @user }
  end

  def create
    @user = User.new(user_params.merge(client_id: @client.id))
    if @user.save
      render json: { data: @user }, status: :created
    else
      render json: { error: @user.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: { data: @user }, status: :ok
    else
      render json: { error: @user.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      render json: { message: "user Deleted" }, status: :ok
    else
      render json: { error: @user.errors }, status: :unprocessable_entity
    end
  end

  private

  def load_user
    @user = User.find_by(id: params[:id])

    return if @user

    render json: { message: "user with id #{params[:id]} not found" }
  end

  def load_client
    @client = User.load_client

    return if @client

    render json: { message: "client is not exist please run `rake db:seed` to continue" }
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :address, :dob, :gender, :full_phone_number)
  end
end
