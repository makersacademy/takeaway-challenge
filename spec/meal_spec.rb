require 'meal'
  describe Meal do 
    let (:meal) {Meal.new 'pasta', 7}
    it 'has a name when initialized'do 
      expect(meal.name).to eq 'pasta'
    end
    it 'has a price when initialized' do
      expect(meal.price).to eq 7
    end

end