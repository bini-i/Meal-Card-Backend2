class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session,
      if: Proc.new { |c| c.request.format =~ %r{application/json} }
        
    before_action :authenticate_user_from_token!

    def authenticate_user_from_token!
        auth_token = request.headers['Authorization']

        if auth_token
            authenticate_with_auth_token auth_token
        else
            authentication_error
        end
    end

    private
    def authenticate_with_auth_token auth_token
        unless auth_token.include?(':')
            authentication_error
            return
        end

        user_id = auth_token.split(':').first
        user = User.where(id: user_id).first

        if user && Devise.secure_compare(user.access_token, auth_token)
            #User can access
            sign_in user, store: false
        else
            authentication_error
        end
    end

    ##
    # Authentication Failure
    # Renders a 401 error
    def authentication_error
        # User's token is either invalid or not in the right format
        render json: {error: "Incorrect login"}, status: 401 # Authentication timeout
    end
end
