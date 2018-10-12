require 'order'

describe Order do
  let(:order) { Order.new }
  let(:items) { ["Margherita", "Chorizo"] }

  describe '#choose' do
    it 'let me choose the items that I want' do
      expect(order.choose(items)).to eq "Great, you have selected Margherita and Chorizo"
    end
  end
end
