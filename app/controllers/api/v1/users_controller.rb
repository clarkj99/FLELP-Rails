class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def profile
    render json: { user: current_user }, status: :accepted
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: @user, jwt: @token }, status: :ok
    else
      render json: { statusText: @user.errors.full_messages[0] }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :display_name)
  end
end
