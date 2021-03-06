class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]

    def index 
        @users = User.all
    end 

    def new
        @user = User.new
    end

    def show
    end

    def edit
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have successfully signed up"
            redirect_to @user
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def update
       if @user.update(user_params)
            flash[:notice] = "Your account information was successfully updated"
            redirect_to @user 
       else
            render 'edit'
       end
    end

    private 

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end
end
