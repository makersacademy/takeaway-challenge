require 'menu'

describe Menu do
  
  let(:menu_item) { "7. Vanilla Ice Cream £3.00" }

  describe "#dishes" do
    # Test to check whether dishes have prices
    it "has a price" do
      expect(subject.dishes.values).to all( be_a(Float) )
    end
  end

  describe "#list" do
    # Test to check if sample menu returns list of dishes
    it "shows a list of dishes" do
      expect(subject.list).to include  menu_item
    end
  end

end
