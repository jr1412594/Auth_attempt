class AuthenticationController < ApplicationController
    def login
        @user = User.find_by username: params[:username]

        if !@user
            render json: {message: "Incorrect username or password"}, 
            status: :unauthorized
        else
            # byebug
           if !@user.authenticate(params[:password])
            render json: {message: "Incorrect username or password"}, 
            status: :unauthorized
           else
        end
        end
    end
end
