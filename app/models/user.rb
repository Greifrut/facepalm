class User < ApplicationRecord
    # Authlogic 
    acts_as_authentic
    #
    mount_uploader :avatar, AvatarUploader
    #Зависимости для Friendship < User
    has_many :friend_requesters, dependent: :destroy
    has_many :pending_friends, through: :friend_requesters, source: :friend


    #Зависимость Post < User
    has_many :posts, dependent: :destroy

    #Зависимость Like < User
    has_many :likes, dependent: :destroy

    #Зависимость Comment < User
    has_many :comments, dependent: :destroy


    #Методы для Friendships




end
