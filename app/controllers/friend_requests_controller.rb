class FriendRequestsController < ApplicationController
before_action :set_friend_request, except: [:index, :create]

  def index
    friend_requests = FriendRequest.all
    render json: friend_requests
  end
  
  def create
    friend = User.find(params[:id])
    friend_request = current_user.friend_requests.new(friend: friend)
    friend_request.save

    render json: friend_request
  end
  
  def update
    friend_request.accept
  end
  
  def destroy
    friend_request.destroy
  end

  private

  def set_friend_request
    friend_request = FriendRequest.find(params[:id])
  end
end
