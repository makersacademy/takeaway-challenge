require 'menu'

describe Menu do

  subject(:menu) { Menu.new(dish_dbl1, dish_dbl2, dish_dbl3) }
  let(:dish_dbl1) { double('dish', name: 'Pepperoni pizza', price: 8.99, format: 'Pepperoni pizza      £8.99') }
  let(:dish_dbl2) { double('dish', name: 'Lasagne', price: 10.00, format: 'Lasagne              £10.00') }
  let(:dish_dbl3) { double('dish', name: 'Tiramisu', price: 5.20, format: 'Tiramisu             £5.20') }

  it 'takes an undefined number of dish parameters' do
    expect(Menu).to respond_to(:new).with_unlimited_arguments
  end

  it 'stores the provided dishes' do
    expect(menu.dishes).to eq([dish_dbl1, dish_dbl2, dish_dbl3])
  end

  describe '#view' do
    it 'prints the menu in a nice format with a header' do
      header = "Dish                 Price\n----------------------------"
      expected = "#{header}\n#{dish_dbl1.format}\n#{dish_dbl2.format}\n#{dish_dbl3.format}\n"
      expect{ menu.view }.to output(expected).to_stdout
    end
  end

end