require 'order'

describe Order do

  subject(:order) { described_class.new }

  describe '#basket' do
    it 'starts as empty' do
      expect(order.basket).to eq({})
    end
  end

end
