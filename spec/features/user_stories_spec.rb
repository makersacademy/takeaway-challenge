require 'menu'
require 'order'

describe 'user stories' do

  describe 'customer can see a list of dishes & prices' do
    it 'displays the menu' do
      menu = Menu.new
      expect(menu.display_menu).to be_a(Hash)
    end
  end

  describe 'customer can choose items from a menu' do
    it 'allows customer to make an order list' do
      order = Order.new(Menu.new)
      order.read_menu
      order.choose("margherita")
      expect(order.list).to include("margherita" => 6)
    end
  end

  describe 'customer can check the cost' do
    it 'returns order total' do
      order = Order.new
      order.choose("margherita")
      order.total
      expect(order.total_cost).to eq 6
    end
  end

  describe 'customer receives a confirmation message' do
    it 'sends an sms' do
      order = Order.new
      order.choose("margherita")
      order.place
      expect(order).to receive(:send_message)
      order.send_message
    end
  end

end
