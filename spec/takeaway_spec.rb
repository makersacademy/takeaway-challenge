require 'takeaway'
require 'dishes'

describe Takeaway do
  describe '#view_dishes' do
    it 'should provide a list of fishes' do
      shop = described_class.new(Dishes.new)
      expect(shop.view_dishes).not_to eq nil
    end
  end
end
