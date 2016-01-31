require 'order.rb'

# I would like to be able to select some number of several available dishes
# I would like to check that the total I have been given matches the sum of the various dishes in my order

describe Order do
  subject(:order) {described_class.new}
  let(:menu) { double :menu }

    it 'should start with nothing in the order' do
      expect(order.user_order).to eq []
    end

    it 'allows user to order from the menu' do
      expect(order).to respond_to(:place_order).with(2).argument
    end

    it 'should only take an order from the menu' do
      expect{order.place_order("lala", 2)}.to raise_error("please order from menu")
    end


    describe 'calculating order' do

      it 'should calculate the cost of the order' do
        expect(user_order).to respond_to(:calculate_order)
      end


    end

end
