require 'dish'

describe Dish do
  subject(:dish){described_class.new(name: :pizza, price: 1)}

  describe '#name' do
    it 'gives name of dish' do
        expect(dish.name).to eq :pizza
    end
  end

  describe '#price' do
    it 'gives price of dish' do
      expect(dish.price).to eq 1
    end
  end
end
