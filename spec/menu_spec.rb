require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  let(:dish) {double(:dish)}

  describe "When handling dishes" do
    before(:each) {menu.create("name", 10, 1)}

    it "should be able to add a dish to the menu" do
      expect(menu.menu_items.count).to eq 1
    end

    it "should only show available dishes" do
      menu.create("name", 10, 0)
      expect(menu.available_dishes.count).to eq 1
    end
  end

end
