require "order"

describe "User Stories" do
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  it "to check what to order show a list of items and prices" do
    order = Order.new
    expect { order.menu }.to
  end
end
