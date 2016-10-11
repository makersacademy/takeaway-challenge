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
end