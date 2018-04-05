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
    def friends
        active_friends | received_friends
    end

    def pending
      pending_friends | requested_friendships
    end

end
