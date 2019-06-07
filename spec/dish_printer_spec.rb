require 'dish_printer'

describe DishPrinter do
  describe '#print' do

    it 'prints the name and price of the dish' do
      dish_double = double('dish', name:'Yummy', price: 9.99)
      expect(subject.print(dish_double)).to eq('Yummy 9.99')
    end
  end
end