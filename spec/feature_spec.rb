require 'takeaway.rb'

describe 'having a takeaway' do
  let(:user) { Takeaway.new(menu, order) }
  let(:order) { Order.new }
  let(:food) { [{ dish: "Burger", price: 5 }, { dish: "Pizza", price: 7 }] }
  let(:menu) { double :menu, food_menu: food, 
  show_menu: "#{food[0][:dish]} - £#{food[0][:price]}, #{food[1][:dish]} - £#{food[1][:price]}",
  order_dish: "Ordered - Burger x 1" 
  }
  describe 'can see the menu' do
    it '#see_menu returns menu' do
      expect(user.see_menu).to eq "Burger - £5, Pizza - £7"
    end
  end

  describe 'can order a dish from the menu' do
    it '#order returns order and price of dish' do
      expect(user.order("Burger", 1)).to eq "Ordered - Burger x 1"
    end
  end
end
