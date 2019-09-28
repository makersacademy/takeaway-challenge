# restaurant_spec.rb
require "restaurant"

describe Restaurant do
  let(:cafe_melvino) { described_class.new }
  let(:pizza) { double "Dish.new", name: "Pizza", price: 8.5 }
  let(:pasta) { double "Dish.new", name: "Pasta", price: 7.5 }

  # INFERRED USER STORY
  # As a restaurant owner
  # So that my customers can know what I sell
  # I would like to add dishes to a menu list, and view the menu

  before(:each) do
    cafe_melvino.add_dish(pizza)
  end

  describe "#add_dish" do
    it "creates a new Dish instance and returns an updated menu list" do
      expect(cafe_melvino.add_dish(pasta)).to eq [pizza, pasta]
    end
  end

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  describe "#menu" do
    it "displays the menu" do
      cafe_melvino.add_dish(pasta)
      menu = ["#{pizza.name}: #{"%.2f" % pizza.price}", "#{pasta.name}: #{"%.2f" % pasta.price}"]
      expect(cafe_melvino.menu).to eq menu
    end
  end
end
