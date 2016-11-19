require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  let(:dish) {double(:dish)}
  let(:dish2) {double(:dish2)}

  describe "When handling dishes" do
    before(:each) {menu.create(dish, 1)}

    it "should be able to add a dish to the menu" do
      expect(menu.menu_items.count).to eq 1
    end

    it "should only show available dishes" do
      menu.create(dish2, 0)
      expect(menu.available_dishes.count).to eq 1
    end
  end

end
