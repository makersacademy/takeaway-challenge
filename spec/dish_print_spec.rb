require 'dish_print'

describe DishPrint do
  subject(:aclass) { double("Dishes").extend(DishPrint) }
  let(:dish) { double("Dish",name: 'shwarma', cost: 9) }

  it 'prints the name and price of the dish' do
    expect(subject.printer(dish)).to eq 'shwarma, £9'
  end
end
