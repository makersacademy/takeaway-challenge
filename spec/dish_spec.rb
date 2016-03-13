require 'dish'

describe Dish do

  subject(:dish) { described_class.new('food_name', 0) }

  describe '#initialize' do
    it '1. initializes with a name' do
      expect(dish.name).to be_a(String)
    end

    it '2. initializes with a price' do
      expect(dish.price).to be_an(Integer)
    end

  # menu.contents.each_pair{|key, val| (key.is_a? String) && (val.is_a? Integer) }

  end
end
