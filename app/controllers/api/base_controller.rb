class Api::BaseController < ApplicationController
  include Authenticable

  before_action :restrict_access_token
  protect_from_forgery with: :null_session

  def authenticate_with_token!
    render json: {status: 'fail', message: 'Not Authorized'}, status: 401   unless user_signed_in?
  end

  def user_signed_in?
    current_user.present?
  end

  def trim_string st, all = nil
    if all.nil?
      st = st.gsub(/ +/, " ")
    else
      st = st.gsub(/\s+/, "")
    end
  end

  def render_success(action, status = :ok, message=nil, resource=nil)
    @response = {success: true, message: message, resource: resource}
    if action.is_a? Symbol
      render action, layout: 'jsend', status: status
    else
      @response = {success: true, data: action, message: message, code: :ok}
      render :partial => 'api/v1/errors', layout: 'jsend', status: :ok, :formats => [:json]
    end
  end

  def render_validation_error(action, message, code=1)
    @response = {fail: true, message: message, code: code}
    render action, layout: 'jsend', status: 422
  end

  def render_fail(message, code=2001, data={})
    @response = {fail: true, message: message, code: code}
    render :partial => 'api/v1/errors', layout: 'jsend', status: :ok, :formats => [:json]
  end

  def render_error(message, code=2000, data={})
    @response = {error: true, message: message, code: code}
    render :partial => 'api/v1/errors', layout: 'jsend', status: :ok, :formats => [:json]
  end

  private
  def restrict_access_token
    unless restrict_access_by_api_token_header
      render_fail(t('text.invalid_api_key').titleize, 6)
    end
  end

  def restrict_access_by_api_token_header
    token = nil
    #check for token
    if request.headers['ApiKey'] && request.headers['ApiKey'].include?('key=')
      tokens = request.headers['ApiKey'].split(',')
      tokens.each do |line|
        token = line.slice(line.index('key=')+4..line.size)
        break if token
      end
    end
    if token && token.size >0
      token == '1d7801c576b33db841d59216d8cf91d4'
    else
      false
    end
  end
end
