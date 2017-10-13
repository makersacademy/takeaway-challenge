require 'restaurant'
require 'menu'
require 'dish'

describe Restaurant do
  let(:order) { double :order, items: Hash.new(0) }
  let(:dish) { double :dish, name: "Pizza", price: 5.00  }
  let(:menu) { double :menu, dishes: [dish] }
  let(:messenger) { double :messenger }
  let(:message) {"Thank you! Your order was placed and will be delivered before 8.30"}
  let(:restaurant) { described_class.new(order, menu, messenger) }

  # describe '#see_menu' do
  #   it 'allows the customer to see the menu' do
  #     menu_given = menu.change_menu_to_string
  #     expect(restaurant.see_menu).to eq(menu_given)
  #   end
  # end

  describe '#see_menu' do
    it 'allows the user to see the menu' do
      allow(menu).to receive(:load_menu_from_file)
      allow(menu).to receive(:change_menu_to_string).and_return("1. Pizza, 5.00")
      expect(restaurant.see_menu).to eq("1. Pizza, 5.00")
    end
  end

  describe '#add_dish_to_orders' do
    it 'adds a new order when this is made' do
      allow(order).to receive(:add_dish).with(dish).and_return(1)
      expect(restaurant.add_dish_to_orders(1)).to eq("You have ordered option 1")
    end
  end

  describe '#submit_order' do
    it 'adds up the total for the order' do
      allow(order).to receive(:total_to_string).and_return("5.00")
      allow(messenger).to receive(:send)
      expect(restaurant.submit_order).to eq("Your order total is £5.00. You will receive a text shortly.")
    end
  end
  #
  # describe '#send_text' do
  #   it 'sends a text as order confirmation' do
  #     allow(messenger).to receive(:send).with(message)
  #     expect(restaurant.send_text).to eq("Your order total is £5.00. You will receive a text shortly.")
  #   end
  # end

end
