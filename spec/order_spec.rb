require 'order'
require 'menu'

describe Order do
  describe '#check_order' do

    it 'puts the total price and current_order in one output' do
      rest = Restaurant.new
      rest.menu.add_to_basket(4, 1)
      rest.checkout
      expect{rest.order.check_order}.to output("8\n[{:sushi=>8}]\n").to_stdout
    end

    it 'puts the ordered items' do
      rest = Restaurant.new
      rest.menu.add_to_basket(4, 1)
      rest.checkout
      expect(rest.order.current_order).to eq([{:sushi=>8}])
    end

    it 'resets order_total so can be used multiple times' do
      rest = Restaurant.new
      rest.menu.add_to_basket(4, 1)
      rest.checkout
      rest.order.check_order
      expect(rest.order.order_total).to eq(0)
    end
  end
 end
