class SessionsController < ApplicationController
    skip_before_action :authenticate_user_from_token!

    # POST /login
    def create
        # debugger
        @user = User.find_for_database_authentication(username: params[:username])
        return invalid_login_attempt unless @user

        if @user.valid_password?(params[:password])
            sign_in :user, @user
            render json: @user, serializer: SessionSerializer
        else
            invalid_login_attempt
        end
    end

    private

    def invalid_login_attempt
        warden.custom_failure!
        render json: {error: "Incorrect login"}, status: :unprocessable_entity
    end
end