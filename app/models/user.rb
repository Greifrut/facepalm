class User < ApplicationRecord
    #/Autchlogic 
    acts_as_authentic
    #/

    has_many :friendships, foreign_key: "requester_id", dependent: :destroy
    has_many :reverse_freindships, foreign_key: "requested_id",
                                   class_name: "Friendship",
                                   dependent: :destroy
    has_many :requesters, through: :reverse_freindships, source: :requester
end
