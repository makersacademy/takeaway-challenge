require 'menu'

describe Menu do
  subject(:menu) { (Menu.new) }
    
  describe '#dishes' do

    it 'should contain a list of dishes and their corresponding prices' do
      expect(menu.dishes).to include(:Fries => 2, :Kebab => 4)
    end
      
    it 'expects the list of dishes to be contained inside a hash' do
      expect(menu.dishes).to be_an_instance_of Hash
    end
  end
  
  describe '#view_menu' do
    
    it 'allows a potential customer to view the menu' do
      expect(menu.view_menu).to include(:Pizza => 5, :Burger => 3)
    end
  end
end