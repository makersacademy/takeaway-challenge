require './lib/menu.rb'

describe Menu do
  let (:menu) { Menu.new }

  def dish_to_string(dish)
    dish_price = '%.2f' % dish[:price]
    dish_as_string = "#{dish[:number].to_s}. "\
      "#{dish[:name]} - £#{dish_price}"
  end

  it 'should display the menu, showing each dish and its number' do
    allow(STDOUT).to receive(:puts)

    menu.display_menu

    Menu::DISHES.each do |dish|
      expect(STDOUT).to have_received(:puts).with(dish_to_string(dish))
    end
  end
end