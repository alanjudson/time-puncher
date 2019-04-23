class ApplicationController < ActionController::Base

private

def require_signin
  unless current_user
    # redirects to intended url
    session[:last_url] = request.url
    redirect_to new_session_url, alert: "Sign in, please"
  end
end

def current_user
  User.find(session[:user_id]) if session[:user_id]
end

def current_user?(user)
  current_user == user
end

def require_admin
  unless current_user && current_user.admin?
    redirect_to root_url, alert: "You're not an admin, ask for a promotion."
  end
end

def current_user_admin?
  current_user && current_user.admin?
end

helper_method :current_user
helper_method :current_user?
helper_method :current_user_admin?

end
