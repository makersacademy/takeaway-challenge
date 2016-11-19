require "menu_item"

describe MenuItem do
  subject(:menu_item) {described_class.new}
  let(:dish) {double(:dish)}

  describe "when instantiated" do
    it "should have a dish" do
      expect(menu_item).to be_instance_of(MenuItem)
    end

    it "should have no dish" do
      expect(menu_item.dish).to be_nil
    end

    it "there should be no amount" do
      expect(menu_item.amount).to be_nil
    end
  end

  describe "when managing a dish" do

    it "should be able to add a dish" do
      expect(menu_item.add(dish)).not_to be_nil
    end

    it "should have an amount of the dish available" do
      menu_item.add(dish)
      expect(menu_item.amount).to eq MenuItem::DEFAULT_AMOUNT
    end
  end

end
