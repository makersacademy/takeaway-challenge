require './lib/menu'
require './lib/dish'

choripan = Dish.new(:choripan, 5.95)
milanesa = Dish.new(:milanesa, 7.95)
menu1 = Menu.new(choripan, milanesa)


describe Menu do

  describe '#initialize' do
    it "initializes an array which includes dish objects" do
      expect(menu1.dish_items).to include(choripan, milanesa)
    end

  end

end
