class ApplicationController < ActionController::Base

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'kouhei' && password == '7970'
    end
  end
end
