class User < ApplicationRecord
    # Authlogic 
    acts_as_authentic
    #
    mount_uploader :avatar, AvatarUploader
    #Зависимости для Friendship < User
    has_many :friend_requesters, dependent: :destroy
    has_many :pending_friends, through: :friend_requesters, source: :friend

    has_many :friendships, dependent: :destroy
    has_many :friends, through: :friendships


    #Зависимость Post < User
    has_many :posts, dependent: :destroy

    #Зависимость Like < User
    has_many :likes, dependent: :destroy

    #Зависимость Comment < User
    has_many :comments, dependent: :destroy


    #Методы для Friendships
    def remove_friend(friend)
        current_user.friends.destroy(friend)
    end



end
