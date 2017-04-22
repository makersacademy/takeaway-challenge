require 'order'

describe Order do
  subject(:order) { described_class.new }
  it 'responds to #select_dish with 1 argument' do
    expect(order).to respond_to(:select_dish).with(1).argument
  end

  context '#select_dish' do
    it 'raise an error if chosen food is not on menu' do
      not_on_menu = !Menu::MENU
      expect { order.select_dish(not_on_menu) }.to raise_error 'That item is not on the menu'
    end
    it 'adds chosen food to #order_items' do
      from_menu = Menu::MENU.sample
      order.select_dish(from_menu)
      expect(@order_items).to include(from_menu)
    end
  end
end
