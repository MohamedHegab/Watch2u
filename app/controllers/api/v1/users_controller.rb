class Api::V1::UsersController < Api::BaseController
  respond_to :json

  def show
    respond_with User.find(params[:id])
  end

  def create
    user = User.find_or_initialize_by(mobile_number: user_params['mobile_number'])
    if user.id.nil?
      user = User.new(user_params)
      unless user.save(validate: false)
        render json: {status: 'fail', data: user, message: user.errors.full_messages.first}
        return
      end
    end
    render json: {status: 'success', data: user, message: t('verify_your_account')}
  end

  def update
    user = User.find_by(id: params[:id])

    if user.update(user_params)
      render json: user, status: 200, location: [:api, user]
    else
      render json: {errors: user.errors}, status: 422
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    head 204
  end

  def create_guest
    user = User.new
    unless user.save(validate: false)
      render json: {status: 'fail', data: user, message: user.errors.full_messages.first}
    else
      render json: {status: 'success', data: user, message: t('created_successfully')}
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :mobile, :code, :region, :address, :first_name, :last_name, :password, :password_confirmation, )
  end

end
