class UsersController < ApplicationController
  before_action :current_user, only: [:show, :edit, :update, :index]

    def show
      @user = User.find(params[:id])
      @posts = @user.posts.paginate(page: params[:page]) 
      @comment = current_user.comments.build if current_user
    end

     def index
      @users = User.paginate(page: params[:page])
    end

    def new
      @user = User.new
    end

    def create
      
        @user = User.new(users_params)
      if @user.save
        flash[:succes] = "Аккаунт зарегестрирован!"
        redirect_to root_path
      else
        render :new
      end

    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(users_params)
        flash[:succes] = "Successfully update"
      else
        flash[:danger] = "Update wrong!"
      end
    end
    private 

    def users_params
        params.require(:user).permit(:email, :password,
                                    :password_confirmation,
                                    :name, :surname, :avatar)
    end
end