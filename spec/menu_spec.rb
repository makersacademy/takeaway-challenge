require 'menu'

describe Menu do
  
  describe '#initialaise' do
    it 'should initialize and create a menu with 2 food items' do
      expect(subject.menu.count).to eq(2)
    end
  end
  
  describe '#return_price' do
    it 'should return the price of an item' do
      expect(subject.return_price('food1')).to eq ("1.00")
    end
  end
  
end
