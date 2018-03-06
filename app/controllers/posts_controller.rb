class PostsController < ApplicationController
    before_action :current_user_session

    def create
      @post = current_user.posts.build(post_params)

      if @post.save
        flash[:succes] = "Пост создан!"
        redirect_to root_path
      else
        redirect_to root_path
      end
    end

    def destroy
      
    end

    private

        def post_params
            params.require(:post).permit(:post)
        end
end
