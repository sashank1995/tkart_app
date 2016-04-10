class Admin::Women::ShirtsController < ApplicationController
  def new
    @women_inventory = WomensInventory.new
  end

  def index
    @women_inventories = WomensInventory.all
  end

  def create
    women_inventory = WomensInventory.new(women_inventory_params)
    if women_inventory.save
      redirect_to  admin_women_shirts_path
      flash[:success] = "New Inventory saved"
    else
      render 'new'
      flash[:danger] = "Inventory not saved"
    end 
  end

  def edit
    @womens_inventory = WomensInventory.find(params[:id])
  end

  def update
    @womens_inventory = WomensInventory.find(params[:id])
    if @womens_inventory.update_attributes(women_inventory_params)
      redirect_to admin_women_shirts_path
      flash[:success] = "WOmens Inventory updated"
    else
      render 'edit'
      flash[:danger] = "Womens Inventory failed to update"
    end
  end

  def show
    @women_inventory = WomensInventory.find(params[:id])
  end

  def destroy
    WomensInventory.find(params[:id]).destroy
    flash[:success] = "Inventory deleted"
    redirect_to admin_women_shirts_path
  end

  private

  def women_inventory_params
    params.require(:womens_inventory).permit(:description, :cost, :image)
  end
end
