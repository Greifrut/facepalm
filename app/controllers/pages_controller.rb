class PagesController < ApplicationController

    def index
      @post = current_user.posts.build
    end
end