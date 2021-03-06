class FriendRequestsController < ApplicationController
before_action :set_friend_request, except: [:index, :create]

  def index
    friend_requests = FriendRequest.all
    render json: friend_requests
  end
  
  def create
    friend_request = FriendRequest.create(friend_request_params)
    friend = User.find(friend_request.friend_id)

    render json: friend
  end
  
  def update
    friend = User.find(@friend_request.user_id)
    @friend_request.accept
    
    render json: friend
  end
  
  def destroy
    @friend_request.destroy
  end

  private

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end

  def friend_request_params
    params.require(:friend_request).permit(:user_id,:friend_id)
  end
end
