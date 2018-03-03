class Frendship < ApplicationRecord
    belongs_to :requester, class: "User"
    belongs_to :requested, class: "User"
    validates :requester_id, presence: true
    validates :requested_id, presence: true
end
