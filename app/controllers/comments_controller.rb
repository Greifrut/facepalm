class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = current_user.comments.build(post_id: params[:post_id])

        if @commetn.save
            flash[:succes] = "Коментарий создан"
            redirect_to root_path
        else
            flash[:danger] = "Ошибка"
            redirect_to root_path
        end
    end

    def show 
        
    end

    def destroy
      @comment = current_user.comments.find(params[:id])
      @comment.destroy
      redirect_to root_path
    end
end
