require 'menu'
require 'order'

describe Menu do
  subject(:menu) { (Menu.new) }
  let(:dishes) { double(:dishes) }
    
  describe '#Dishes' do

    it 'should contain a hash displaying the contents of the menu' do
      expect(menu.dishes).to be_an_instance_of Hash
    end
  end
  
  describe '#Print_menu' do
      
    #it 'should print the menu created in the dishes menu' do
        #expect(menu.print_menu).to include Fries | Cost
    #end
  end
end