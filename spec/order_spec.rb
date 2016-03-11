require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:dish1) { double(:menu) }
  let(:dish2) { double(:menu) }

  describe '#initialize' do
    it '1.0 initializes an order with an empty list of dishes' do
      expect(order.dish_list).to eq([])
    end
  end

  # describe '#add a dish' do
  #   it ''
  # end
end






# methods order class should have
# - add a dish
# - remove a dish
# - calc_total
# - send order
# - cancel_order
