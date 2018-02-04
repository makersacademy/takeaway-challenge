require 'menu'

describe Menu do

  subject(:menu) { described_class.new(test_menu) }
  let(:test_menu) { { "Dish_1" => 3.50, "Dish_2" => 4 } }
  let(:printed_test_menu) { "Menu\n----------\nDish_1: £3.50\nDish_2: £4.00\n" }

  it 'stores an array of dishes and prices' do
    expect(menu.dishes).to be_an_instance_of(Hash)
  end

  describe '#print' do
    it 'returns the menu in a clear format' do
      expect { menu.print }.to output(printed_test_menu).to_stdout
    end
  end

end
