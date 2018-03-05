class FriendshipsController < ApplicationController

    def create 
        friendships = Friendship.new(requester_id: params[:requester_id],
                                     requested_id: params[:requested_id],
                                     accepted: false)
        friendships.save
        flash[:succes] = "Запрос отправлен"
        redirect_to root_path
    end

    def destroy
      friendship = Friendship.find_by(id: params[:id])
      flash[:danger] = "Друг удален"
      friendship.destroy
      redirect_to root_path
    end

    def update
        friendship = Friendship.find_by(id: params[:id])

        if params[:accepted_requested_id] == 'true'
            friendship.accepted = true
            friendship.save
            flash[:succes] = "Запрос принят"
            redirect_to root_path
        else
            redirect_to root_path
        end
    end
end
