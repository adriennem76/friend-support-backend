class User < ApplicationRecord
  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :support_items
  
  def requests_received
    FriendRequest.select{|request| request.friend_id == id}
  end

  def requested_friends
    User.select{
      |user| user.friend_requests.any? {
        |request| request.friend_id == self.id}
    }
  end

  def remove_friend(friend)
    self.friends.destroy(friend)
   end
end
