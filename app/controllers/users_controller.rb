# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %i[login register]
  def register
    @user = User.create(user_params)
    if @user.save
      response = { message: 'User created successfully' }
      render json: response, status: :created
    else
      render json: @user.errors, status: :bad
    end
  end

  def login
    authenticate params[:email], params[:password]
  end

  def test
    render json: {
      message: 'You have passed the authentication and authorization test'
    }
  end

  private

  def authenticate(email, password)
    authentication = AuthenticateUser.call(email, password)

    if authentication.success?
      render json: {
        access_token: authentication.result,
        message: 'Login successful'
      }
    else
      render json: { error: authentication.errors }, status: :unauthorized
    end
  end

  def user_params
    params.permit(
      :name,
      :email,
      :password
    )
  end
end
