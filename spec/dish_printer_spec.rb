require 'dish_printer'

describe DishPrinter do
  subject(:myclass) { double("DishList").extend(DishPrinter) }
  let(:dish) { double("Dish",cost: 5, name: 'Copius Mushroom Skewers') }
  let(:dish2) { double("Dish2",cost: 4, name: 'Vegetable Omlette') }

  context 'given a dish object' do
    it 'prints the name, description and price nicely' do
      expect(subject.niceprint(dish)).to eq "Copius Mushroom Skewers        💎  5"
    end
    it 'prints the name, description and price nicely' do
      expect(subject.niceprint(dish2)).to eq "Vegetable Omlette              💎  4"
    end
  end
end