class ActiveAdmin::Devise::SessionsController
	include ::ActiveAdmin::Devise::Controller

	def create
		if params[:user].present?
			email = params[:user][:email]
			password = params[:user][:password]
			admin_user = User.find_by_email(email)
			if admin_user.present? && admin_user.valid_password?(password) && (admin_user.has_role? :admin)
				@admin_user = admin_user
				sign_in @admin_user
				flash[:success] = "Signed in successfully"

				redirect_to after_sign_in_path_for(admin_user)
			else
				flash[:error] = "Wrong user credentials"
				# render plain: "OK"
				redirect_to root_path
			end
		else
			flash[:error] = "No User"
			# format.html { render action: "edit" }
			# render plain: "OK"
			redirect_to root_path
		end
	end

end