class SessionsController < ApplicationController
    before_action :require_logged_out, only:[:new, :create]
    before_action :require_logged_in, only:[:destory]

    def show
    end 

    def new
    
    end 

    def update
    end 

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if @user
        login!(@user)
        redirect_to user_url(@user.id)

    end 

    def edit
    end 

    def destroy
        logout!
        redirect_to new_session_url
    end 
end
