require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  let(:dish) {double(:dish)}

  describe "When instantiated" do
    it "should have a default name" do
      expect(menu.name).to eq Menu::DEFAULT_NAME
    end
  end

  describe "When handling dishes" do
    before(:each) {menu.add_dish(dish)}

    it "should be able to add a dish to the menu" do
      expect(menu.dishes.count).to eq 1
    end

    it "should be able to delete a dish from the menu" do
      menu.delete_dish(dish)
      expect(menu.dishes.count).to eq 0
    end
  end

end
