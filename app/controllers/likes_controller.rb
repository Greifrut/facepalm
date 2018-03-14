class LikesController < ApplicationController

    def create
    @post = Post.find(params[:post_id])    
    @like = current_user.likes.build(post_id: params[:post_id])

      if @like.save 
        flash[:succes] = "Мне нравится"
        redirect_to root_path
      else 
        flash[:danger] = "Ошибка"
      end
    end
    
    def destroy
      @like = current_user.likes.find(params[:id])
      @like.destroy
      redirect_to root_path
    end

end
