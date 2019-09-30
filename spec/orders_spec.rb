require 'orders'
require 'menu'

describe Orders do

  let(:orders) { described_class.new }
  let(:dish) { :dosa }
  let(:price) { 5 }

  describe '#initialize' do

    it 'starts with an empty oder list' do
      expect(orders.order).to be_empty
    end
  end

  describe '#add_dish' do

    it 'responds to the #add_item method' do
      expect(orders).to respond_to(:add_dish).with(1).argument
    end

    # it 'allows user to order a set number of dishes' do
    #   menu = Menu.new
    #   menu.price_list
    #
    #   expect(orders.add_dish).to include( { :dish => price })
    # end

  end

end
