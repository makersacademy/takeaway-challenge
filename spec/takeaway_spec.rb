require 'takeaway'

describe Takeaway do
  let(:takeaway) { described_class.new }

  describe '#display' do
    it 'displays menu' do
      expect(takeaway.display).to eq takeaway.menu
    end
  end

  describe '#place_order' do
    it 'takeaway responds to method place_order' do
      expect(takeaway).to respond_to(:place_order)
    end

    it 'adds order to empty order array' do
      takeaway.select({ :burger => 3, :chips => 1 })
      expect{ takeaway.place_order(31.80) }.to change{ takeaway.order.order_array }.to [{ :burger => 10.0 }, { :burger => 10.0 }, { :burger => 10.0 }, { :chips => 1.80 }]
    end

    context 'when order verified with wrong total' do
      it 'raises error' do
        takeaway.select({ :burger => 3, :chips => 1 })
        expect { takeaway.place_order(20.00) }.to raise_error("Error: The total given does not equal the menu total")
      end
    end

    context 'when order verified with correct total' do
      it 'prints order placed message' do
        takeaway.select({ :burger => 3, :chips => 1 })
        expect(takeaway.place_order(31.80)).to eq "The order was placed"
      end
    end
  end

  describe '#select' do
    it 'places items into basket' do
      expect{takeaway.select({ :burger => 3, :chips => 1 })}.to change{takeaway.basket}.to({ :burger => 3, :chips => 1 })
    end
  end
end
