class FriendRequest < ApplicationRecord
  validates :user, presence :true
  validates :friend, presence :true, uniqueness: {scope: :user}
  
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def accept
    user.friends << friend
    destroy
  end
end
