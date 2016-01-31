require 'order.rb'

# # I would like to be able to select some number of several available dishes

describe Order do
  subject(:order) {described_class.new}
  let(:menu) { double :menu }

    it 'allows user to order from the menu' do
      expect(order).to respond_to(:place_order).with(2).argument
    end

    it 'should only take an order from the menu' do
      expect{order.place_order("lala", 2)}.to raise_error("please order from menu")
    end

end
