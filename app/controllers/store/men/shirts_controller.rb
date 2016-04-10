class Store::Men::ShirtsController < ApplicationController

  def index
    @mens_inventories = MensInventory.all
  end

  def show
    @mens_inventory = MensInventory.find(params[:id])
  end

end
