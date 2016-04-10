class Admin::Men::ShirtsController < ApplicationController
  def new
    @mens_inventory = MensInventory.new
  end

  def index
    @mens_inventories = MensInventory.all
  end

  def create
    mens_inventory = MensInventory.new(mens_inventory_params)
    if mens_inventory.save
      redirect_to  admin_men_shirts_path
      flash[:success] = "New Inventory saved"
    else
      render 'new'
      flash[:danger] = "Inventory not saved"
    end 
  end

  def show
    @mens_inventory = MensInventory.find(params[:id])
  end

  def edit
    @mens_inventory = MensInventory.find(params[:id])
  end

  def update
    @mens_inventory = MensInventory.find(params[:id])
    if @mens_inventory.update_attributes(mens_inventory_params)
      flash[:success] = "Mens Inventory Updated"
      redirect_to admin_men_shirts_path
    else
      render 'edit'
      flash[:danger] = "Mens Inventory not updated"
    end
  end

  def destroy
    MensInventory.find(params[:id]).destroy
    flash[:success] = "Mens Inventory deleted"
    redirect_to admin_men_shirts_path
  end

  private

  def mens_inventory_params
    params.require(:mens_inventory).permit(:description, :cost, :picture)
  end
end
