class User < ApplicationRecord
    # Authlogic 
    acts_as_authentic
    #
    mount_uploader :avatar, AvatarUploader
    #Зависимости для Friendship < User
    has_many :friendships
    has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"

    has_many :active_friends, -> { where(friendships: {accepted: true})}, through: :friendships, source: :friend
    has_many :received_friends, -> { where(friendships: {accepted: true})}, through: :received_friendships, source: :user
    
    has_many :pending_friends, -> { where(friendships: {accepted: false})}, through: :friendships, source: :friend
    has_many :requested_friendships, -> {where(friendships: {accepted: false})}, through: :received_friendships, source: :user
    #Зависимость Post < User
    has_many :posts, dependent: :destroy

    #Зависимость Like < User
    has_many :likes, dependent: :destroy

    #Зависимость Comment < User
    has_many :comments, dependent: :destroy


    #Методы для Friendships

    def request_sent(user)
        friendships.find_by(user_id: user, accepted: false)
    end

    def request_received(user)
        requested_friendships.where('friend_id=? AND accepted=0', user)
    end

    def friend(user)
        friendships.where('user_id=? OR friend_id=? AND accepted=1', user, user).limit(1).first
    end

    def friends(user)
        user.in?(active_friends) | user.in?(received_friends)
    end

    def pending(user)
      user.in?(pending_friends) | user.in?(requested_friendships)
    end

end
