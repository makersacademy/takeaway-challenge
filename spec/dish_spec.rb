require 'dish'

describe Dish do

  subject(:dish) { described_class.new("Fries", 5) }

  describe '#initialization' do
    it 'has a name variable upon initialization' do
      expect(dish.name).to eq "Fries"
    end
    it 'has a price variable upon initialization' do
      expect(dish.price).to eq 5
    end
  end

  describe '#menu_readable' do
    it 'returns a string with menu_readable' do
      expect(dish.menu_readable).to eq "Fries, £5"
    end
  end
end
