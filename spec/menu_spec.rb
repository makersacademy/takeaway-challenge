require 'menu'

describe Menu do
  let(:dish1) { double :dish1, name: "dish1", price: 4.50 }
  let(:dish2) { double :dish2, name: "dish2", price: 3.00 }
  let(:dish3) { double :dish3, name: "dish3", price: 2.50 }

  subject(:menu) { described_class.new [dish1, dish2, dish3] }

  describe "#initialize" do
    it "shouldn't be possible to change the menu by altering passed array" do
      dishes = [dish1, dish2, dish3]
      menu = described_class.new dishes
      dishes[0] = double :dish4, name: "dish4", price: 6.00
      expect(menu.select_dish(1)).to eq dish1
    end
  end

  describe "#list_dishes" do
    it "should return a formatted string of the dishes" do
      output = "Number | Dish".ljust(32) + "Price\n"
      [dish1, dish2, dish3].each_with_index do |dish, i|
        output << "[#{i+1}]".ljust(9)
        output << dish.name.ljust(20, '.')
        output << ("%.2f\n" % [dish.price]).rjust(9,'.')
      end
      expect(menu.list_dishes).to eq output
    end
  end

  describe "#select_dish" do
    it "should return a dish from its menu" do
      expect(menu.select_dish(2)).to eq dish2
    end

    it "should return nil if the menu item doesn't exist" do
      expect(menu.select_dish(6)).to eq nil
    end
  end
end
