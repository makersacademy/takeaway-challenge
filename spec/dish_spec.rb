require 'dish'

describe Dish do

subject(:dish) { described_class.new(:name, :price) }

  describe '1 #initialize' do
    it '1.0 the dish has a name' do
      expect(dish.name).not_to be nil
    end

    it '1.1 the dish has a price' do
      expect(dish.price).not_to be nil
    end

    it '1.2 the dish is available' do
      expect(dish.available).to be true
    end
  end

end
