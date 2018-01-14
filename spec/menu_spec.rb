require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#show' do
    it 'returns an Array' do
      expect(menu.show).to be_a Array
    end

    it 'inside the array are hashes' do
      expect(menu.show).to all(be_a Hash) 
    end
  end
end
