require 'menu'

describe Menu do
  
  before(:each) do
    @dish_double = double('dish', name:'Yummy', price: 9.99)
    @dish_class_double = double('dish_class', new: @dish_double)
    @menu = Menu.new(@dish_class_double)
  end
  
  describe '#initialised' do
    
    it 'is initialised with an empty array' do
      expect(@menu.get(0)).to be_nil
    end

  end
end
