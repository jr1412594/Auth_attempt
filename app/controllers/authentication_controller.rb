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
                secret = 'only tell this to the bouncer'
                payload = {user_id: @user.id}
                token = JWT.encode(payload, secret)

                render json: {token: token}
            end
        end
    end
end
