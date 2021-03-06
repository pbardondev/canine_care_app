class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    helper_method :signed_in?, :current_user, :load_sitters

    def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by_session_token(session[:session_token])
    end

    def signed_in?
        !!current_user
    end

    def sign_in(user)
        user ||= User.find_by_credentials(user.email, user.password)
        session[:session_token] = user.reset_session_token!
        @current_user = user
    end

    def sign_out
        return false unless current_user
        current_user.reset_session_token!
        session[:session_token] = nil
        return true
    end

    def load_sitters
        Sitter.page(1).per(10).to_json
    end

    def ensure_signed_in!
        redirect_to "/" unless signed_in?
    end
end
