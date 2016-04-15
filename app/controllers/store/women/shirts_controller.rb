class Store::Women::ShirtsController < ApplicationController

  def index
    @womens_inventories = WomensInventory.all
  end

  def show
    @womens_inventory = WomensInventory.find(params[:id])
  end

  def add_to_cart
    quant = WomensInventory.find(params[:id])

    hash_of_items = {:product_id => params[:id], :no_of_items => params[:quantity]}

    if session[:items].present?
      if quant.quantity >= params[:quantity].to_i
        session[:items].push(hash_of_items)
        quant.quantity = quant.quantity - params[:quantity].to_i
      elsif quant.quantity == 0
        flash[:danger] = "Sorry, but the item was sold out. Keep looking to find other wonderful shirts"
      elsif quant.quantity < params[:quantity].to_i
        flash[:danger] = "Only" << quant.quantity << "items available."
      end
    else
      session[:items] = [{:product_id  => params[:id], :no_of_items => params[:quantity]}]
      quant.quantity = quant.quantity - params[:quantity].to_i
    end
    quant.save!
    redirect_to cart_store_women_shirts_path

  end

  def remove_from_cart
    quant = WomensInventory.find(params[:id])
    session[:items].delete_if{|item| item["product_id"] == params[:id] && item["no_of_items"] == params[:quantity]}
    quant.quantity = quant.quantity + params[:quantity].to_i
    quant.save!
    redirect_to cart_store_women_shirts_path
  end

  def send_mail
    CartMailer.checkout_list(params[:email], session[:product_ids]).deliver_now
    redirect_to store_women_shirts_path
  end

end
