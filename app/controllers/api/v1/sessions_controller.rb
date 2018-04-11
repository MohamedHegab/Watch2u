class Api::V1::SessionsController < Api::BaseController

  def create
    user = User.where(email: params[:user][:email]).first
    if user&.user.valid_password?(params[:password])
      sign_in user, store: false
      user.generate_authentication_token!
      user.save
      render json: {status: 'success', data: user}
    else
      render json: {status: 'fail', data: nil, message: 'invalid user name or password ' }
    end
  end

  def destroy
    user = User.find_by(auth_token: params[:id])
    user.generate_authentication_token!
    user.save
    head 204
  end
end
