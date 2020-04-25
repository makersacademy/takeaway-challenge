require 'takeaway'
require 'order'

describe Order do
  let(:takeaway) { Takeaway.new }
  let(:order) { described_class.new }

  describe '#order' do
    it 'adds order to empty order array' do
      takeaway.place_order(31.80, { :burger => 3, :chips => 1 })
      expect(takeaway.order.order_array).to eq [{ :burger => 10.0 }, { :burger => 10.0 }, { :burger => 10.0 }, { :chips => 1.8 }]
    end
  end
end
