class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_request
  attr_reader :current_user
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token, raise: false

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
