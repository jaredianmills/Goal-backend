class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    end
  end


  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:user_name, :email, :phone_number)
  end
end
