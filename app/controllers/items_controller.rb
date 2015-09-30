class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        flash[:notice] = 'Item added.'
        redirect_to items_path
      else
        render :new
      end
  end

  protected

  def item_params
    params.require(:item).permit(:title, :description)
  end
end
