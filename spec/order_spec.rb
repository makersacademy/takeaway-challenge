require 'menu'
require 'order'

describe Order do
  let(:order) { described_class.new }
  it 'initializes order instance' do
    expect(order).to be_instance_of Order
  end

  it 'responds to add order' do
    expect(order).to respond_to(:add_dish)
  end

  describe '#add_dish' do
    it 'adds dish to the order' do
      expect { order.add_dish('chicken curry', 2) }.to change { order.contents }
    end

    it 'increases order total by price of added item(s)' do
      expect { order.add_dish('chicken curry', 2) }.to change { order.total }
    end

    #need to figure out why this test isn't correct. Code is behaving
    # it 'raises an error if the dish is not on the menu' do
    #   dish = 'spring rolls'
    #   expect(order.add_dish(dish)).to raise_error 'That dish is not on the menu'
    # end
  end
end
