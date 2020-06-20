require 'menu'

describe Menu do
  describe 'initialize' do
    it 'has a menu when initialized' do
      menu = Menu.new
      expect(menu).to be_an_instance_of(Menu)
    end
    
    it 'creates a menu hash' do
      menu = Menu.new
      expect(menu.full_menu).to include({ "1. cheeseburger" => "£5" })
    end
  end
  
  describe '#view_menu' do
    it 'allows the customer to see the full menu' do
      menu = Menu.new
      expect(menu.view_menu).to eq(menu.full_menu)
    end
  end
  
  describe '#choose_dishes' do
    it 'allows the customer to choose a dish' do
      menu = Menu.new
      expect(menu.choose_dishes).to eq("You have chosen #{menu.full_menu { 1 }}, thank you for ordering")
    end
  end
end
