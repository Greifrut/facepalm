class Post < ApplicationRecord
    belongs_to :user
    validates :user_id, presence: true
    validates :post, presence: :true
    default_scope -> {order('created_at DESC')}
end
