require './lib/menu.rb'

describe Menu do
  let(:dish_class_double) { double(:dish_class) }
  let(:menu) { Menu.new(dish_class: dish_class_double) }
  let(:dishes) { Menu::DISHES }

  let(:dish_double_1) { double(:dish_1, name: dishes[1][:name], price: dishes[1][:price]) }
  let(:dish_double_2) { double(:dish_2, name: dishes[2][:name], price: dishes[2][:price]) }

  before(:each) do
    allow(dish_class_double).to receive(:new)
      .and_return(
        dish_double_1, 
        dish_double_2
        )

    allow(STDOUT).to receive(:puts)
  end

  def dish_to_string(number, dish)
    dish_price = '%.2f' % dish[:price]
    "#{number}. "\
      "#{dish[:name]} - £#{dish_price}"
  end

  it 'should display the menu, showing each dish and its number' do
    menu.display_menu

    dishes.each do |number, dish|
      expect(STDOUT).to have_received(:puts).with(dish_to_string(number, dish))
    end
  end

  describe 'when dish is selected from menu' do
    it 'should return that dish' do
      expect(menu.select(dish_no: 2)).to eq(dish_double_2)
    end
  end
end
