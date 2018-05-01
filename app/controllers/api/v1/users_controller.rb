class Api::V1::UsersController < Api::BaseController
  respond_to :json

  before_action :authenticate_with_token!, except: [:create]
  before_action :set_user, only: [:show, :update, :destroy]

  def show
    render_success(:show, :ok)
  end

  def create
    @user = User.new(user_params)

    if params[:user][:region]
    	region = Region.find(params[:user][:region][:id]) 
    	@user.region = region
    end

    if @user.valid? && @user.save
      UserMailer.welcome_email(@user).deliver_later
      render_success(:show, :created)
    else
      render_validation_error(:show, validation_message_maker(@user), 2000)
    end
  end

  def update
    email = params[:user][:email]
    if email.present?
      if @user.email != email
        render_error(t('text.user_can_not_be_updated_email_cannot_be_changed'), 2000)
        return
      end
    end

    if params[:user][:region]
      region = Region.find(params[:user][:region][:id]) 
      @user.region = region
    end

    if @user.valid? && @user.update(user_params)
      render_success(:show, :ok)
    else
      render_validation_error(:show, validation_message_maker(@user), 2000)
    end
  end

  def destroy
    user = User.find(params[:id])
    if user&.destroy
      render_success(nil, 204, "user destroyed succefully", nil)
    else
      render_fail('cannot destroy user')
    end
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
    params.require(:user).permit(:email, :mobile, :code, :image_content, :image_file_name, :first_name, :last_name, :password, :password_confirmation, :gender, :role_input, {addresses_attributes: [:id, :street_address, :floor_no, :building_no, :lat, :lng]} )
  end

  def set_user
    @user = current_user
  end

end
