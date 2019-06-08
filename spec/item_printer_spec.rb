require 'item_printer'

describe ItemPrinter do
  describe '#print' do

    it 'prints the name, price and quantity of the dish' do
      dish_double = double('dish', name:'Yummy', price: 9.99)
      item = {dish_double => 1}
      expect(subject.print(item)).to eq('Yummy x 1 = £9.99')
    end
  end
end