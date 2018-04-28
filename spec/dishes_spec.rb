require 'dishes'

describe Dishes do
  before { allow(subject).to receive(:list) { p "Dish_name = £Dish_price\n" } }

  describe '#Dishes', :dishes do
    it 'Returns an array 10 dishes with prices' do
      expect(subject.dishes.length).to eq 10
    end
  end

  describe '#list', :list do
    it 'Returns a string of dishes with prices' do
      expect(subject.list).to eq("Dish_name = £Dish_price\n")
    end
  end
end
