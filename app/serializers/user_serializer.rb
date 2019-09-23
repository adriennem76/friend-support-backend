class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :support_items, :friends
end
