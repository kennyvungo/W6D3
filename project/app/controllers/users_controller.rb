class UsersController < ApplicationController

    def index
        render plain: "I'm in the index action!"
        # @users = User.all
        # render json: @users
    end

    # def create
    #     @user = @users
    # end


end
