require './lib/menu.rb'

describe Menu do
  let(:dish_double_1) { double(:dish, name: 'Southern fried chicken', price: 9.00) }
  let(:dish_double_2) { double(:dish, name: 'Chicken-skin fries', price: 3.00) }

  let(:dishes) { {
    1 => dish_double_1,
    2 => dish_double_2
   } }

  let(:menu) { Menu.new(dishes: dishes) }

  def dish_to_string(number, dish)
    dish_price = '%.2f' % dish.price
    "#{number}. "\
      "#{dish.name} - £#{dish_price}"
  end

  it 'should display the menu, showing each dish and its number' do
    allow(STDOUT).to receive(:puts)

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
