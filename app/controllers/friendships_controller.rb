class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id], accepted: false)
    if @friendship.save
      redirect_to root_path, notice: "Friend requested."
    else
      redirect_to users_path, error: "Unable to request friendship"
    end
  end

  def update
    @friendship = Friendship.find_by(params[:id])
    @friendship.update_attributes(accepted: true)
    if @friendship.save
      redirect_to root_path, notice: "Successfuly confirmed friend!"
    else
      redirect_to users_path, notice: "Sorry! Could not confirm friend!"
    end
  end

  def destroy
    @friendship = Friendship.find_by(params[:id])
    @friendship.destroy
    redirect_to root_path
  end

    

end
