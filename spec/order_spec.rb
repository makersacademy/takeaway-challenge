require 'order'
require 'takeaway'

describe Order do
  subject(:order) { described_class.new }
  it 'responds to #select_dish with 1 argument' do
    expect(order).to respond_to(:select_dish).with(1).argument
  end
  context '#select_dish' do
    it 'raise an error if argument is not in menu' do
      not_in_menu = :fish
      expect { order.select_dish(not_in_menu) }.to raise_error 'That is not on the menu'
    end
  end
end
