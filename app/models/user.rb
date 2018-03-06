class User < ApplicationRecord
    # Authlogic 
    acts_as_authentic
    #

    #Зависимости для Friendship < User
    has_many :active_friendships, class_name: "Friendship", foreign_key: "requester_id", dependent: :destroy
    has_many :pasive_friendships, class_name: "Friendship", foreign_key: "requested_id", dependent:  :destroy
   
    has_many :friends, -> {where("active_friendships.accepted" == true)}, through: :active_friendships, source: :requested
    has_many :inverse_friends, -> {where("active_friendships.accepted" == true)}, through: :pasive_friendships, source: :requester

    has_many :sent_requests, -> {where("active_friendships.accepted" == false)}, through: :active_friendships, source: :requested
    has_many :requests_received, -> {where("active_friendships.accepted" == false)}, through: :pasive_friendships, source: :requester

    #Зависимость Post < User
    has_many :posts, dependent: :destroy


    def is_friend?(other_user)
        other_user.in?(friends) || other_user.in?(inverse_friends)
    end

    def find_accepted_friendships?(other_user)
        active_friendships.where(accepted: true).limit(1).first
    end

    def request_sent(other_user)
        active_friendships.find_by(requester_id: other_user, accepted: false)
    end

    def request_received(other_user)
        pasive_friendships.find_by(requester_id: other_user, accepted: false)
    end



end
