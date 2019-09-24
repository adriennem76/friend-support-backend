class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :support_items, :friends, :pending_friends, :friend_requests
  has_many :requests_received
  has_many :requested_friends
  def requests_received
    self.object.requests_received.map do |request|
    {id: request.id,
    friend_id: request.friend_id,
    user_id: request.user_id}
    end
  end
  def requested_friends
    self.object.requested_friends.map do |friend|
    {id: friend.id,
    name: friend.name,
    email: friend.email}
    end
  end
end
