class AuthController < ApplicationController
  def signup
    user = User.new(user_params)

    if user.save
      token = JsonWebToken.encode(user_id: user.id,
                                  email: user.email
                                 )
      render json: { token: token }, 
             status: :created
    else
      render json: { errors: user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate params[:password]
      token = JsonWebToken.encode(user_id: user.id,
                                  email: user.email
                                 )
      render json: { token: token }, status: :ok
    else
      render json: { error: "Invalid credentials mister" },
             status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:email,
                  :password,
                  :password_confirmation)
  end
end
