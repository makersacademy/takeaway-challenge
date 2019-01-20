require 'dish'

  describe Dish do
    it 'should have a name associated when created' do
      dish = Dish.new('Steak', 5)
      expect(dish.name).to eq 'Steak'
    end

    it 'should have a price associated when createdd' do
      dish = Dish.new('Steak', 5)
      expect(dish.price).to eq 5
    end
  end
