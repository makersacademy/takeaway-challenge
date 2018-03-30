require 'meal_list'

describe MealList do 
  subject(:curry_house) { described_class.new }
  
  describe '.add_meal' do 
    it 'adds meals to meals array' do
      expect { 5.times { curry_house.add_meal('lamb bhuna') } }.to \
      change { curry_house.meals.size }.from(0).to(5)
    end
  end 
end 
