require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:dish) { :dish }
  let(:price) { 5 }
  let(:quantity) { 1 }

  describe '#select_dish' do
    it 'selects the dish and its quantity' do
      expect(order.select_dish(dish, quantity)).to eq({ dish => 1 })
    end

    it 'adds the selected dish and quantity to the current order' do
      order.select_dish(dish, quantity)
      expect(order.current_order).to eq ([{ dish => 1 }])
    end
  end

  describe '#order_total' do
    it 'Returns the total price of the order' do
      menu = double :menu
      order_new = Order.new(menu)
      order_new.select_dish(dish, quantity)
      allow(menu).to receive(:dishes).and_return({ dish => price })
      allow(menu).to receive(:dish_price).and_return(price)
      p "PRICE: "
      p price
      p "QUANTITY"
      p quantity
      expect(order_new.order_total).to eq(price * quantity)
    end
  end

  describe '#check_total' do
    xit 'checks total given by user matches total in order' do
      allow(order).to receive(:user_total).and_return(order.order_total)
      expect(order.check_total(user_total, order.order_total)).to eq true
    end
    xit 'Returns error message if total given by user doesn\'t match'\
        'the actual order total ' do
      allow(order).to receive(:user_total).and_return(order_total -1)
      expect(order.check_total(user_total, order_total)).to eq false
    end
  end
  # describe '#order_total' do
  #   xit 'returns the total price of order' do
  #     order.select_dish(dish, quantity)
  #     expect(order.order_total).to eq
  #   end
  # end
end
