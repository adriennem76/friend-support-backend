class Friendship < ApplicationRecord
  after_create :create_inverse_relationship
  after_destroy :destroy_inverse_relationship
  validates :user, presence: true
  validates :friend, presence: true, uniqueness: { scope: :user }
  validate :friend_self
  
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def friend_self
    if friend_id == user_id
      errors.add(:friend_id, "can't friend self")
    end
  end

  private

  def create_inverse_relationship
    friend.friendships.create(friend: user)
  end

  def destroy_inverse_relationship
    friendship = friend.friendships.find_by(friend: user)
    friendship.destroy if friendship
  end
end
