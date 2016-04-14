class CartMailer < ApplicationMailer

  default from: "challasashank1995@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.cart_mailer.checkout_list.subject
  #
  def checkout_list(email,list_of_items)
    @list_of_items = MensInventory.where(id: list_of_items)
    mail(to: email , subject: "Your TKart Order")
  end
end
