class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_action :set_csrf_cookie_for_ng

  #set the auth token in cookies for later verification
  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def after_sign_in_path_for(resource)
    if current_user.admin?
      plans_path
    else
      root_path
    end
  end

  protected
  #Check the token sent in the request header is valid
  def verified_request?
    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  end
end
