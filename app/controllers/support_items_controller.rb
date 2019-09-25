class SupportItemsController < ApplicationController
  def index
    support_items = SupportItem.all
    render json: support_items
  end
  
  def new
    support_item = SupportItem.new
  end
  
  def create
    support_item = SupportItem.create(support_item_params)
    render json: support_item
  end
  
  def edit
    support_item = SupportItem.find(params[:id])
  end
  
  def update
    support_item = SupportItem.find(params[:id])
    support_item.update(support_item_params)
    render json: support_item
  end
  
  def show
    support_item = SupportItem.find(params[:id])
    render json: support_item
  end
  
  def destroy
    support_item = SupportItem.find(params[:id])
    support_item.delete
  end

  private

  def support_item_params
    params.require(:support_item).permit(:category,:description, :frequency_num, :frequency_period, :user_id)
  end
end
