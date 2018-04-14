class Api::V1::SessionsController < Api::BaseController

  def create
    user = User.where(email: params[:user][:email]).first
    if user&.valid_password?(params[:user][:password])
      sign_in user, store: false
      user.generate_authentication_token!
      user.save
      render json: {status: 'success', data: user}
      # render_success(:create, :ok, nil, user)
    else
      render_fail('invalid user name or password')
    end
  end

  def destroy
    authenticate_with_token!
    if current_user
      current_user.generate_authentication_token!
      current_user.save
      head 204
      render json: {status: 'success', data: user}
    end
  end
end
