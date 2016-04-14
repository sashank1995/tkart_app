class Store::Men::ShirtsController < ApplicationController

  def index
    @mens_inventories = MensInventory.all
  end

  def show
    @mens_inventory = MensInventory.find(params[:id])
  end

  def cart
    @shopping_cart = MensInventory.find(session[:product_ids])
  end

  def add_to_cart
    product_id = params[:id]

    if session[:product_ids].present?
      if session[:product_ids].include? product_id
      else
        session[:product_ids] << product_id
      end
    else
      session[:product_ids] = [product_id]
    end

    redirect_to cart_store_men_shirts_path
  end

  def remove_from_cart
    session[:product_ids].delete(params[:id])
    redirect_to cart_store_men_shirts_path
  end

  def send_mail
   byebug
   CartMailer.checkout_list(params[:email], session[:product_ids]).deliver_now
   redirect_to store_men_shirts_path
  end

end
