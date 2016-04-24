require 'menu'

describe Menu do
  subject(:menu){ described_class.new }
  it 'displays the menu' do
    menus = {"Fried Rice" => 5.99, "Chicken Chow Mein" => 7.99,
      "Cheeseburger" => 6.99, "Pizza" => 8.99}
    expect(menu.display_menu).to eq menus
  end
end
