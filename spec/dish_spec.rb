require 'dish'

describe Dish do

  describe '#initialize'do

    it 'initializes with a name and a price' do
      new_dish = Dish.new(name: 'Cheeseburger', price: 5)
      expect(new_dish.name).to eq 'Cheeseburger'
      expect(new_dish.price).to eq 5
    end

  end

end