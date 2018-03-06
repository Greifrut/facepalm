class PagesController < ApplicationController

    def index
      @post = current_user.posts.build if current_user
    end
end