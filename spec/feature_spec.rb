require 'takeaway'
require 'order'

describe "Takeaway features" do
  it 'can place an order' do
    takeaway = Takeaway.new
    takeaway.add_to_cart("Pancakes")
    takeaway.add_to_cart("Waffles")
    expect { takeaway.add_to_cart("Curry") }.to raise_error "Dish not found in menu"
    takeaway.add_to_cart("French Toast")
    takeaway.remove_from_cart("Waffles")
    expect(takeaway.checkout).to be_a(Order)
  end
end
