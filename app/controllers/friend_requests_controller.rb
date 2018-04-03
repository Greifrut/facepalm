class FriendRequestsController < ApplicationController
    before_action :set_friend_request, except: [:index, :create]
    
    def create
      friend = User.find(params[:friend_id])
      @friend_request = current_user.friend_requests.new(friend: friend)

      if @friend_request.save
        redirect_to root_path
      end
    end
    
    def index
      @incoming = FriendRequest.where(friend: current_user)
      @outgoing = current_user.friend_requests
    end

    def update
      @friend_request.accept
      head :no_content
    end

    def destroy
      @friend_request.destroy
    end

    private
        def set_friend_request
            @friend_request = FriendRequest.find(params[:id])
        end
end
