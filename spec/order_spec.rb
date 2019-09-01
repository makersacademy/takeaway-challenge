require 'order'

describe Order do
  subject(:menu) { described_class.new }
  subject(:order) { described_class.new }
  let(:dish) { "fish" }
  let(:price) { 5 }
  let(:quantity) { 1 }

  describe '#select_dish' do
    it 'raises an error when dish is not on the menu' do
      expect { order.select_dish("fosh", 1)}.to raise_error "Dish not on menu."
    end
  end

  describe '#order_total' do
    it 'returns the total price of the order' do
      menu_new = Menu.new
      order_new = Order.new(menu_new)
      order_new.select_dish(dish, quantity)
      allow(menu_new).to receive(:dishes).and_return({ dish => price })
      allow(menu_new).to receive(:dish_price).and_return(price)
      expect(order_new.order_total).to eq(5)
    end
  end

  describe '#check_total' do
    it 'returns true if the user\'s total matches the actual total' do
      user_total = order.order_total
      expect(order.check_total(user_total)).to eq true
    end

    it 'returns error message if total given by user doesn\'t match '\
        'the actual order total ' do
      user_total = 1 + order.order_total
      expect { order.check_total(user_total) }.to raise_error 'Total'\
      ' given does not match'
    end
  end

  describe '#confirm_order' do
    # TESTED THIS WITH VALID NUMBER AND IT WORKS
    xit 'sends text to user confirming order' do
      text = double :text
      allow(text).to receive(:message_sent).and_return(true)
      order.confirm_order('+44123456')
      expect(text.message_sent).to eq(true)
    end
  end
end
