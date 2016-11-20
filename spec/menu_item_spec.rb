require "menu_item"

describe MenuItem do
  let(:dish) {double(:dish)}
  subject(:menu_item) {described_class.new(dish)}

  describe "when instantiated" do
    it "should have a dish" do
      expect(menu_item).to be_instance_of(MenuItem)
    end

    it "there should be a default amount" do
      expect(menu_item.amount).to eq MenuItem::DEFAULT_AMOUNT
    end
  end

  describe "when managing a menu item" do

    it "should return true if there are any available" do
      expect(menu_item.available?).to be true
    end

    it "should return false if there are no available" do
      item = MenuItem.new(dish, 0)
      expect(item.available?).to be false
    end
  end

end
