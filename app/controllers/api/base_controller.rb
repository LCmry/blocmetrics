class Api::BaseController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_filter :set_headers

  private

  def set_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
    headers['Access-Control-Max-Age'] = '1728000'
  end
end