require "takeaway"

describe Takeaway do
subject(:takeaway) { described_class.new }

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  describe "#list_of_dishes" do
    it "should show a list of dishes with the prices" do
      expect(takeaway.list_of_dishes).to eq({ chicken: 4.99, fish: 5.50, beef: 4.99, vegetarian: 4.50})
    end
  end
end
