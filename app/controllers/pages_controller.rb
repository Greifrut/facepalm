class PagesController < ApplicationController

    def index
      @post = current_user.posts.build if current_user
      @feed = current_user.posts.paginate(page: params[:page]) if current_user
      @comment = current_user.comments.build if current_user
    end
end