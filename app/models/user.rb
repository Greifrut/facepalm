class User < ApplicationRecord
    # Authlogic 
    acts_as_authentic
    #
    mount_uploader :avatar, AvatarUploader
    #Зависимости для Friendship < User
    
    

    #Зависимость Post < User
    has_many :posts, dependent: :destroy

    #Зависимость Like < User
    has_many :likes, dependent: :destroy

    #Зависимость Comment < User
    has_many :comments, dependent: :destroy


    #Методы для Friendships




end
