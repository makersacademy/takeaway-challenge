require 'menu'

describe Menu do
  subject(:menu) { described_class.new}
  subject(:dish) { double :dish }
  describe '#dishes' do
    
    it 'returns a hash of dishes' do
     expect(menu.see_dishes.class).to eq Hash
    end

  end

  describe '#dish_price' do

    it 'returns the price an item' do
      expect(menu.dish_price("burger")).to eq 7
    end
 
  end

  describe '#check_dish' do
    
    it 'will return true if item is in menu' do
      expect(menu.check_dish("burger")).to eq true
    end
    
    it 'will return false if item is not in menu' do
      expect(menu.check_dish("lobster")). to eq false
    end

  end
      
end 
