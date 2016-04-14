require 'test_helper'

class CartMailerTest < ActionMailer::TestCase
  test "checkout_list" do
    mail = CartMailer.checkout_list
    assert_equal "Checkout list", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
