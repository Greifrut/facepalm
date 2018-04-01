class PostsController < ApplicationController
    before_action :current_user_session

    def new
      @post = Post.new
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

    def destroy
      
    end

    private

        def post_params
            params.require(:post).permit(:post, :title, :summary)
        end
end
