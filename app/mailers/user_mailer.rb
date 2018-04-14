class UserMailer < ApplicationMailer
  require 'google/dynamic_link'

  def welcome_email(user, new_email=nil)
    new_email ||= user.email
    return if new_email.nil?
    @user = user
    @confirmation_url = Google::DynamicLink.generate_link(user_confirmation_path(:confirmation_token => @user.confirmation_token))
    mail(to: new_email, subject: 'Welcome to watch2you')
  end

  def reset_password_instruction(user, new_email=nil)
    new_email ||= user.email
    return if new_email.nil?
    @user = user
    # @reset_password_url = Google::DynamicLink.generate_link(user_confirmation_url(:confirmation_token => @user.confirmation_token))
    @reset_password_url = user_confirmation_url(:confirmation_token => @user.confirmation_token)
    mail(to: new_email, subject: 'watch2you Reset Password')
  end
end
