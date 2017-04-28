require 'order'

describe Order do
  subject(:order) { described_class.new }
  it 'responds to #select_dish with 1 argument' do
    expect(order).to respond_to(:select_dish).with(1).argument
  end

  context '#select_dish' do
    from_menu = Menu::MENU.sample
    it 'raise an error if chosen food is not on menu' do
      not_on_menu = !Menu::MENU
      expect { order.select_dish(not_on_menu) }.to raise_error 'That item is not on the menu'
    end
    it 'adds chosen food to #order_items' do
      order.select_dish(from_menu)
      expect(order.order_items).to include(from_menu)
    end
  end

  context '#price_check' do
    from_menu = Menu::MENU.sample
    it 'checks if order total price is correct' do
      order.select_dish(from_menu)
      expect(order.price_check).to eq Order::PRICE * order.order_items.count
    end
  end

  context '#confirm_order' do
    let(:confirm_order) { double :confirm_order }
    it 'send SMS to customer' do
      allow(order).to receive(:confirm_order)
      expect(order.confirm_order(:text_customer))
    end
  end
end
