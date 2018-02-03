require 'restaurant'

describe Restaurant do

  subject(:restaurant) { described_class.new(menu) }
  let(:menu) { double 'menu' }
  let(:test_menu) { { "Dish_1" => 3.50, "Dish_2" => 4 } }
  let(:printed_test_menu) { "Menu\nDish_1: £3.50\nDish_2: £4.00\n" }

  it "stores a new menu object" do
    expect(restaurant.menu).to eq menu
  end

  describe 'show_menu' do
    it 'returns the printed menu' do
      allow(menu).to receive(:dishes).and_return(test_menu)
      allow(menu).to receive(:print).and_return(printed_test_menu)
      expect(restaurant.show_menu).to eq printed_test_menu
    end
  end

end
