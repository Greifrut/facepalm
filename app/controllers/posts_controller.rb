class PostsController < ApplicationController
    before_action :current_user_session
    layout "post", only: [:show]

    def show
      @post = Post.find(params[:id])
    end

    def new
      @post = Post.new
    end

    def index
      @posts = current_user.posts.paginate(page: params[:page])
    end

    def create
      @post = current_user.posts.build(post_params)

      if @post.save
        flash[:succes] = "Пост создан!"
        redirect_to current_user
      else
        redirect_to current_user
      end
    end
    
    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])
      if @post.update_attributes(post_params)
        flash[:succes] = "Successfully created..."
        redirect_to posts_path(current_user)
      else
        flash[:danger] = "Error"
      end
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path(current_user)
    end

    private

        def post_params
            params.require(:post).permit(:post, :title, :summary)
        end
end
