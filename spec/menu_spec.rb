require 'menu'

describe Menu do
  subject(:menu) { described_class.new}

  describe '#dishes' do
    
    it 'returns a hash of dishes' do
      expect(menu.dishes.class).to eq Hash
    end
  end
end 
