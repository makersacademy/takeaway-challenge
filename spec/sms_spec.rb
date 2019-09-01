require './lib/sms'

describe SMS do
  it "sends text confirmation when an order has been placed" do
    cart = Cart.new
    cart.select(4)
    expect { cart.checkout(ENV['PHONE']) }.to output("Your order has been placed. You should receive SMS confirmation soon\n").to_stdout
  end
end
