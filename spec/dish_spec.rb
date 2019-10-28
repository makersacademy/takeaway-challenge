require "dish"

describe Dish do
  context "Dish Class" do
    subject { described_class.new("Chicken Curry", 8.99) }
    it "has a name and price" do
      expect(subject).to have_attributes(:name => "Chicken Curry", :price => 8.99)
    end
  end
end
