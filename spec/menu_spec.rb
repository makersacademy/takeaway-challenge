require 'menu'

describe Menu do

  subject(:menu) { Menu.new(dish_dbl1, dish_dbl2, dish_dbl3) }
  let(:dish_dbl1) { double('dish', name: 'Pepperoni pizza', price: 8.99) }
  let(:dish_dbl2) { double('dish', name: 'Lasagne', price: 10.00) }
  let(:dish_dbl3) { double('dish', name: 'Tiramisu', price: 5.20) }

  it 'takes a variable number of dish argument' do
    expect(Menu).to respond_to(:new).with_unlimited_arguments
  end

  it 'stores the provided dishes' do
    expect(menu.dishes).to eq([dish_dbl1, dish_dbl2, dish_dbl3])
  end

  describe '#format' do
    it 'returns a string with formatted menu header and dishes' do
      expected = \
        "Dish                 Price\n"\
        "----------------------------\n"\
        "Pepperoni pizza      £8.99\n"\
        "Lasagne              £10.00\n"\
        "Tiramisu             £5.20"

      expect(menu.format).to eq(expected)
    end
  end

  describe '#find_dish(dish_name)' do
    it 'takes a dish name as an argument' do
      expect(menu).to respond_to(:find_dish).with(1).argument
    end

    it 'raises an error is the dish name cannot be found' do
      expect { menu.find_dish('test') }.to raise_error(RuntimeError)
    end

    it 'returns the dish object with the given dish name' do
      expect(menu.find_dish('Pepperoni PIZZA')).to eq(dish_dbl1)
      expect(menu.find_dish('lasagne')).to eq(dish_dbl2)
    end
  end

end
