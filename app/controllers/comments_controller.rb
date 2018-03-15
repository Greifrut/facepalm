class CommentsController < ApplicationController
    def create
        @comment = current_user.comments.build(comment_params)
        @comment.user_id = current_user.id

        if @comment.save
            flash[:succes] = "Коментарий создан"
            redirect_to root_path
        else
            flash[:danger] = "Ошибка"
            redirect_to root_path
        end
    end

    def destroy
      @comment = current_user.comments.find(params[:id])
      @comment.destroy
      redirect_to root_path
    end

    private 

        def comment_params
            params.require(:comment).permit(:content, :post_id)
        end
end
