require 'menu'
require 'order'

describe 'user stories' do

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  describe 'customer can see a list of dishes & prices' do
    it 'displays the menu' do
      menu = Menu.new
      expect(menu.display_menu).to be_a(Hash)
    end
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
  describe 'customer can choose items from a menu' do
    it 'allows customer to make an order list' do
      order = Order.new(Menu.new)
      order.read_menu
      order.choose("Margherita")
      expect(order.list).to include("Margherita" => 6)
    end

  end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
  describe 'customer can check the cost' do
    it 'returns order total' do
      order = Order.new
      order.choose("Margherita")
      order.total
      expect(order.total_cost).to eq 6
    end
  end

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
describe 'customer receives a confirmation message' do
  it 'sends an sms' do
    order = Order.new
    order.choose("Margherita")
    order.place
    expect(order).to receive(:send_message)
    order.send_message
  end
end
end
