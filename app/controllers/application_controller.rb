class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :set_cache_buster
  before_filter :verify_routes
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  layout :detect_browser
  
  def default_url_options(options = nil)
    {:format => "html"}
  end
  
  
  private
  MOBILE_BROWSERS = ["android", "ipod", "opera mini", "blackberry", "palm","hiptop","avantgo","plucker", "xiino","blazer","elaine", "windows ce; ppc;", "windows ce; smartphone;","windows ce; iemobile", "up.browser","up.link","mmp","symbian","smartphone", "midp","wap","vodafone","o2","pocket","kindle", "mobile","pda","psp","treo"]

  def detect_browser
    agent = request.headers["HTTP_USER_AGENT"].downcase
    MOBILE_BROWSERS.each do |m|
      return "mobile/application" if agent.match(m)
    end
    return "application"
  end
  
  def verify_routes
        agent = request.headers["HTTP_USER_AGENT"].downcase
        MOBILE_BROWSERS.each do |m|
            redirect_to mobile_path if agent.match(m)
        end
  end
  
  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
  
  protected
  def local_request?
      false
  end
  
  def record_not_found
    redirect_to root_path
  end
  
end
