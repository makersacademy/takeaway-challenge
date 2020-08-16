require 'takeaway'

describe Takeaway do
  let(:takeaway) { described_class.new }

  describe '#display' do
    it 'displays menu' do
      takeaway.instance_variable_set(:@menu, [{ :chips => 1.80 }, { :burger => 10.00 }])
      expect(takeaway.display).to eq takeaway.menu
    end
  end

  describe '#place_order' do
    it 'takeaway responds to method place_order' do
      expect(takeaway).to respond_to(:place_order)
    end
    #
    # it 'adds order to empty order array' do
    #   takeaway.instance_variable_set(:@menu, [{ :chips => 1.80 }, { :burger => 10.00 }])
    #   takeaway.select({ :burger => 3, :chips => 1 })
    #   expect { takeaway.place_order(31.80) }.to change { takeaway.order.order_array }.to [{ :burger => 10.0 }, { :burger => 10.0 }, { :burger => 10.0 }, { :chips => 1.80 }]
    # end

    context 'when order verified with wrong total' do
      it 'raises error' do
        takeaway.instance_variable_set(:@menu, [{ :chips => 1.80 }, { :burger => 10.00 }])
        takeaway.select({ :burger => 3, :chips => 1 })
        expect { takeaway.place_order(20.00) }.to raise_error("Error: The total given does not equal the menu total")
      end
    end

    context 'when order verified with correct total' do
      it 'user receives text message' do
        order_double = double("order")
        order_double.instance_variable_set(:@sum, 31.8)
        my_takeaway = Takeaway.new(order_double)
        my_takeaway.instance_variable_set(:@menu, [{ :chips => 1.80 }, { :burger => 10.00 }])
        my_takeaway.select({ :burger => 3, :chips => 1 })
        expect(takeaway.place_order(31.80)).to eq "The text message was sent"
      end
    end
  end

  describe '#select' do
    it 'places items into basket' do
      takeaway.instance_variable_set(:@menu, [{ :chips => 1.80 }, { :burger => 10.00 }])
      expect { takeaway.select({ :burger => 3, :chips => 1 }) }.to change { takeaway.basket }.to({ :burger => 3, :chips => 1 })
    end
  end
end
