require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(dishes) }
  let(:dishes) { {onion_bhaji: 2.95, chicken_tikka_masala: 7.95, naan: 1.95} }

  describe '#dishes' do
    it 'displays a list of dishes with prices' do
      expect(takeaway.dishes).to eq dishes
    end
  end
end