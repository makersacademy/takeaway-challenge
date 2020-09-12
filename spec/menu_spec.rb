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

end