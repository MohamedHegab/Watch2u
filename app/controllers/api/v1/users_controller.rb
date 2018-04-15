class Api::V1::UsersController < Api::BaseController
  respond_to :json

  before_action :authenticate_with_token!, except: [:create]
  before_action :set_user, only: [:show, :update]

  def show
    render_success(:show, :ok)
  end

  def create
    @user = User.new(user_params)
    
    if @user.valid? && @user.save
      UserMailer.welcome_email(@user).deliver_later
      render_success(:show, :created)
    else
      render_validation_error(:show, t('text.user_can_not_be_created'), 2000)
    end
  end

  def update
    email = params[:user][:email]
    if email.present?
      if @user.email != email
        render_error(t('text.user_can_not_be_updated_email_cannot_be_changes'), 2000)
        return
      end
    end
    if @user.valid? && @user.update(user_params)
      render_success(:show, :ok)
    else
      render_validation_error(:show, t('text.user_can_not_be_updated'), 2000)
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    head 204
  end

  # def create_guest
  #   user = User.new
  #   unless user.save(validate: false)
  #     render json: {status: 'fail', data: user, message: user.errors.full_messages.first}
  #   else
  #     render json: {status: 'success', data: user, message: t('created_successfully')}
  #   end
  # end

  private

  def user_params
    params.require(:user).permit(:email, :mobile, :code, :region, :address, :first_name, :last_name, :password, :password_confirmation, :gender, :role_input )
  end

  def set_user
    @user = User.find(params[:id])
  end

end
