require './lib/menu'

choripan = Dish.new(:choripan, 5.95)
milanesa = Dish.new(:milanesa, 7.95)
menu1 = Menu.new(choripan, milanesa)


describe Menu do

  describe '#initialize' do
    it "initializes a hash which includes dishes and prices" do
      expect(menu1.menu_items).to include { {:choripan=>5.95, :milanesa=>7.95} }
    end

  end

end
