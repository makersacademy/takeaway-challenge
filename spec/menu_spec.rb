require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  let(:menu_item) {double(:menu_item)}
  let(:menu_item2) {double(:menu_item2)}

  describe "When instantiated" do
    it "should have a default name" do
      expect(menu.name).to eq Menu::DEFAULT_NAME
    end
  end

  describe "When handling dishes" do
    before(:each) {menu.add(menu_item)}

    #allow(item2).to receive(:amount).and_return(2)

    it "should be able to add a dish to the menu" do
      expect(menu.menu_items.count).to eq 1
    end

    it "should be able to delete a dish from the menu" do
      menu.delete(menu_item)
      expect(menu.menu_items.count).to eq 0
    end

    it "should only show available dishes" do
      menu.add(menu_item2)
      allow(menu_item).to receive(:amount).and_return(2)
      allow(menu_item2).to receive(:amount).and_return(0)
      expect(menu.available_items.count).to eq 1
    end
  end

end
