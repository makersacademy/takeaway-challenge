require 'dish'

describe Dish do
  let(:dish_carbonara){described_class.new("Linguine alla carbonara col tartufo",15)}

  describe '.new' do
    it 'will be initialized with 2 parameters' do
      expect{described_class.new("Dish",99)}.not_to raise_error
    end
  end

  describe '#name' do
    it 'returns the name of the dish' do
      expect{dish_carbonara.name}.not_to raise_error
      expect(dish_carbonara.name).to eq "Linguine alla carbonara col tartufo"
    end
  end

  describe '#price' do
    it 'returns the price of the dish' do
      expect{dish_carbonara.price}.not_to raise_error
      expect(dish_carbonara.price).to eq 15
    end
  end
end
