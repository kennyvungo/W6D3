class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end

    def create
        @user = User.create(users_params)
        render json: @user
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_url
        #redirect us to User#index, which will render all of our users without the deleted user
    end

    def update
        @user = User.find(params[:id])
        if @user.update(users_params)
            # render json: @user
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, status: 422
        end
    end


    def users_params
        params.require(:user).permit(:username)
    end
end
