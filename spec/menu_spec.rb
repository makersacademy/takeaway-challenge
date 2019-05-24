require 'menu'

describe Menu do
  context "#initialize" do
    it "should list all menu items and prices" do
      expect(subject.menu_items).not_to be_nil
    end
  end

  context "#price" do
    it "should return the price of an item" do
      expect(subject.price("pizza")).to eq(5.00)
    end
  end
end
