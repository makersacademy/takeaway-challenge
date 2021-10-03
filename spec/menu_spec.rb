require "menu"

describe Menu do
  let(:menu) { Menu.new }

  describe "#list" do
    it "lists menu with dishes and prices" do
      menu.add(:dish_name)
      expect(menu.list).to eq([:dish_name])
    end
  end
  describe "#add" do
    it "adds a dish to the menu" do
      menu.add(:dish_name)
      expect(menu.dishes).to include(:dish_name)
    end
  end
end
