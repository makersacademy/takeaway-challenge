require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:dish) { :dish }
  let(:price) { 5 }
  let(:quantity) { 1 }

  describe '#select_dish' do

    it 'adds the selected dish and quantity to the current order' do
      order.select_dish(dish, quantity)
      expect(order.current_order).to eq([{ dish => 1 }])
    end
  end

  describe '#order_total' do
    it 'returns the total price of the order' do
      menu = double :menu
      order_new = Order.new(menu)
      order_new.select_dish(dish, quantity)
      allow(menu).to receive(:dishes).and_return({ dish => price })
      allow(menu).to receive(:dish_price).and_return(price)
      expect(order_new.order_total).to eq(price * quantity)
    end
  end

  describe '#check_total' do
    it 'returns true if the user\'s total matches the actual total' do
      user_total = order.order_total
      expect(order.check_total(user_total, order.order_total)).to eq true
    end
    it 'returns error message if total given by user doesn\'t match '\
        'the actual order total ' do
      user_total = 1 + order.order_total
      expect { order.check_total(user_total, order.order_total) }.to raise_error 'Total'\
      ' given does not match'
    end
  end
end
