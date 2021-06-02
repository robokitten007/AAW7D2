class UsersController < ApplicationController
before_action :require_logged_out, only: [:new, :create]
before_action :require_logged_in, only: [:show, :update, :destroy, :edit, :index]

    def index
        @users = User.all
        render :index
    end 

    def show
        @user = User.find(params[:id])
        render :show
    end 

    def create
        @user = User.new(user_params)
        if @user.save    #create a user and login immediately 
            login!(@user)
            redirect_to user_url(@user.id)
        else 
            render :new
    end 

    def new
        render :new
    end 

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_url(@user.id)
        else 
            render jason @user.errors.full_messages, status: :unprocessable_entity
    end 

    def edit
        @user = User.find(params[:id])
        render :edit
    end 

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_url
    end 

    protected 
    def user_params
        user_params = params.require(:user).permit(:email, :password) 
    end 
end
