require 'customer'
require 'restaurant'

describe Customer do

  context 'can check the menu' do
    customer = Customer.new
    it { is_expected.to respond_to(:checks_menu).with(1).argument }
    it {is_expected.to respond_to (:order)}
  end

  it 'can select items from the menu' do
    customer = Customer.new
    restaurant = Restaurant.new
    customer.selects_item(restaurant, "Burger", 1)
    expect(customer.order).to eq[["Burger", '£10']]
  end
end
