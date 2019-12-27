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

  def show
    render json: @current_user.attributes.with_indifferent_access.slice(:name, :email).as_json
  end

  def update
    @current_user.update(name: params[:name])
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
