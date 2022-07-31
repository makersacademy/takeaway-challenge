require "menu"

describe Menu do
  let(:menu) { Menu.new }
  let(:pizza) { double :dish, :name => "Pizza", :price => 8.00 }

  describe "#list" do
    it "lists menu with dishes and prices" do
      menu.add(pizza)
      expect(menu.list).to eq("#{pizza.name} | #{pizza.price}")
    end
  end

  describe "#add" do
    it "adds a dish to the menu" do
      menu.add(pizza)
      expect(menu.dishes).to include(pizza)
    end
  end
end
