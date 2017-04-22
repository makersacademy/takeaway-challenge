require 'menu'

describe Menu do
  describe '#add' do
    it 'adds a dish with a name and price to the list of dishes' do
      subject.add(:test_dish, :price)
      expect(subject.list_of_dishes).to include test_dish: :price
    end
  end
  describe '#price' do
    it 'finds a dish and returns the price' do
      subject.add(:test_dish, :price)
      expect(subject.price(:test_dish)).to eq :price
    end
  end
end
