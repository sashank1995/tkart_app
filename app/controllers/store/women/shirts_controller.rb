class Store::Women::ShirtsController < ApplicationController

  def index
    @womens_inventories = WomensInventory.all
  end

  def show
    @womens_inventory = WomensInventory.find(params[:id])
  end

end
