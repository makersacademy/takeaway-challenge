require 'shop'

describe Shop do

  describe '#view_menu' do
    it 'should display the list of dishes available' do
      shop = Shop.new
      shop.add_dish("Fries", 2)
      shop.add_dish("Eggs", 3)
      expect(shop.view_menu.last).to include({dish_name: "Eggs"})
    end
    it 'should include the dish prices' do
      shop = Shop.new
      shop.add_dish("Fries", 2)
      shop.add_dish("Eggs", 3)
      expect(shop.view_menu.first).to include({price: 2})
    end


  end

end

=begin

describe Shop do
  describe '#view_menu' do
    let(:menu){ [ {dish_name: "Eggs", price: 3}, {dish_name: "Fries", price: 2} ] }
    it 'should display the list of dishes available' do
      expect(subject.menu.first).to include({dish_name: "Eggs"})
    end
    it 'should include the dish prices' do
      expect(subject.view_menu.last).to include({price: 2})
    end


  end

end

=end