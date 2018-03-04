class User < ApplicationRecord
    # Authlogic 
    acts_as_authentic
    #

    #Зависимости для User => Friendship
    has_many :active_friendships, class_name: "Friendship", foreign_key: "requester_id", dependent: :destroy
    has_many :pasive_friendships, class_name: "Friendship", foreign_key: "requested_id", dependent:  :destroy
    has_many :requesting, through: :active_friendships, source: :requested
    has_many :requesters, through: :pasive_friendships, source: :requester


    def friend_inviter(other_user)
        requesters << other_user
    end

    def unfriend(other_user)
        requesting.delete(other_user)
    end

    def requesters?(other_user)
        requesters.include?(other_user)
    end


end
