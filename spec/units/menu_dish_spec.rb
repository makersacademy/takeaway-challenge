require 'menu_dish'

describe MenuDish do
  name = 'Salad Caprese'
  price = 8.5
  subject(:dish) { described_class.new name, price }
  describe '#readable' do
    it 'returns a string' do
      expect(subject.readable).to be_a String
    end
    it 'which contains the name of the dish' do
      expect(subject.readable).to include name
    end
    it 'and the price of the dish' do
      expect(subject.readable).to include price.to_s
    end
  end
end
