class FriendshipsController < ApplicationController
  

    def create 
        friendships = Friendship.new(requester_id: params[:requester_id],
                                     requested_id: params[:requested_id],
                                     accepted: false)
        if friendships.save
            flash[:succes] = "Запрос отправлен"
            redirect_to root_path
        else
            flash[:danger] = "Successfully created..."
            redirect_back(fallback_location: posts_path)
        end    
    end

    def destroy
      friendship = Friendship.find_by(id: params[:id])
      flash[:danger] = "Друг удален"
      friendship.destroy
      redirect_to root_path
    end

    def update
        friendship = Friendship.find_by(id: params[:id]).update_attributes(accepted: true)

        if params[:accepted] == 'true'
            friendship.accepted = true
            friendship.save
            flash[:succes] = "Запрос принят"
            redirect_to root_path
        else
            redirect_to root_path
        end
    end

   
end
