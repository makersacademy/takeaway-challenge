require 'chinese_restaurant'
require 'dish'

describe ChineseRestaurant do

  describe '#menu' do
    
    it 'has dishes' do
      expect(subject.menu.last).to be_a(Dish) 
    end
  end
end
