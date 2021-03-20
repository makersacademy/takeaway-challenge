require 'restaurant'

describe Restaurant do
  let(:restaurant) { Restaurant.new }

  describe 'display_menu' do
    it 'displays a menu of one dish to the user' do
      restaurant.design_dish("Pizza", "5")
      expect(restaurant.display_menu).to eq("Pizza: 5\n")
    end
    it 'displays a menu of two dishes to the user' do
      restaurant.design_dish("Pizza", "5")
      restaurant.design_dish("Pasta", "4")
      expect(restaurant.display_menu).to eq("Pizza: 5\nPasta: 4\n")
    end
  end

  describe 'add_to_order' do
    it 'stores selected available dishes from the menu' do
      dish1 = double(name: "Pizza", price: "5", available: true)
      dish2 = double(name: "Pasta", price: "4", available: true)
      menu = double(dishes: [dish1, dish2])
      restaurant = Restaurant.new(menu)
      restaurant.add_to_order("Pasta")
      restaurant.add_to_order("Pizza")
      expect(restaurant.order).to include(dish1)
      expect(restaurant.order).to include(dish2)
    end
    it 'returns No dish found if selection not on menu' do
      expect(restaurant.add_to_order("Burger")).to eq("No dish found")
    end
  end

  describe 'dish_unavailable' do
    it 'updates the menu so customers cannot select an unavailable dish' do
      # Perhaps double not suitable as I want to test dish_unavailable
      # by changing available from true to false within the double.
      # dish = double(name: "Pizza", price: "5", available: false)
      # menu = double(dishes: [dish])
      # restaurant = Restaurant.new(menu)
      restaurant.design_dish("Pizza", "5")
      restaurant.dish_unavailable("Pizza")
      expect(restaurant.add_to_order("Pizza")).to eq("Dish not available")
    end
  end

  describe 'display_order' do
    it 'displays the selected dishes and the sub-total of the order' do
      restaurant.design_dish("Pizza", "5")
      restaurant.add_to_order("Pizza")
      expect(restaurant.display_order).to eq("Pizza: 5\nTotal: 5\n")
    end
  end

  describe 'order_complete' do
    it 'returns a message to confirm an order before a maximum wait time' do
      # stubs time at 20:17
      allow(Time).to receive(:now) { Time.new(2002, 10, 31, 20, 17) }
      expect(restaurant.order_complete).to eq("Thank you! Your order was placed and will be delivered before 21:17")
    end
  end
end
