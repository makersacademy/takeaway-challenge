require 'shop'

describe Shop do
  let(:dish) { Dish.new('Fries', 1.99) }

  describe '#view_menu' do
    it 'should display the list of dishes available' do
      shop = Shop.new("Takeaway")
      shop.add_dish("Fries", 2)
      shop.add_dish("Eggs", 3)
      expect(shop.view_menu.last).to include({dish_name: "Eggs"})
    end
    it 'should include the dish prices' do
      shop = Shop.new("Takeaway")
      shop.add_dish("Fries", 2)
      shop.add_dish("Eggs", 3)
      expect(shop.view_menu.first).to include({price: 2})
    end


  end

end