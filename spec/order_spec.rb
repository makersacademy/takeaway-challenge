require 'order'

describe Order do

  subject(:order){described_class.new}

  describe '#initialize' do

    it 'starts with a default of 0' do
      expect(order.cost).to eq 0
    end
  end

  describe '#add' do

    it 'can add to cost of order' do
      expect{order.add(5)}.to change{order.cost}.by 5
    end

    it 'can reset the order to 0' do
      order.add(5)
      expect{order.reset}.to change{order.cost}.to 0
    end
  end
end
