class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def logged_in
    if session[:token] || session[:secret]
      return redirect_to user_path
    end
  end
end
