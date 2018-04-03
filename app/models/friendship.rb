class Friendship < ApplicationRecord
    belongs_to :user
    belongs_to :friend, class_name: "Friend", foreign_key: :friend_id
end
