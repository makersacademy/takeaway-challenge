require 'menu'

describe Menu do

  subject(:menu) { Menu.new(dish_dbl1, dish_dbl2, dish_dbl3) }
  let(:dish_dbl1) { double('dish', name: 'Pepperoni pizza', price: 8.99) }
  let(:dish_dbl2) { double('dish', name: 'Lasagne', price: 10.00) }
  let(:dish_dbl3) { double('dish', name: 'Tiramisu', price: 5.20) }

  it 'has a list of dishes' do
    expect(menu.dishes).to be_an_instance_of(Array)
  end

  describe '#view' do
    it 'prints the menu in a nice format' do
      expected = "Dish                 Price\n----------------------------\nPepperoni pizza      £8.99\nLasagne              £10.00\nTiramisu             £5.20\n"
      expect{ menu.view }.to output(expected).to_stdout
    end
  end

end