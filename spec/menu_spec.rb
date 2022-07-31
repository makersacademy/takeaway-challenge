require 'menu'

describe Menu do
  subject(:menu) { described_class.new } 

  it 'checks there are menu items available' do 
    expect(menu.show_menu).to eq({"Prawn chow mein" => 4.50, "Egg fried rice" => 2.50, "Vegetable fried rice" => 2.75})
  end 

  it 'allows menu items to be changed' do
    menu = Menu.new({"Sweet and sour chicken" => 5.50, "Vegetable fried rice" => 2.50, "Beansprouts" => 3.50})
    expect(menu.show_menu).to eq({"Sweet and sour chicken" => 5.50, "Vegetable fried rice" => 2.50, "Beansprouts" => 3.50})
  end 

end 
