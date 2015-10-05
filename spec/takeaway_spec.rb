require 'takeaway'

describe Takeaway do
    it 'returns a hash of availbable dishes when menu is called' do
      expect(subject.menu).to be_a Hash
    end

    it 'returns the list price for an item' do
      expect(subject.menu['pizza']).to eq(10.00)
    end
end
