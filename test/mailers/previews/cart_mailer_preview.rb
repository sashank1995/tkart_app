# Preview all emails at http://localhost:3000/rails/mailers/cart_mailer
class CartMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/cart_mailer/checkout_list
  def checkout_list
    CartMailer.checkout_list
  end

end
