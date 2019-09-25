# restaurant_spec.rb
require "restaurant"

describe Restaurant do
  let(:cafe_melvino) { described_class.new }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  # INFERRED USER STORY
  # As a restaurant owner
  # So that my customers can know what I sell
  # I would like to add dishes to a menu list, and view the menu

  describe "#add_dish" do
    it "creates a new Dish instance and returns an updated menu list" do
      pizza, pasta = double("Dish.new")
      cafe_melvino.add_dish(pizza)
      expect(cafe_melvino.add_dish(pasta)).to eq [pizza, pasta]
    end
  end

  describe "#menu" do
    it "displays the menu" do
      pizza, pasta = double("Dish.new")
      cafe_melvino.add_dish(pizza)
      cafe_melvino.add_dish(pasta)
      menu = [pizza, pasta]
      expect(cafe_melvino.menu).to eq menu
    end
  end
end
