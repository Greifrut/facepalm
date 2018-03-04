class FriendshipsController < ApplicationController

    def create 
        friendships = Friendship.new(requester_id: current_user.id,
                                     requested_id: params[:requested_id],
                                     accepted_requester_id: true,
                                     accepted_requested_id: false)
        flash[:succes] = "Запрос отправлен"
        redirect_to root_path
    end

    def destroy
      @user = Friendship.find(params[:id]).requested
      current_user.unfriend(@user)
      redirect_to root_path
    end

    def update
        friendships = Friendship.find(params[:id])

        if params[:accepted_requested_id] == 'true'
            friendship.accepted = true
            friendship.save
            redirect_to root_path
        else
            redirect_to root_path
        end
    end
end
