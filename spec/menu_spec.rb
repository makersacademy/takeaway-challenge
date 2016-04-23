require 'menu'

describe Menu do
  subject(:menu){ described_class.new }
  it 'displays the menu' do
    menus = {"Fried Rice": 5, "Chicken Chow Mein": 7, "Cheeseburger": 6, "Pizza": 8}
    expect(menu.display_menu).to eq menus
  end
end
