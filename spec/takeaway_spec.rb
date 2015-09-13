require 'takeaway'

describe Takeaway do
  describe 'menu' do
    it 'returns a hash when menu is called' do
      expect(subject.menuls).to be_a Hash
    end

    it 'returns the list price for an item' do
      expect(subject.menu[:pizza]).to eq(10.00)
    end
  end
end
