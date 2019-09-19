class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validates :user, presence: true
  validates :friend, presence: true, uniqueness: { scope: :user }
  validate :friend_self, :already_friends


  def accept
    user.friends << friend
    destroy
  end

  def already_friends
    if user.friends.include?(friend)
      errors.add(:friend_id, "already friends")
    end
  end

  def friend_self
    if friend_id == user_id
      errors.add(:friend_id, "can't friend self")
    end
  end
end
