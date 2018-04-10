class Api::V1::SessionsController < Api::BaseController

  def create
    user_password = params[:user][:password]
    user_mobile_number = params[:user][:mobile_number]
    user = user_mobile_number.present? && User.find_by(mobile_number: user_mobile_number)

    if user.present? && user.valid_password?(user_password)
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
