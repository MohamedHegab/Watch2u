class Api::V1::SessionsController < Api::BaseController

  def create
    user = User.where(email: params[:user][:email]).first
    if user&.valid_password?(params[:user][:password])
      sign_in user, store: false
      user.generate_authentication_token!
      user.save
      # render json: {status: 'success', data: user}
      render_success(nil, :ok, "user is signed in", user)
    else
      render_fail('invalid email or password')
    end
  end

  def destroy
    authenticate_with_token!
    if current_user
      current_user.generate_authentication_token!
      current_user.save
      render_success(nil, 204, "user signed out succefully", current_user)
      # render json: {status: 'success', data: current_user}
    else
      # render_fail('There user not signed in')
    end
  end
end
