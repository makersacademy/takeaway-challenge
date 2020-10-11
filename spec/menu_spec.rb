require 'Menu.rb'

describe Menu do
  let(:dish) { double :dish }
  let(:price) { double :price }
  describe '#meal_options'
    it 'returns menu' do
      expect(subject.meal_options).to eq([
        {"Hamburger"=>5},
        {"Pizza"=>6},
        {"Pasta"=>4},
        {"Fish and chips"=>5},
        {"Salad"=>3},
        {"Lamb shank"=>7}])
      end

  describe '#select' do
    it 'check method stores selection to #dishes variable' do
      subject.select(dish=>price, dish=>price)
        expect(subject.dishes).to eq(dish=>price, dish=>price)
    end
  end

  describe '#print_all' do
    let(:printed_dishes){ {Dish: dish, price: price} }
    it 'prints all dishes using the Print class' do
      expect(subject.print_all(printed_dishes)).to include printed_dishes
    end

  end

end
