require './lib/takeaway-app.rb'

describe TakeawayApp do
  subject(:takeawayapp) { described_class.new(restaurant) }
  
  let(:restaurant) { double 'restaurant', menu: [
    { food: 'Margarita', price: 10 },
    { food: 'Peperoni', price: 12 },
    { food: 'Hawaiin', price: 12 },
    { food: 'Vegetarian', price: 11 }]
  }

  describe "#restaurant_menu" do
    it "receives menu from Restaurant" do
      expect(takeawayapp.restaurant_menu).to eq(restaurant.menu)
    end
  end

  describe "#menu" do
    it "receives a menu selection from the user" do
      selection, qty, total = 'Margarita', 1, 10
      takeawayapp.menu(selection, qty, total)
      selection, qty, total = 'Pepperoni', 2, 24
      takeawayapp.menu(selection, qty, total)
      selection, qty, total = 'Vegetarian', 3, 33
      takeawayapp.menu(selection, qty, total)
      expect(takeawayapp.menu_selection).to eq [['Margarita', 1, 10], ['Pepperoni', 2, 24], ['Vegetarian', 3, 33]]
    end
  end
end
