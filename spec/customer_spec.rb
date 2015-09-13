require 'customer'

describe Customer do

  it "can display menu" do
    expect(subject).to respond_to(:display_menu)
  end

  # it "can display the price of a dish"

  it "can add a dish from the menu to an order" do
    expect(subject).to respond_to(:add_to_order).with(2).arguments
  end

  it "can review an order" do
    expect(subject).to respond_to(:review_order)
  end

  xit "can view the total price of an order" do
    expect(subject).to respond_to(:price_of_order)
  end

  it "can submit an order"

  # it "can receive an order summary"

  it "can receive a delivery estimate"

end