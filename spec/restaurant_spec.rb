require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print_menu: food_list) }
  let(:food_list) { "Pizza: £5.00" }

  it 'shows menu of food and prices' do
    expect(restaurant.show_menu).to eq(food_list)
  end

end
