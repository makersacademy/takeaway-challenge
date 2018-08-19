require 'takeaway.rb'

describe 'having a takeaway' do
  let(:user) { Takeaway.new(menu) }
  let(:order) { double :order, total_order: [{ dish: "Burger", quantity: 2, price: 10 }] }
  let(:food) { [{ dish: "Burger", price: 5 }, { dish: "Pizza", price: 7 }] }
  let(:menu) { double :menu, order: order, food_menu: food, 
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

  describe 'can check the total order' do
    it '#check_order returns total order' do
      user.order("Burger", 1)
      user.order("Burger", 1)
      expect(user.check_order).to eq "Order: Burger x 2  Total: £10"
    end
  end

  describe 'confirm order correct amount given' do
    it 'returns message if correct amount given and order is confirmed' do
      allow(user).to receive(:send_message) { "Thank you! Your order was placed" }
      expect(user.confirm_order(user.total)).to eq "Thank you! Your order was placed"
    end
  end

end
