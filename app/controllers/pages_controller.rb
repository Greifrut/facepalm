class PagesController < ApplicationController

    def index
      @post = current_user.posts.build if current_user
      @feed = current_user.posts.paginate(page: params[:page])
    end
end