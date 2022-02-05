require 'takeaway'
require 'order'

describe Order do

  subject(:order) { described_class.new([{pizza: '£9'}, {pasta: '£7'}]) }

  describe '#total' do
    it 'calculates the total sum of the dishes in an order' do
      order.add_to_order("pizza")
      order.add_to_order("pasta")
      expect(order.total).to eq "Total for order is: £16."
    end
  end

end