class Mobile::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :verify_routes
  
  protect_from_forgery with: :exception
  layout 'mobile/application'
  
  helper_method :current_user 
  
  private
  MOBILE_BROWSERS = ["android", "ipod", "opera mini", "blackberry", "palm","hiptop","avantgo","plucker", "xiino","blazer","elaine", "windows ce; ppc;", "windows ce; smartphone;","windows ce; iemobile", "up.browser","up.link","mmp","symbian","smartphone", "midp","wap","vodafone","o2","pocket","kindle", "mobile","pda","psp","treo"]
  
  def detect_browser
    agent = request.headers["HTTP_USER_AGENT"].downcase
    MOBILE_BROWSERS.each do |m|
      if agent.match(m)
          return "mobile/application"
      else
          return "application"
      end
    end
    
  end
  
  def verify_routes
        @value = false
        agent = request.headers["HTTP_USER_AGENT"].downcase
        MOBILE_BROWSERS.each do |m|
            if agent.match(m)
                @value = true
            end
        end
        
        if @value == false
            redirect_to 'http://daithuvien.com'
        else
            
        end
  end
  
end
