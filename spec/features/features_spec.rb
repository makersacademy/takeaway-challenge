require './lib/menu.rb'
require './lib/restaurant.rb'

describe 'Restaurant Features' do

  subject(:restaurant) { Restaurant.new }

  it 'contains a hash for the menu structure' do
    expect(restaurant.dishes).to include("Chicken Tikka" => 8.99)
  end

  it 'contains a hash for the menu structure' do
    expect(restaurant.dishes).to include("Dry Meat" => 10.99)
  end

end

describe 'Menu Features' do

  subject(:menu) { Menu.new }

  # ** User Story 1 **
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it 'can create a menu' do
    expect { Menu.new }.not_to raise_error
  end

  it 'can contain a list of dishes with corresponding prices' do
    expect { menu.dishes }.not_to raise_error
  end

  it 'can display a the list of dishes available for order' do
    expect { menu.display }.not_to raise_error
  end

  it 'displays the whole menu available' do
    expect(menu.display).to include(menu.dishes.to_s)
  end

  it 'presents the menu in a customer friendly format' do
    expect(menu.display).to eq "Ty Abs - Whitechapel
Takeaway Menu
#{menu.dishes}
Please order before 10pm
Delivery is available in the E2 area"
  end
end

  # ** User Story 2 **
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

describe 'OrderSystem Features' do

  subject(:order) { OrderSystem.new }
  let(:item) { double :item }
  let(:number) { double :number }

  it 'asks user what they would like to order' do
    order_intro = 'What would you like to order?'
    expect(order.order_request).to eq order_intro
  end

  it 'allows user to add an item to their order' do
    order.add_to_order("Chicken Tikka", 1)
    expect(order.pending_order).to include "Chicken Tikka"
  end

  it 'adds an item to pending order' do
    number = 1
    expect(order.add_to_order(item, number)).to eq "#{number} #{item}(s) added to your order."
  end


  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  it 'checks the total submitted matches the order total' do
    order.add_to_order("Chicken Tikka", 1)
    order.add_to_order("Dry Meat", 2)
    order.add_to_order("Plain Rice", 3)
    message = "Total cost is #{order.total_cost.round(2)}. Thank you for your order."
    expect(order.confirm_order(39.94)).to eq message
  end

  it 'totals up the pending order' do
    expect { order.add_to_order("Chicken Tikka", 3) }.to change { order.total_cost }.by 26.97
  end

  it 'allows the user confirm how much their order should cost' do
    expect(order).to respond_to(:confirm_order).with(1).arguments
  end

  it 'allows user place an order' do
    order.order_placed
    expect(order.order_in_progress).to eq true
  end

  # ** User Story 4 **
  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

  it 'allows user to receive a text message confirming estimated delivery time' do
    order.add_to_order("Dry Meat", 2)
    expect(order.confirm_order(21.98)).to eq "Thank you! Your order was placed and will be delivered before 18:52"
  end

end
