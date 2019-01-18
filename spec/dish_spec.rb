require 'dish'

describe 'Dish' do
  let(:dish) { Dish.new(5, "Chips") }

  describe '#price' do

    it 'should give the price of the dish' do
      expect(dish.price).to eq 5
    end
  end

  describe '#name' do

    it 'should give the name of the dish' do
      expect(dish.name).to eq "Chips"
    end
  end

end
